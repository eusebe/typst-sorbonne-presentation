#import "@preview/presentate:0.2.3" as p
// On importe la version locale modifiée de navigator
#import "../typst-navigator/lib.typ" as nav

// --- Configuration et Couleurs ---
#let sorbonne-red = rgb("#AC182E")
#let sorbonne-blue = rgb("#1D2769")
#let sorbonne-text = rgb("#263068")

// Assets
#let logo-univ-white = "assets/logo/sorbonne-univ-white.png"
#let logo-sante-color = "assets/logo/sorbonne-sante.png"

// État pour la configuration du thème
#let config-state = state("sorbonne-config", none)

// --- Composants ---

#let breadcrumb() = context {
  let conf = config-state.get()
  if conf == none { return none }
  set text(size: 0.8em, fill: gray.darken(20%))
  
  let mapping = conf.mapping
  let level-modes = (level-1-mode: "none", level-2-mode: "none", level-3-mode: "none")
  for role in ("part", "section", "subsection") {
    let lvl = mapping.at(role, default: none)
    if lvl != none { level-modes.insert("level-" + str(lvl) + "-mode", "current") }
  }
  
  nav.progressive-outline(
    ..level-modes,
    layout: "horizontal",
    separator: text(fill: gray.lighten(50%), "  /  "),
    clickable: false,
    show-numbering: conf.show-header-numbering,
    text-styles: (
      level-1: (active: (weight: "bold", fill: sorbonne-text)),
      level-2: (active: (weight: "regular", fill: gray.darken(20%))),
      level-3: (active: (weight: "regular", fill: gray.darken(20%)))
    )
  )
}

#let apply-layout(title: none, body) = context {
  let config = config-state.get()
  let resolved-title = if title != none { title } else { nav.resolve-slide-title(none) }

  set text(font: "Fira Sans", size: 18pt, fill: sorbonne-text)
  
  grid(
    columns: 100%,
    rows: (auto, 1fr, auto),
    block(width: 100%, inset: (x: 2em, top: 1.2em, bottom: 0.5em), {
      grid(
        columns: (4.5em, 1fr),
        column-gutter: 1.5em,
        align: horizon,
        image(logo-sante-color, width: 4.5em),
        if resolved-title != none {
          text(size: 1.1em, weight: "bold", fill: sorbonne-text, smallcaps(resolved-title))
        }
      )
    }),
    block(width: 100%, inset: (x: 2.5em, y: 1em), {
      metadata((t: "ContentSlide"))
      body
    }),
    block(width: 100%, inset: (x: 2.5em, bottom: 1.2em, top: 0.5em), {
      set text(size: 0.65em, fill: gray.darken(20%))
      line(length: 100%, stroke: 0.5pt + gray.lighten(80%))
      v(0.5em)
      grid(
        columns: (1fr, 2fr, 1fr),
        align: (left, center, right),
        config.author,
        breadcrumb(),
        context {
          let current = counter(page).display()
          let total = counter(page).final().at(0)
          [#current / #total]
        }
      )
    })
  )
}

#let empty-slide(fill: none, body) = {
  set page(margin: 0pt, fill: fill, header: none, footer: none)
  p.slide(logical-slide: false, block(width: 100%, height: 100%, body))
}

// --- Transitions ---

#let sorbonne-transition(h, roadmap) = {
  empty-slide(fill: sorbonne-red, {
    set text(fill: white, font: "Fira Sans") 
    place(top + left, pad(top: 2em, left: 2em, image(logo-univ-white, width: 5em)))
    place(hide(h)) 
    
    context {
      let conf = config-state.get()
      let mapping = conf.mapping
      let active = nav.get-active-headings(h.location())
      
      let role = none
      for (r, lvl) in mapping { if lvl == h.level { role = r; break } }
      
      if role == "part" {
        align(center + horizon, stack(
          spacing: 1.5em,
          if conf.show-header-numbering {
            text(size: 6em, weight: "bold", numbering("I", counter(heading).at(h.location()).at(0)))
          },
          text(size: 3em, weight: "bold", upper(h.body))
        ))
      } else {
        let part-lvl = mapping.at("part", default: none)
        let active-part = if part-lvl != none { active.at("h" + str(part-lvl), default: none) } else { none }
        if active-part != none {
          place(top + right, pad(top: 2.5em, right: 3em, text(size: 0.8em, fill: white.transparentize(30%), weight: "bold", upper(active-part.body))))
        }
        
        let section-lvl = mapping.at("section", default: 1)
        let section-head = active.at("h" + str(section-lvl), default: h)
        let count = counter(heading).at(section-head.location())
        let section-num = if mapping.keys().contains("part") { count.at(1, default: count.at(0)) } else { count.at(0) }
        
        pad(x: 2em, stack(
          dir: ttb,
          v(15%),
          align(center, stack(
            spacing: 0.8em, 
            text(size: 6em, weight: "bold", str(section-num)),
            text(size: 2.2em, weight: "bold", smallcaps(section-head.body)),
            v(1.2em),
            block(width: 60%, align(left, roadmap))
          ))
        ))
      }
    }
  })
}

// --- API ---

#let slide(..args) = {
  let pos = args.pos()
  let named = args.named()
  let manual-title = named.at("title", default: none)
  let body = if pos.len() > 0 { pos.at(0) } else { none }
  let clean-named = named
  if "title" in clean-named { let _ = clean-named.remove("title") }
  p.slide(..clean-named, apply-layout(title: manual-title, body))
}

#let template(
  title: none,
  author: none,
  affiliation: none,
  subtitle: none,
  date: datetime.today().display(),
  aspect-ratio: "16-9",
  text-font: "Fira Sans",
  text-size: 20pt,
  show-header-numbering: true,
  mapping: (section: 1, subsection: 2),
  transitions: (:),
  body
) = {
  config-state.update(c => (
    author: author,
    affiliation: affiliation,
    show-header-numbering: show-header-numbering,
    mapping: mapping,
  ))
  
  nav.navigator-config.update(c => {
    c.mapping = mapping
    c.auto-title = true
    c.show-heading-numbering = show-header-numbering
    c
  })

  set page(paper: "presentation-" + aspect-ratio, margin: 0pt, header: none, footer: none)
  set text(font: text-font, size: text-size, fill: sorbonne-text)
  show math.equation: set text(font: "Fira Math")
  
  set heading(numbering: (..nums) => {
    if not show-header-numbering { return none }
    let n = nums.pos()
    let role = none
    for (r, lvl) in mapping { if lvl == n.len() { role = r; break } }
    if role == "part" { numbering("I", ..n) }
    else if role == "section" { 
      let start-idx = if mapping.keys().contains("part") { 1 } else { 0 }
      if n.len() > start-idx { numbering("1.", ..n.slice(start-idx)) }
    }
    else if role == "subsection" {
      let start-idx = if mapping.keys().contains("part") { 1 } else { 0 }
      if n.len() > start-idx { numbering("1.1", ..n.slice(start-idx)) }
    }
  })

  empty-slide(fill: sorbonne-red, {
    set text(fill: white)
    place(bottom + right, pad(bottom: 2em, right: 2em, image(logo-univ-white, width: 6em)))
    align(horizon, pad(x: 3em, y: 2em, stack(
      spacing: 1.2em,
      text(size: 2.5em, weight: "bold", smallcaps(title)),
      if subtitle != none { text(size: 1.4em, style: "italic", subtitle) },
      v(1.5em),
      text(size: 1.2em, weight: "bold", author),
      text(size: 1em, affiliation),
      text(size: 0.9em, fill: white.transparentize(20%), date),
    )))
  })

  show heading: h => {
    if not mapping.values().contains(h.level) { return h }
    nav.render-transition(
      h,
      mapping: mapping,
      slide-func: (fill: none, roadmap) => sorbonne-transition(h, roadmap),
      top-padding: 0pt, // On utilise la nouvelle option
      transitions: (
        parts: (visibility: (part: "none", section: "none", subsection: "none")),
        sections: (visibility: (part: "none", section: "none", subsection: "current-parent")),
        subsections: (visibility: (part: "none", section: "none", subsection: "current-parent")),
        style: (active-weight: "bold", active-color: white, inactive-opacity: 0.5, completed-opacity: 0.5),
        marker: none, // Suppression des puces
      ) + transitions,
      show-heading-numbering: show-header-numbering
    )
  }
  
  body
}