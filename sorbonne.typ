#import "@preview/presentate:0.2.3" as p
#import "@preview/presentate:0.2.3": pdfpc
// On importe la version locale modifiée de navigator
#import "../typst-navigator/lib.typ" as nav

// --- Configuration et Couleurs ---
#let sorbonne-red = rgb("#AC182E")
#let sorbonne-blue = rgb("#1D2769")
#let sorbonne-lightblue = rgb("#52B5E5")
#let sorbonne-yellow = rgb("#FFB700")
#let sorbonne-text = rgb("#263068")

// État pour la configuration du thème
#let config-state = state("sorbonne-config", none)
#let last-main-page = state("last-main-page", none)

// --- Composants ---

#let empty-slide(fill: none, body) = {
  set page(margin: 0pt, fill: fill, header: none, footer: none)
  p.slide(logical-slide: true, block(width: 100%, height: 100%, body))
}

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
      level-1: (active: (weight: "bold", fill: conf.primary-color)),
      level-2: (active: (weight: "regular", fill: conf.primary-color)),
      level-3: (active: (weight: "regular", fill: conf.primary-color))
    )
  )
}

#let apply-layout(title: none, body) = context {
  let config = config-state.get()
  let resolved-title = if title != none { title } else { nav.resolve-slide-title(none) }

  set text(font: config.text-font, size: config.text-size, fill: sorbonne-text)
  
  grid(
    columns: 100%,
    rows: (auto, 1fr, auto),
    block(width: 100%, inset: (x: 2em, top: 0.8em, bottom: 0.2em), {
      grid(
        columns: (4.5em, 1fr),
        column-gutter: 1.5em,
        align: horizon,
        image(config.logo-slide, width: 4.5em),
        if resolved-title != none {
          text(size: 1.1em, weight: "bold", fill: sorbonne-text, smallcaps(resolved-title))
        }
      )
    }),
    block(width: 100%, height: 100%, inset: (x: 2.5em, y: 0.5em), {
      metadata((t: "ContentSlide"))
      body
    }),
    block(width: 100%, inset: (x: 2.5em, bottom: 0.8em, top: 0.2em), {
      set text(size: 0.65em, fill: gray.darken(20%))
      line(length: 100%, stroke: 0.5pt + gray.lighten(80%))
      v(0.5em)
      grid(
        columns: (1fr, 2fr, 1fr),
        align: (left, center, right),
        config.author,
        breadcrumb(),
        context {
          let current = here().page()
          let appendix-marker = query(<sorbonne-appendix-marker>)
          let total = if appendix-marker.len() > 0 {
            appendix-marker.first().location().page() - 1
          } else {
            counter(page).final().at(0)
          }
          [#current / #total]
        }
      )
    })
  )
}

#let focus-slide(body) = context {
  let conf = config-state.get()
  empty-slide(fill: conf.primary-color, {
    place(top + left, pad(top: 2em, left: 2em, image(conf.logo-transition, width: 5em)))
    set text(fill: white, size: 2.5em, weight: "bold")
    align(center + horizon, body)
  })
}

#let alert(body) = context {
  let conf = config-state.get()
  text(fill: conf.alert-color, weight: "bold", body)
}

#let muted(body) = text(fill: gray, body)

#let subtle(body) = text(fill: gray.lighten(40%), body)

#let speaker-note(body) = {
  pdfpc.speaker-note(body)
}

#let side-by-side(left-body, right-body, columns: (1fr, 1fr), gutter: 2em) = {
  grid(
    columns: columns,
    column-gutter: gutter,
    left-body,
    right-body
  )
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

#let figure-slide(fig, title: none, caption: none, ..args) = {
  slide(title: title, ..args, {
    set align(center + horizon)
    figure(fig, caption: caption)
  })
}

#let figure-slide-split(fig-left, fig-right, title: none, caption-left: none, caption-right: none, ..args) = {
  slide(title: title, ..args, {
    set align(center + horizon)
    grid(
      columns: (1fr, 1fr),
      column-gutter: 2em,
      figure(fig-left, caption: caption-left),
      figure(fig-right, caption: caption-right)
    )
  })
}

#let acknowledgement-slide(
  title: "Acknowledgements",
  subtitle: none,
  people: (),
  institutions: (),
  extra: none,
  ..args
) = {
  slide(title: title, ..args, {
    set align(center + horizon)
    stack(
      dir: ttb,
      spacing: 1.5em,
      
      if subtitle != none {
        text(size: 1.1em, style: "italic", subtitle)
      },

      if people.len() > 0 {
        align(center, grid(
          columns: (auto, auto),
          column-gutter: 2em,
          row-gutter: 1em,
          ..people.map(p => (
            align(right, text(weight: "bold", p.name)),
            align(left, p.role)
          )).flatten()
        ))
      },
      
      if institutions.len() > 0 {
        v(0.5em)
        align(center, institutions.join([ #h(2em) ]))
      },

      if extra != none {
        v(1em)
        extra
      }
    )
  })
}

#let cite-box(bib-key, display-label: none, position: "bottom-right") = context {
  let conf = config-state.get()
  
  let align-pos = if position == "top-right" { top + right }
    else if position == "bottom-left" { bottom + left }
    else { bottom + right }
  
  // On pousse la boite légèrement dans les marges latérales
  // 1em permet d'être excentré sans être collé au bord (qui est à 2.5em de la zone de texte)
  let dx = if "right" in position { 1em } else { -1em }
  let dy = if "top" in position { -0.3em } else { 0.3em }

  let content = if display-label != none {
    display-label
  } else {
    let keys = if type(bib-key) == array { bib-key } else { (bib-key,) }
    let labels = keys.map(k => if type(k) == str { label(k) } else { k })
    cite(..labels)
  }

  place(align-pos, dx: dx, dy: dy, block(
    fill: conf.primary-color.lighten(95%),
    stroke: 0.5pt + conf.primary-color,
    radius: 3pt,
    inset: 0.4em, 
    text(size: 0.65em, fill: conf.primary-color, content)
  ))
}

// --- Boîtes et Blocs ---

#let _base-box(title: none, body, color: black, fill-mode: "outline") = {
  let (fill-body, stroke-box) = if fill-mode == "fill" {
    (color.lighten(90%), 0.5pt + color)
  } else if fill-mode == "full" {
    (color.lighten(80%), 0.5pt + color)
  } else if fill-mode == "transparent" {
    (none, none)
  } else {
    // outline
    (none, 0.5pt + color)
  }
  
  block(
    width: 100%,
    radius: 4pt,
    clip: true,
    stroke: stroke-box,
    stack(
      spacing: 0pt,
      if title != none {
        block(
          width: 100%,
          fill: color,
          inset: 0.6em,
          text(fill: white, weight: "bold", title)
        )
      },
      block(
        width: 100%,
        fill: fill-body,
        inset: 0.8em,
        body
      )
    )
  )
}

#let highlight-box(title: "Key Point", fill-mode: "outline", body) = {
  _base-box(title: title, body, color: sorbonne-blue, fill-mode: fill-mode)
}

#let alert-box(title: "Warning", fill-mode: "outline", body) = {
  _base-box(title: title, body, color: sorbonne-red, fill-mode: fill-mode)
}

#let example-box(title: "Example", fill-mode: "outline", body) = {
  _base-box(title: title, body, color: rgb("#2E7D32"), fill-mode: fill-mode)
}

#let algorithm-box(title: "Algorithm", fill-mode: "outline", body) = {
  let algorithm-body = {
    set text(font: ("Fira Code", "DejaVu Sans Mono"), size: 0.9em)
    // On formate les listes numérotées comme des lignes de code
    show enum: it => {
      grid(
        columns: (1.5em, 1fr),
        column-gutter: 0.8em,
        row-gutter: 0.5em,
        ..it.children.enumerate().map(((i, child)) => (
          align(right, text(fill: gray, str(i + 1) + ":")),
          child.body
        )).flatten()
      )
    }
    body
  }
  _base-box(title: title, algorithm-body, color: rgb("#455A64"), fill-mode: fill-mode)
}

#let themed-block(title: none, fill-mode: "outline", body) = context {
  let conf = config-state.get()
  let color = conf.primary-color
  _base-box(title: title, body, color: color, fill-mode: fill-mode)
}

#let appendix() = {
  counter(heading).update(0)
  [#metadata(none) <sorbonne-appendix-marker>]
  context {
    let conf = config-state.get()
    focus-slide(upper(conf.annex-main-title))
  }
}

// --- Transitions ---

#let sorbonne-transition(h, roadmap) = {
  context {
    let conf = config-state.get()
    let appendix-marker = query(<sorbonne-appendix-marker>)
    let is-annex = if appendix-marker.len() > 0 {
      appendix-marker.first().location().page() < h.location().page() or (appendix-marker.first().location().page() == h.location().page() and appendix-marker.first().location().position().y < h.location().position().y)
    } else { false }

    empty-slide(fill: conf.primary-color, {
      set text(fill: white, font: "Fira Sans") 
      place(top + left, pad(top: 2em, left: 2em, image(conf.logo-transition, width: 5em)))
      place(hide(h)) 
      
      let mapping = conf.mapping
      let active = nav.get-active-headings(h.location())
      
      let role = none
      for (r, lvl) in mapping { if lvl == h.level { role = r; break } }
      
      if role == "part" or (is-annex and role == "section" and not mapping.keys().contains("part")) {
        align(center + horizon, stack(
          spacing: 1.5em,
          if conf.show-header-numbering {
            let num = if is-annex {
              conf.annex-title + " " + numbering(conf.annex-numbering-format, counter(heading).at(h.location()).at(0))
            } else {
              numbering(conf.part-numbering-format, counter(heading).at(h.location()).at(0))
            }
            text(size: if is-annex { 4em } else { 6em }, weight: "bold", num)
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
        let start-idx = if mapping.keys().contains("part") { 1 } else { 0 }
        let nums = count.slice(start-idx)
        
        pad(x: 2em, stack(
          dir: ttb,
          v(15%),
          align(center, stack(
            spacing: 0.8em, 
            if conf.show-header-numbering {
              let fmt-num = if is-annex {
                conf.annex-title + " " + numbering(conf.annex-numbering-format, ..nums)
              } else {
                numbering(conf.numbering-format, ..nums)
              }
              if is-annex {
                text(size: 3.5em, weight: "bold", fmt-num + " " + smallcaps(section-head.body))
              } else {
                text(size: 6em, weight: "bold", fmt-num)
              }
            },
            if not is-annex { text(size: 2.2em, weight: "bold", smallcaps(section-head.body)) },
            v(1.2em),
            block(width: 60%, align(left, roadmap))
          ))
        ))
      }
    })
  }
}

// --- Template ---

#let template(
  title: none,
  author: none,
  affiliation: none,
  subtitle: none,
  date: datetime.today().display(),
  aspect-ratio: "16-9",
  text-font: "Fira Sans",
  text-size: 20pt,
  faculty: "sante",
  // Surcharges optionnelles
  primary-color: none,
  alert-color: none,
  logo-slide: none,
  logo-transition: none,
  show-header-numbering: true,
  numbering-format: "1.1",
  part-numbering-format: "I",
  annex-title: [Annexe],
  annex-main-title: [Annexes],
  annex-numbering-format: "I",
  mapping: (section: 1, subsection: 2),
  transitions: (:),
  show-outline: false,
  outline-title: [Sommaire],
  outline-depth: 2,
  body
) = {
  // 1. Détermination des valeurs par défaut basées sur faculty
  let (def-primary, def-alert, def-logo-transition, def-logo-slide) = if faculty == "sciences" {
    (sorbonne-lightblue, sorbonne-lightblue.darken(40%), "assets/logo/sorbonne-sciences-white.png", "assets/logo/sorbonne-sciences.png")
  } else if faculty == "lettres" {
    (sorbonne-yellow, sorbonne-yellow.darken(45%), "assets/logo/sorbonne-lettres-white.png", "assets/logo/sorbonne-lettres.png")
  } else if faculty == "univ" or faculty == none {
    (sorbonne-blue, sorbonne-blue.darken(20%), "assets/logo/sorbonne-univ-white.png", "assets/logo/sorbonne-univ.png")
  } else {
    // Default is sante
    (sorbonne-red, sorbonne-red.darken(15%), "assets/logo/sorbonne-sante-white.png", "assets/logo/sorbonne-sante.png")
  }

  // 2. Application des surcharges si fournies
  let final-primary = if primary-color != none { primary-color } else { def-primary }
  let final-alert = if alert-color != none { alert-color } else { def-alert }
  let final-logo-transition = if logo-transition != none { logo-transition } else { def-logo-transition }
  let final-logo-slide = if logo-slide != none { logo-slide } else { def-logo-slide }

  config-state.update(c => (
    author: author,
    affiliation: affiliation,
    show-header-numbering: show-header-numbering,
    numbering-format: numbering-format,
    part-numbering-format: part-numbering-format,
    annex-title: annex-title,
    annex-main-title: annex-main-title,
    annex-numbering-format: annex-numbering-format,
    mapping: mapping,
    primary-color: final-primary,
    alert-color: final-alert,
    logo-transition: final-logo-transition,
    logo-slide: final-logo-slide,
    text-font: text-font,
    text-size: text-size,
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
  
  // Définit le style de bibliographie en auteur-date (APA) par défaut
  set bibliography(style: "apa")

  // Style des citations
  show cite: it => context {
    let conf = config-state.get()
    box(
      inset: (x: 2pt),
      outset: (y: 2pt),
      radius: 2pt,
      fill: conf.primary-color.lighten(90%),
      text(fill: conf.primary-color, it)
    )
  }
  
  set heading(numbering: (..nums) => context {
    if not show-header-numbering { return none }
    let n = nums.pos()
    
    // Check if we are in appendix
    let appendix-marker = query(<sorbonne-appendix-marker>)
    let is-annex = if appendix-marker.len() > 0 {
      appendix-marker.first().location().page() < here().page() or (appendix-marker.first().location().page() == here().page() and appendix-marker.first().location().position().y < here().position().y)
    } else { false }

    if is-annex {
      let formats = (annex-numbering-format, "A", "1")
      let parts = ()
      for i in range(n.len()) {
        parts.push(numbering(formats.at(i, default: "1"), n.at(i)))
      }
      return annex-title + " " + parts.join("")
    }

    let role = none
    for (r, lvl) in mapping { if lvl == n.len() { role = r; break } }
    
    if role == "part" { 
      numbering(part-numbering-format, ..n) 
    } else if role == "section" or role == "subsection" {
      let start-idx = if mapping.keys().contains("part") { 1 } else { 0 }
      if n.len() > start-idx { 
        numbering(numbering-format, ..n.slice(start-idx)) 
      }
    } else {
      none
    }
  })

  // Page de Titre
  empty-slide(fill: final-primary, {
    set text(fill: white)
    place(bottom + right, pad(bottom: 2em, right: 2em, image(final-logo-transition, width: 6em)))
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

  // Sommaire automatique
  if show-outline {
    slide(title: outline-title, {
      outline(title: none, depth: outline-depth, indent: 2em)
    })
  }

  show heading: h => context {
    if h.level > 3 { return h }
    
    // Check if we are in appendix for this heading
    let appendix-marker = query(<sorbonne-appendix-marker>)
    let is-annex = if appendix-marker.len() > 0 {
      appendix-marker.first().location().page() < h.location().page() or (appendix-marker.first().location().page() == h.location().page() and appendix-marker.first().location().position().y < h.location().position().y)
    } else { false }

    // En annexe, on ne fait des transitions que pour le niveau le plus haut mappé
    let top-level = calc.min(..mapping.values())
    if is-annex and h.level > top-level {
      return place(hide(h))
    }

    nav.render-transition(
      h,
      mapping: mapping,
      slide-func: (fill: none, roadmap) => sorbonne-transition(h, roadmap),
      top-padding: 0pt,
      transitions: (
        parts: (visibility: (part: "none", section: "none", subsection: "none")),
        sections: (visibility: (part: "none", section: "none", subsection: "current-parent")),
        subsections: (visibility: (part: "none", section: "none", subsection: "current-parent")),
        style: (active-weight: "bold", active-color: white, inactive-opacity: 0.5, completed-opacity: 0.5),
        marker: none,
      ) + transitions,
      show-heading-numbering: show-header-numbering
    )
  }
  
  body
}