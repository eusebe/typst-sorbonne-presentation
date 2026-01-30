#import "@preview/presentate:0.2.3" as p
#import "@preview/navigator:0.1.0" as nav

// --- COULEURS OFFICIELLES ---
#let sorbonne-red = rgb("#AC182E")
#let sorbonne-blue = rgb("#1D2769")
#let sorbonne-text = rgb("#263068")

// --- ASSETS ---
#let logo-univ-white = "assets/logo/sorbonne-univ-white.png"
#let logo-sante-color = "assets/logo/sorbonne-sante.png"

// --- ÉTAT ---
#let config-state = state("sorbonne-config", none)

// --- COMPOSANTS DE MISE EN PAGE ---

// Fil d'Ariane pour le footer
#let breadcrumb-comp() = context {
  let conf = config-state.get()
  if conf == none { return none }
  set text(size: 0.8em, fill: gray)
  nav.progressive-outline(
    level-1-mode: "current",
    level-2-mode: "current",
    layout: "horizontal",
    separator: text(fill: gray.lighten(50%), "  /  "),
    clickable: false,
    show-numbering: conf.show-header-numbering,
    text-styles: (
      level-1: (active: (weight: "bold", fill: sorbonne-text)),
      level-2: (active: (weight: "regular", fill: gray))
    )
  )
}

// En-tête des slides de contenu
#let header-comp(resolved-title) = {
  grid(
    columns: (4.5em, 1fr),
    column-gutter: 1.5em,
    align: horizon,
    image(logo-sante-color, width: 4.5em),
    if resolved-title != none {
      text(size: 1.1em, weight: "bold", fill: sorbonne-text, smallcaps(resolved-title))
    }
  )
}

// Pied de page des slides de contenu
#let footer-comp() = context {
  let conf = config-state.get()
  if conf == none { return none }
  set text(size: 0.65em, fill: gray, font: "Fira Sans")
  line(length: 100%, stroke: 0.5pt + gray.lighten(80%))
  v(0.5em)
  grid(
    columns: (1fr, 2fr, 1fr),
    align: (left, center, right),
    conf.author,
    breadcrumb-comp(),
    context {
      let current = counter(page).display()
      let total = counter(page).final().at(0)
      [#current / #total]
    }
  )
}

// --- API PUBLIQUE ---

#let slide(..args) = {
  let pos = args.pos()
  let named = args.named()
  
  let manual-title = named.at("title", default: none)
  let body = if pos.len() > 0 { pos.at(0) } else { none }
  if "title" in named { let _ = named.remove("title") }
  
  // Le preamble est la clé : il configure la page sans créer de saut de page
  let preamble = it => {
    let resolved-title = nav.resolve-slide-title(manual-title)
    set page(
      margin: (top: 4.5em, bottom: 3.5em, x: 2.5em),
      header: pad(x: 2em, top: 1.2em, header-comp(resolved-title)),
      footer: pad(x: 2em, bottom: 1.2em, footer-comp()),
      fill: white,
    )
    it
  }
  
  p.slide(..named, preamble: preamble, {
    metadata((t: "ContentSlide"))
    set align(top + left)
    body
  })
}

// Diapositive de transition interne
#let sorbonne-transition(h) = {
  p.slide(
    logical-slide: false,
    preamble: it => {
      set page(margin: 0pt, fill: sorbonne-red, header: none, footer: none)
      it
    },
    {
      set text(fill: white, font: "Fira Sans", size: 20pt) 
      place(top + left, pad(top: 2em, left: 2em, image(logo-univ-white, width: 5em)))
      place(hide(h)) 
      
      context {
        let conf = config-state.get()
        let section-num = counter(heading).at(h.location()).at(0)
        let active = nav.get-active-headings(h.location())
        let section-head = if h.level == 1 { h } else { active.h1 }
        
        pad(x: 2em, stack(
          dir: ttb,
          v(15%), 
          align(center, stack(
            spacing: 1.5em,
            text(size: 6em, weight: "bold", str(section-num)),
            if section-head != none {
              text(size: 2.2em, weight: "bold", smallcaps(section-head.body))
            },
            v(1em),
            block(width: 60%, align(left, {
              nav.progressive-outline(
                level-1-mode: "none",
                level-2-mode: "current-parent",
                target-location: h.location(),
                show-numbering: conf.show-header-numbering,
                marker: none,
                text-styles: (
                  level-2: (
                    active: (weight: "bold", fill: white),
                    completed: (fill: white.transparentize(50%)),
                    inactive: (fill: white.transparentize(50%))
                  )
                ),
                spacing: (indent-2: 1.5em, v-between-2-2: 0.8em)
              )
            }))
          ))
        ))
      }
    }
  )
}

#let template(
  title: none,
  subtitle: none,
  author: none,
  affiliation: none,
  date: datetime.today().display(),
  aspect-ratio: "16-9",
  show-header-numbering: true,
  body
) = {
  config-state.update((
    author: author,
    affiliation: affiliation,
    show-header-numbering: show-header-numbering,
  ))
  
  nav.navigator-config.update(c => {
    c.mapping = (section: 1, subsection: 2)
    c.auto-title = true
    c.show-heading-numbering = show-header-numbering
    c
  })

  // Style global par défaut
  set text(font: "Fira Sans", size: 20pt, fill: sorbonne-text)
  show math.equation: set text(font: "Fira Math")
  
  // Format papier global
  set page(paper: "presentation-" + aspect-ratio)
  
  set heading(numbering: (..nums) => if show-header-numbering { numbering("1.", ..nums) })

  // Page de Titre
  p.slide(
    logical-slide: false,
    preamble: it => {
      set page(margin: 0pt, fill: sorbonne-red, header: none, footer: none)
      it
    },
    {
      set text(fill: white)
      place(bottom + right, pad(bottom: 2em, right: 2em, image(logo-univ-white, width: 6em)))
      
      align(horizon, pad(x: 3em, y: 4em, stack(
        spacing: 1.2em,
        text(size: 2.5em, weight: "bold", smallcaps(title)),
        if subtitle != none { text(size: 1.4em, style: "italic", subtitle) },
        v(1.5em),
        text(size: 1.3em, weight: "bold", author),
        text(size: 1.1em, affiliation),
        text(size: 0.9em, fill: white.transparentize(20%), date),
      )))
    }
  )

  // Transitions automatiques
  show heading: h => {
    if h.level <= 2 {
      sorbonne-transition(h)
    } else {
      h
    }
  }

  body
}