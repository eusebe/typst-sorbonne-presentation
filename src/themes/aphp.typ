#import "../core.typ": *

// ─── Palette APHP ──────────────────────────────────────────────────────────
#let aphp-navy  = rgb("#153D8A")  // grand panneau couverture, label section
#let aphp-blue  = rgb("#0063AF")  // blocs titre, numéro slide, connecteurs
#let aphp-dark  = rgb("#2C256B")  // bloc numéro chapitre (transition)
#let aphp-gold  = rgb("#FFC000")  // double chevron >>
#let aphp-text  = rgb("#153D8A")  // texte courant (identique à navy)

// Espace de référence PPTX 16:9 (toutes les coordonnées ci-dessous sont dans cet espace).
// Les fonctions de dessin calculent sx = page.width/aphp-pptx-w et sy = page.height/aphp-pptx-h
// via context, ce qui les rend correctes pour tous les ratios (16:9, 4:3, etc.).
#let aphp-pptx-w = 33.867cm
#let aphp-pptx-h = 19.05cm

// ─── Éléments communs ──────────────────────────────────────────────────────

// Logos bas-gauche et bas-droit (communs à toutes les slides)
// Coordonnées PPTX : bas-gauche x=0.953 y=17.630 (3.463×0.863), bas-droit x=27.735 y=17.343 (5.997×1.693)
#let aphp-logos(conf) = context {
  let sx = page.width  / aphp-pptx-w
  let sy = page.height / aphp-pptx-h
  let logo-left = if conf.at("aphp-logo-left", default: none) != none {
    conf.at("aphp-logo-left")
  } else {
    image("../../assets/aphp/aphp-sorbonne.gif", width: 3.463cm * sx, height: 0.863cm * sx)
  }
  let logo-right = if conf.at("aphp-logo-right", default: none) != none {
    conf.at("aphp-logo-right")
  } else {
    image("../../assets/aphp/aphp-logo-full.png", width: 5.997cm * sx, height: 1.693cm * sx)
  }
  place(top+left, dx: 0.953cm * sx, dy: 17.630cm * sy, logo-left)
  place(top+left, dx: 27.735cm * sx, dy: 17.343cm * sy, logo-right)
}

// Icône cœur AP-HP (haut de la ligne verticale)
// Coordonnées PPTX : x=3.132 y=1.066 (0.995×0.995)
#let aphp-heart() = context {
  let sx = page.width  / aphp-pptx-w
  let sy = page.height / aphp-pptx-h
  place(top+left, dx: 3.132cm * sx, dy: 1.066cm * sy,
    image("../../assets/aphp/aphp-heart.png", width: 0.995cm * sx, height: 0.995cm * sx))
}

// Numéro de slide (rectangle bleu au bas de la sidebar)
// Coordonnées PPTX : x=2.994 y=16.560 (1.270×0.466)
#let aphp-slide-number() = context {
  let sx = page.width  / aphp-pptx-w
  let sy = page.height / aphp-pptx-h
  let n = logical-slide-counter.get().at(0)
  place(top+left, dx: 2.994cm * sx, dy: 16.560cm * sy,
    block(width: 1.270cm * sx, height: 0.466cm * sy, fill: aphp-blue, clip: true,
      align(center+horizon,
        text(size: 7pt, weight: "bold", fill: white, str(n)))))
}

// ─── Lignes verticales ─────────────────────────────────────────────────────

// Ligne simple (layouts 1 & 2 : couverture, fin)
// PPTX : x=3.630 y=2.325 longueur=13.800
#let aphp-line-single(color: aphp-blue) = context {
  let sx = page.width  / aphp-pptx-w
  let sy = page.height / aphp-pptx-h
  place(top+left, dx: 3.630cm * sx, dy: 2.325cm * sy,
    line(angle: 90deg, length: 13.800cm * sy, stroke: 0.75pt + color))
}

// Ligne divisée (layout 3 & 4 : section — gap pour le bloc numéro + chevron)
// PPTX : x=3.630, segment haut y=2.325 l=3.001, segment bas y=8.927 l=7.202
#let aphp-line-split() = context {
  let sx = page.width  / aphp-pptx-w
  let sy = page.height / aphp-pptx-h
  // Segment haut
  place(top+left, dx: 3.630cm * sx, dy: 2.325cm * sy,
    line(angle: 90deg, length: 3.001cm * sy, stroke: 0.75pt + aphp-blue))
  // Segment bas
  place(top+left, dx: 3.630cm * sx, dy: 8.927cm * sy,
    line(angle: 90deg, length: 7.202cm * sy, stroke: 0.75pt + aphp-blue))
}

// Ligne unique avec label de section horizontal dans le gap (layout 5 : contenu)
// PPTX : x=3.630, segment haut y=2.325 l=6.202, segment bas y=10.307 l=5.822
// Gap de y=8.527 à y=10.307 (1.780cm) — label horizontal centré sur la ligne
#let aphp-line-with-label(conf) = context {
  let sx = page.width  / aphp-pptx-w
  let sy = page.height / aphp-pptx-h
  // Segment haut
  place(top+left, dx: 3.630cm * sx, dy: 2.325cm * sy,
    line(angle: 90deg, length: 6.202cm * sy, stroke: 0.75pt + aphp-blue))
  // Segment bas
  place(top+left, dx: 3.630cm * sx, dy: 10.307cm * sy,
    line(angle: 90deg, length: 5.822cm * sy, stroke: 0.75pt + aphp-blue))

  // Label horizontal dans le gap
  let section-level = conf.mapping.at("section", default: 1)
  let subsection-level = conf.mapping.at("subsection", default: none)
  let section-headings = query(selector(heading.where(level: section-level)).before(here()))
  let section-name = if section-headings.len() > 0 { section-headings.last().body } else { none }
  let subsection-name = if subsection-level != none {
    let sub-hs = query(selector(heading.where(level: subsection-level)).before(here()))
    if sub-hs.len() > 0 { sub-hs.last().body } else { none }
  } else { none }

  if section-name != none {
    let label-content = if subsection-name != none {
      stack(spacing: 0.2em, section-name, subsection-name)
    } else {
      section-name
    }
    // Conteneur centré sur la ligne (x=3.630 ≈ milieu de 2.130–5.210), dans le gap
    place(top+left, dx: 2.130cm * sx, dy: 8.527cm * sy,
      block(width: 3.080cm * sx, height: 1.780cm * sy, clip: true,
        align(center+horizon,
          text(size: 6pt, fill: aphp-blue, font: conf.text-font,
            weight: "regular", label-content))))
  }
}

// ─── Header contenu (Layout 5) ─────────────────────────────────────────────
#let aphp-header(conf) = context {
  let sx = page.width  / aphp-pptx-w
  let sy = page.height / aphp-pptx-h
  let slide-meta = resolve-current-slide-meta()
  if slide-meta == none { return none }
  let resolved-title = slide-meta.resolved-title

  // Ligne unique avec label de section horizontal dans le gap
  aphp-line-with-label(conf)

  // Cœur
  aphp-heart()

  // Titre de la slide (headline)
  // PPTX : x=5.934 y=1.411 (25.806×1.302)
  if resolved-title != none {
    place(top+left, dx: 5.934cm * sx, dy: 1.411cm * sy,
      block(width: 25.806cm * sx, height: 1.302cm * sy,
        align(left+horizon,
          text(size: 1.4em, weight: "regular", fill: aphp-text, resolved-title))))
  }

  // Numéro de slide
  aphp-slide-number()

  // Logos
  aphp-logos(conf)
}

// ─── Slide de titre (Layouts 1 et 2) ──────────────────────────────────────
#let aphp-title-slide(conf) = context {
  let sx = page.width  / aphp-pptx-w
  let sy = page.height / aphp-pptx-h
  let cover-style = conf.at("aphp-cover-style", default: "full")
  let classification = conf.at("aphp-classification", default: none)
  let title-line2 = conf.at("aphp-title-line2", default: none)
  let has-line2 = title-line2 != none and title-line2 != conf.title

  empty-slide(fill: white, count: false, {
    // Banderole de classification (layout 2 uniquement)
    // PPTX : x=0 y=0 hauteur=1.124
    if cover-style == "light" and classification != none {
      place(top+left, dx: 0pt, dy: 0pt,
        block(width: 100%, height: 1.124cm * sy, fill: aphp-blue,
          align(left+horizon, pad(x: 1em,
            text(size: 0.45em, fill: white, classification)))))
    }

    // Grand panneau marine (layout 1 "full" uniquement)
    // PPTX : x=5.934 y=1.124 (27.929×15.903)
    if cover-style == "full" {
      place(top+left, dx: 5.934cm * sx, dy: 1.124cm * sy,
        block(width: 27.929cm * sx, height: 15.903cm * sy, fill: aphp-navy))
    }

    // Ligne verticale simple
    aphp-line-single()

    // Cœur
    aphp-heart()

    // Double chevron doré
    // PPTX : x=1.419 y=2.375 (0.865×0.917)
    place(top+left, dx: 1.419cm * sx, dy: 2.375cm * sy,
      image("../../assets/aphp/aphp-chevron.png", width: 0.865cm * sx, height: 0.917cm * sx))

    // Blocs titre (ligne 1 courte + ligne 2 large)
    // Si aphp-title-line2 est fourni, ligne 1 = titre, ligne 2 = title-line2
    // Sinon, ligne 1 = vide (décoration), ligne 2 = titre complet

    // Bloc 1 auto-sized — première ligne du titre (uniquement si title-line2 fourni)
    // PPTX : x=1.428 y=4.128
    if has-line2 {
      place(top+left, dx: 1.428cm * sx, dy: 4.128cm * sy,
        box(fill: aphp-blue,
          pad(x: 0.4em, y: 0.3em,
            text(size: 1.8em, weight: "bold", fill: white,
              font: conf.text-font, conf.title))))
    }

    // Bloc 2 auto-sized — titre complet ou deuxième ligne
    // PPTX full : x=1.428 y=6.412 ; light : y=6.583
    let title-line2-content = if has-line2 { title-line2 } else { conf.title }
    let title-y2-pptx = if cover-style == "light" { 6.583cm } else { 6.412cm }
    place(top+left, dx: 1.428cm * sx, dy: title-y2-pptx * sy,
      box(fill: aphp-blue,
        pad(x: 0.4em, y: 0.3em,
          text(size: 1.2em, weight: "bold", fill: white,
            font: conf.text-font, title-line2-content))))

    // Sous-titre
    // PPTX full : x=9.428 y=8.801 (20.936×2.600) ; light : y=9.629
    let subtitle-y-pptx = if cover-style == "light" { 9.629cm } else { 8.801cm }
    let subtitle-fill = if cover-style == "light" { aphp-navy } else { none }
    if conf.subtitle != none {
      place(top+left, dx: 9.428cm * sx, dy: subtitle-y-pptx * sy,
        block(width: 20.936cm * sx, height: 2.600cm * sy, fill: subtitle-fill, clip: true,
          align(left+horizon, pad(x: 0.5em,
            text(size: 1.4em, fill: white, font: conf.text-font, conf.subtitle))))
      )
    }

    // Date auto-sized — largeur s'adapte au contenu pour toujours tenir sur une ligne
    // PPTX : x=2.211 y=16.560
    place(top+left, dx: 2.211cm * sx, dy: 16.560cm * sy,
      box(fill: aphp-blue,
        pad(x: 0.5em, y: 0.1em,
          text(size: 0.5em, fill: white, font: conf.text-font, conf.date))))

    // Logos
    aphp-logos(conf)
  })
}

// ─── Slide de transition de section (Layouts 3 et 4) ──────────────────────
// Appelé via conf.render-transition-func avec signature (h, is-annex).
// nav.render-transition crée déjà le slide (empty-slide) ; content-wrapper
// retourne uniquement le CONTENU (pas un nouveau slide).
#let aphp-render-transition(h, is-annex) = context {
  let conf = config-state.get()
  let sx = page.width  / aphp-pptx-w
  let sy = page.height / aphp-pptx-h
  nav.render-transition(h,
    top-padding: 0pt,
    use-short-title: false,
    content-wrapper: (roadmap, h, active) => {
      // Récupérer le numéro de section / chapitre
      let level-nums = counter(heading).at(h.location())
      let part-level = conf.mapping.at("part", default: none)
      let is-part = part-level != none and h.level == part-level

      let chap-num = if is-part {
        numbering(conf.part-numbering-format, ..level-nums)
      } else {
        str(level-nums.at(0, default: 0))
      }

      // Retourner le contenu page-absolue (empty-slide a margin=0pt)
      {
        // Lignes verticales divisées
        aphp-line-split()

        // Cœur
        aphp-heart()

        // Bloc numéro de chapitre (fond #2C256B)
        // PPTX : x=1.224 y=3.258 (4.810×6.055)
        place(top+left, dx: 1.224cm * sx, dy: 3.258cm * sy,
          block(width: 4.810cm * sx, height: 6.055cm * sy, fill: aphp-dark, clip: true,
            align(center+horizon,
              text(size: 5em, weight: "bold", fill: white,
                font: conf.text-font, chap-num))))

        // Double chevron dans le gap
        // PPTX : x=1.722 y=6.932 (0.865×0.917)
        place(top+left, dx: 1.722cm * sx, dy: 6.932cm * sy,
          image("../../assets/aphp/aphp-chevron.png", width: 0.865cm * sx, height: 0.917cm * sx))

        // Titre de section — ligne 1 : bloc court (décoration vide)
        // PPTX : x=1.732 y=9.314 (4.449×1.795)
        place(top+left, dx: 1.732cm * sx, dy: 9.314cm * sy,
          block(width: 4.449cm * sx, height: 1.795cm * sy, fill: aphp-blue))

        // Titre de section — ligne 2 : auto-sized au texte
        // PPTX : x=1.732 y=11.665
        place(top+left, dx: 1.732cm * sx, dy: 11.665cm * sy,
          box(fill: aphp-blue,
            pad(x: 0.4em, y: 0.3em,
              text(size: 1.2em, weight: "bold", fill: white,
                font: conf.text-font, h.body))))

        // Numéro de slide
        aphp-slide-number()

        // Logos
        aphp-logos(conf)
      }
    }
  )
}

// ─── Slide de fin ──────────────────────────────────────────────────────────
#let aphp-ending-slide(
  title: [Merci de votre attention !],
  subtitle: [Questions ?],
  contact: none,
) = context {
  let conf = config-state.get()
  let sx = page.width  / aphp-pptx-w
  let sy = page.height / aphp-pptx-h

  empty-slide(fill: aphp-navy, {
    // Ligne verticale simple (blanche sur fond marine)
    aphp-line-single(color: white.transparentize(30%))

    // Cœur
    aphp-heart()

    // Contenu central (zone droite de la slide)
    // PPTX : x=5.934 y=0 (25.086×100%)
    place(top+left, dx: 5.934cm * sx, dy: 0pt,
      block(width: 25.086cm * sx, height: 100%,
        align(center+horizon, stack(spacing: 1.5em,
          text(size: 2.2em, weight: "bold", fill: white, title),
          if subtitle != none {
            text(size: 1.5em, style: "italic", fill: white.transparentize(20%), subtitle)
          },
          if contact != none and contact != () {
            v(1em)
            set text(size: 1em, fill: white.transparentize(10%))
            if type(contact) == array { contact.join([#h(2em)]) } else { contact }
          }
        ))))

    // Logos (versions sur fond sombre — les images PNG/GIF ont fond transparent)
    aphp-logos(conf)
  })
}

// ─── Template principal ────────────────────────────────────────────────────
#let aphp-template(
  title: none,
  author: none,
  short-title: none,
  short-author: none,
  affiliation: none,
  subtitle: none,
  date: datetime.today().display(),
  aspect-ratio: "16-9",
  text-font: ("Open Sans", "Lato", "Fira Sans"),
  text-size: 20pt,
  primary-color: none,
  alert-color: none,
  // Paramètres spécifiques APHP
  cover-style: "full",              // "full" | "light"
  classification: none,            // ex: "C1 - Interne"
  title-line2: none,               // 2e ligne de titre (optionnel, défaut = title)
  logo-left: none,                 // surcharge logo bas-gauche
  logo-right: none,                // surcharge logo bas-droit
  // Options standard
  show-header-numbering: true,
  numbering-format: "1.1",
  part-numbering-format: "I",
  part-title: [Part],
  title-smallcaps: false,
  appendix-title: [Appendix],
  appendix-main-title: [Appendices],
  appendix-numbering-format: "I",
  mapping: (section: 1, subsection: 2),
  bib-style: "apa",
  transitions: (:),
  show-outline: false,
  outline-title: [Outline],
  outline-depth: 2,
  outline-columns: 1,
  auto-title: true,
  progress-bar: "none",
  progress-bar-height: 2pt,
  equation-definitions-width: 85%,
  transition-roadmap-width: 60%,
  slide-break-suffix: [ (suite)],
  footer-author: false,
  footer-title: false,
  max-length: none,
  use-short-title: false,
  dark-mode: false,
  handout: false,
  math-font: "Noto Sans Math",
  code-font: ("Fira Code", "DejaVu Sans Mono"),
  body
) = {
  let final-primary = if primary-color != none { primary-color } else { aphp-blue }
  let final-alert   = if alert-color   != none { alert-color   } else { aphp-gold }

  // Dimensions de la page Typst selon le ratio (pour calculer les marges)
  let (page-w, page-h) = if aspect-ratio == "4-3" {
    (28.0cm, 21.0cm)
  } else {
    (29.7cm, 16.7cm)
  }
  let aphp-sx = page-w / aphp-pptx-w
  let aphp-sy = page-h / aphp-pptx-h

  let resolved-max-length = if type(max-length) == dictionary {
    let new-dict = (:)
    for (key, val) in max-length {
      if key in mapping {
        new-dict.insert("level-" + str(mapping.at(key)), val)
      } else {
        new-dict.insert(key, val)
      }
    }
    new-dict
  } else {
    max-length
  }

  let conf = (
    title:        title,
    author:       author,
    short-title:  if short-title  != none { short-title  } else { title  },
    short-author: if short-author != none { short-author } else { author },
    affiliation:  affiliation,
    subtitle:     subtitle,
    date:         date,
    aspect-ratio: aspect-ratio,
    text-font:    text-font,
    text-size:    text-size,
    text-color:   aphp-text,
    math-font:    math-font,
    code-font:    code-font,
    primary-color:    final-primary,
    marker-color:     final-primary,
    transition-fill:  white,
    alert-color:      final-alert,
    logo-transition:  none,
    logo-slide:       none,
    show-header-numbering:      show-header-numbering,
    numbering-format:           numbering-format,
    part-numbering-format:      part-numbering-format,
    part-title:                 part-title,
    title-smallcaps:            title-smallcaps,
    appendix-title:             appendix-title,
    appendix-main-title:        appendix-main-title,
    appendix-numbering-format:  appendix-numbering-format,
    mapping:       mapping,
    bib-style:     bib-style,
    transitions:   transitions,
    show-outline:  show-outline,
    outline-title: outline-title,
    outline-depth: outline-depth,
    outline-columns: outline-columns,
    auto-title:    auto-title,
    progress-bar:         progress-bar,
    progress-bar-height:  progress-bar-height,
    equation-definitions-width: equation-definitions-width,
    transition-roadmap-width:   transition-roadmap-width,
    slide-break-suffix: slide-break-suffix,
    footer-author: footer-author,
    footer-title:  footer-title,
    max-length:    resolved-max-length,
    use-short-title: use-short-title,
    dark-mode:     dark-mode,
    handout:       handout,
    // Marges APHP — proportionnelles aux dimensions de la page (coordonnées PPTX × sx/sy)
    margin-top:    3.824cm * aphp-sy,
    margin-left:   5.934cm * aphp-sx,   // largeur de la sidebar
    margin-right:  4.406cm * aphp-sx,
    margin-bottom: 1.864cm * aphp-sy,
    body-inset-x:  0pt,
    // Header custom APHP (dessine toute la sidebar en foreground)
    header-func:        aphp-header,
    footer-func:        none,
    // Slides spéciaux
    title-slide-func:   aphp-title-slide,
    ending-slide-func:  aphp-ending-slide,
    render-transition-func: aphp-render-transition,
    // Focus slide
    focus-layout:   "centered",
    focus-bg-light: final-primary,
    focus-bg-dark:  final-primary.darken(40%),
    focus-text-color: white,
    // Paramètres APHP spécifiques (transmis via conf)
    aphp-cover-style:    cover-style,
    aphp-classification: classification,
    aphp-title-line2:    title-line2,
    aphp-logo-left:      if type(logo-left)  == str { image(logo-left)  } else { logo-left  },
    aphp-logo-right:     if type(logo-right) == str { image(logo-right) } else { logo-right },
    // Pas de transition roadmap standard (géré par render-transition-func)
    transition-text-color:   white,
    transition-active-color: white,
    transition-title-color:  white,
    transition-logo-func:    none,
    title-logo-func:         none,
  )

  core-template(conf: conf, body)
}
