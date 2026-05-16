#import "../core.typ": *

// ─── Palette APHP ──────────────────────────────────────────────────────────
#let aphp-navy  = rgb("#153D8A")  // grand panneau couverture, label section
#let aphp-blue  = rgb("#0063AF")  // blocs titre, numéro slide, connecteurs
#let aphp-dark  = rgb("#2C256B")  // bloc numéro chapitre (transition)
#let aphp-gold  = rgb("#FFC000")  // double chevron >>
#let aphp-text  = rgb("#153D8A")  // texte courant (identique à navy)

// ─── Éléments communs ──────────────────────────────────────────────────────

// Logos bas-gauche et bas-droit (communs à toutes les slides)
#let aphp-logos(conf) = {
  let logo-left = if conf.at("aphp-logo-left", default: none) != none {
    conf.at("aphp-logo-left")
  } else {
    image("../../assets/aphp/aphp-sorbonne.gif", width: 3.463cm, height: 0.863cm)
  }
  let logo-right = if conf.at("aphp-logo-right", default: none) != none {
    conf.at("aphp-logo-right")
  } else {
    image("../../assets/aphp/aphp-logo-full.png", width: 5.997cm, height: 1.693cm)
  }
  place(top+left, dx: 0.953cm, dy: 17.630cm, logo-left)
  place(top+left, dx: 27.735cm, dy: 17.343cm, logo-right)
}

// Icône cœur AP-HP (haut de la ligne verticale)
#let aphp-heart() = {
  place(top+left, dx: 3.131cm, dy: 1.066cm,
    image("../../assets/aphp/aphp-heart.png", width: 0.995cm, height: 0.995cm))
}

// Numéro de slide (rectangle bleu au bas de la sidebar)
#let aphp-slide-number() = context {
  let n = logical-slide-counter.get().at(0)
  place(top+left, dx: 2.994cm, dy: 16.560cm,
    block(width: 1.270cm, height: 0.466cm, fill: aphp-blue, clip: true,
      align(center+horizon,
        text(size: 7pt, weight: "bold", fill: white, str(n)))))
}

// ─── Lignes verticales ─────────────────────────────────────────────────────

// Ligne simple (layouts 1 & 2 : couverture)
#let aphp-line-single() = {
  // x=3.629, y=2.324 → longueur 13.802cm
  place(top+left, dx: 3.629cm, dy: 2.324cm,
    line(angle: 90deg, length: 13.802cm, stroke: 0.75pt + aphp-blue))
}

// Ligne divisée (layout 3 & 4 : section — gap pour le bloc numéro + chevron)
#let aphp-line-split() = {
  // Segment haut : y=2.324 → 5.324 (longueur 3.0cm)
  place(top+left, dx: 3.629cm, dy: 2.324cm,
    line(angle: 90deg, length: 3.0cm, stroke: 0.75pt + aphp-blue))
  // Segment bas : y=8.925 → 16.126 (longueur 7.201cm)
  place(top+left, dx: 3.629cm, dy: 8.925cm,
    line(angle: 90deg, length: 7.201cm, stroke: 0.75pt + aphp-blue))
}

// Double rail (layout 5 : contenu — ligne extérieure bleue + ligne intérieure blanche)
#let aphp-line-double-rail() = {
  // Ligne extérieure bleue — segment haut : y=2.324 → 8.525
  place(top+left, dx: 3.629cm, dy: 2.324cm,
    line(angle: 90deg, length: 6.201cm, stroke: 0.75pt + aphp-blue))
  // Ligne extérieure bleue — segment bas : y=10.305 → 16.126
  place(top+left, dx: 3.629cm, dy: 10.305cm,
    line(angle: 90deg, length: 5.821cm, stroke: 0.75pt + aphp-blue))
  // Ligne intérieure blanche — segment haut : y=2.924 → 8.525
  place(top+left, dx: 4.133cm, dy: 2.924cm,
    line(angle: 90deg, length: 5.601cm, stroke: 0.75pt + white))
  // Ligne intérieure blanche — segment bas : y=10.305 → 15.326
  place(top+left, dx: 4.133cm, dy: 10.305cm,
    line(angle: 90deg, length: 5.021cm, stroke: 0.75pt + white))
}

// ─── Header contenu (Layout 5) ─────────────────────────────────────────────
#let aphp-header(conf) = context {
  let slide-meta = resolve-current-slide-meta()
  if slide-meta == none { return none }
  let resolved-title = slide-meta.resolved-title

  // Titre de section courant (pour le label vertical)
  let section-level = conf.mapping.at("section", default: 1)
  let section-headings = query(selector(heading.where(level: section-level)).before(here()))
  let section-name = if section-headings.len() > 0 { section-headings.last().body } else { none }

  // Label de section vertical (fond #153D8A, texte blanc 9pt, pivoté -90°)
  // x=2.130, y=2.924, w=3.079, h=13.001
  if section-name != none {
    place(top+left, dx: 2.130cm, dy: 2.924cm,
      block(width: 3.079cm, height: 13.001cm, fill: aphp-navy, clip: true,
        align(center+horizon,
          rotate(-90deg, reflow: true,
            box(width: 13.001cm,
              align(center,
                text(size: 9pt, fill: white, font: conf.text-font,
                  weight: "regular", upper(section-name))))))))
  }

  // Double rail
  aphp-line-double-rail()

  // Cœur
  aphp-heart()

  // Titre de la slide (headline) : x=5.932, y=1.411, w=25.803, h=1.301
  if resolved-title != none {
    place(top+left, dx: 5.932cm, dy: 1.411cm,
      block(width: 25.803cm, height: 1.301cm,
        align(left+horizon,
          text(size: 1.4em, weight: "regular", fill: aphp-text, resolved-title))))
  }

  // Numéro de slide
  aphp-slide-number()

  // Logos
  aphp-logos(conf)
}

// ─── Slide de titre (Layouts 1 et 2) ──────────────────────────────────────
#let aphp-title-slide(conf) = {
  let cover-style = conf.at("aphp-cover-style", default: "full")
  let classification = conf.at("aphp-classification", default: none)

  empty-slide(fill: white, count: false, {
    // Banderole de classification (layout 2 uniquement)
    if cover-style == "light" and classification != none {
      place(top+left, dx: 0pt, dy: 0pt,
        block(width: 100%, height: 1.270cm, fill: aphp-blue,
          align(left+horizon, pad(x: 1em,
            text(size: 0.45em, fill: white, classification)))))
    }

    // Grand panneau marine (layout 1 "full" uniquement)
    if cover-style == "full" {
      place(top+left, dx: 5.932cm, dy: 1.124cm,
        block(width: 27.929cm, height: 15.902cm, fill: aphp-navy))
    }

    // Ligne verticale simple
    aphp-line-single()

    // Cœur
    aphp-heart()

    // Double chevron doré
    place(top+left, dx: 1.419cm, dy: 2.374cm,
      image("../../assets/aphp/aphp-chevron.png", width: 0.864cm, height: 0.917cm))

    // Blocs titre (ligne 1 courte + ligne 2 large)
    // Si aphp-title-line2 est fourni, ligne 1 = titre, ligne 2 = title-line2
    // Sinon, ligne 1 = vide (décoration), ligne 2 = titre complet
    let title-line2 = conf.at("aphp-title-line2", default: none)
    let has-line2 = title-line2 != none and title-line2 != conf.title

    // Bloc 1 (court — décoration ou première ligne du titre)
    place(top+left, dx: 1.428cm, dy: 4.127cm,
      block(width: 4.779cm, height: 1.795cm, fill: aphp-blue, clip: true,
        if has-line2 {
          align(left+horizon, pad(x: 0.4em,
            text(size: 1.8em, weight: "bold", fill: white,
              font: conf.text-font, conf.title)))
        }))

    // Bloc 2 (large — titre complet ou deuxième ligne)
    // Utiliser pad+top (sans align horizon) pour que clip:true fonctionne
    let title-line2-content = if has-line2 { title-line2 } else { conf.title }
    let title-y2 = if cover-style == "light" { 6.582cm } else { 6.410cm }
    let title-w2 = if cover-style == "light" { 14.593cm } else { 14.601cm }
    place(top+left, dx: 1.428cm, dy: title-y2,
      block(width: title-w2, height: 1.795cm, fill: aphp-blue, clip: true,
        pad(x: 0.4em, top: 0.3em,
          text(size: 1.2em, weight: "bold", fill: white,
            font: conf.text-font, title-line2-content))))

    // Sous-titre
    let subtitle-y = if cover-style == "light" { 9.628cm } else { 8.800cm }
    let subtitle-fill = if cover-style == "light" { aphp-navy } else { none }
    if conf.subtitle != none {
      place(top+left, dx: 9.428cm, dy: subtitle-y,
        block(width: 20.936cm, height: 2.600cm, fill: subtitle-fill, clip: true,
          align(left+horizon, pad(x: 0.5em,
            text(size: 1.4em, fill: white, font: conf.text-font, conf.subtitle))))
      )
    }

    // Date
    place(top+left, dx: 2.210cm, dy: 16.560cm,
      block(width: 2.908cm, height: 0.628cm, fill: aphp-blue,
        align(center+horizon,
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

        // Bloc numéro de chapitre (fond #2C256B, x=1.224, y=3.257, w=4.810, h=6.054)
        place(top+left, dx: 1.224cm, dy: 3.257cm,
          block(width: 4.810cm, height: 6.054cm, fill: aphp-dark, clip: true,
            align(center+horizon,
              text(size: 5em, weight: "bold", fill: white,
                font: conf.text-font, chap-num))))

        // Double chevron dans le gap (y=6.930) — placé APRÈS le bloc numéro
        // pour apparaître dessus (z-order)
        place(top+left, dx: 1.722cm, dy: 6.930cm,
          image("../../assets/aphp/aphp-chevron.png", width: 0.864cm, height: 0.917cm))

        // Titre de section — ligne 1 (x=1.732, y=9.314, w=4.448, h=1.795)
        // Bloc court = décoration vide (fond bleu)
        place(top+left, dx: 1.732cm, dy: 9.314cm,
          block(width: 4.448cm, height: 1.795cm, fill: aphp-blue))

        // Titre de section — ligne 2 (x=1.732, y=11.664, w=9.358, h=1.795)
        // Bloc large = titre de la section
        place(top+left, dx: 1.732cm, dy: 11.664cm,
          block(width: 9.358cm, height: 1.795cm, fill: aphp-blue, clip: true,
            align(left+horizon, pad(x: 0.4em,
              text(size: 1.2em, weight: "bold", fill: white,
                font: conf.text-font, h.body)))))

        // Numéro de slide
        context aphp-slide-number()

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

  empty-slide(fill: aphp-navy, {
    // Ligne verticale simple (blanche sur fond marine)
    place(top+left, dx: 3.629cm, dy: 2.324cm,
      line(angle: 90deg, length: 13.802cm, stroke: 0.75pt + white.transparentize(30%)))

    // Cœur (version blanche si disponible, sinon normale)
    place(top+left, dx: 3.131cm, dy: 1.066cm,
      image("../../assets/aphp/aphp-heart.png", width: 0.995cm, height: 0.995cm))

    // Contenu central (zone droite de la slide)
    place(top+left, dx: 5.932cm, dy: 0pt,
      block(width: 25.0cm, height: 100%,
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
    transition-fill:  white,  // section slides ont fond blanc
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
    // Disposition APHP : sidebar gauche de 5.932cm
    margin-top:    3.823cm,   // corps démarre à y=3.823cm (sous le headline)
    margin-left:   5.932cm,   // zone sidebar (0 → 5.932cm)
    margin-right:  4.405cm,   // marge droite PPTX (corps se termine à x=29.462cm)
    margin-bottom: 1.864cm,   // zone footer
    body-inset-x:  0pt,       // margin-left seul contrôle le départ horizontal
    // Header custom APHP (dessine toute la sidebar en foreground)
    header-func:        aphp-header,
    footer-func:        none,   // aphp-header gère aussi logos et numéro
    // Slides spéciaux
    title-slide-func:   aphp-title-slide,
    ending-slide-func:  aphp-ending-slide,
    render-transition-func: aphp-render-transition,
    // Focus slide (utilise base-focus-slide avec couleur primaire)
    focus-layout:   "centered",
    focus-bg-light: final-primary,
    focus-bg-dark:  final-primary.darken(40%),
    focus-text-color: white,
    // Paramètres APHP spécifiques (transmis via conf)
    aphp-cover-style:    cover-style,
    aphp-classification: classification,
    aphp-title-line2:    title-line2,  // none → bloc 1 vide, bloc 2 = titre complet
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
