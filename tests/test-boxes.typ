#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with(faculty: "lettres")
}

#show: my-template.with(
  title: [Test Composants de Boîtes],
  subtitle: [Démonstration des variantes et modes],
  author: [David Hajage],
)

= Boîtes Institutionnelles
#slide(title: "Styles par Défaut")[
  #highlight-box(title: "Highlight (Bleu Sorbonne)")[
    Utilisé pour les concepts clés et les résumés.
  ]
  
  #v(1fr)
  
  #alert-box(title: "Alert (Rouge Sorbonne)")[
    Utilisé pour les avertissements et informations critiques.
  ]
  
  #v(1fr)
  
  #example-box(title: "Example (Vert Académique)")[
    Utilisé pour illustrer des démonstrations ou des cas concrets.
  ]
]

= Variantes de Remplissage
#slide(title: "Modes Fill et Full")[
  #highlight-box(title: "Mode Fill (Teinté)", fill-mode: "fill")[
    Un fond très clair (90% blanc) pour une distinction subtile.
  ]
  
  #v(2em)
  
  #highlight-box(title: "Mode Full (Marqué)", fill-mode: "full")[
    Un fond plus coloré (80% blanc) pour un impact visuel plus fort.
  ]
]

#slide(title: "Mode Transparent")[
  #example-box(title: "Mode Transparent", fill-mode: "transparent")[
    Aucune bordure, aucun fond sur le corps. Seul l'en-tête est coloré. 
    Idéal pour intégrer du contenu très dense ou des images.
  ]
]

#slide(title: "Algorithm Box")[
  #algorithm-box(title: "Algorithm 1: Automatic Numbering")[
    *Input:* Data $X$ 
    *Output:* Result $Y$ 
    + Process data
    + Apply transformation
    + Validate results
    + Return $Y$
  ]
]

= Contraste du Titre
#slide(title: "Titre sur fond clair vs fond sombre")[
  #highlight-box(title: [Jaune Sorbonne \#FFB700 (lum 0.72) — blanc], color: rgb("#FFB700"))[
    Luminance < 0.75 → texte blanc conservé (couleurs saturées).
  ]
  #v(0.5fr)
  #highlight-box(title: [Jaune pâle \#FFE5B4 (lum 0.85) — noir], color: rgb("#FFE5B4"))[
    Luminance > 0.75 → bascule au noir (fond vraiment clair).
  ]
  #v(0.5fr)
  #highlight-box(title: [Rouge sombre \#AC182E — blanc], color: rgb("#AC182E"))[
    Luminance < 0.75 → texte blanc.
  ]
  #v(0.5fr)
  #highlight-box(title: [Blanc — noir], color: white)[
    Luminance = 1.0 > 0.75 → texte noir.
  ]
  #v(0.5fr)
  #highlight-box(title: [Bleu nuit \#1D2769 — blanc], color: rgb("#1D2769"))[
    Luminance < 0.75 → texte blanc.
  ]
]

= Blocs Thématiques
#slide(title: "Adaptation à la Faculté")[
  #themed-block(title: "Bloc Thématique (Outline)")[
    S'adapte automatiquement à la couleur du thème.
  ]
  
  #v(2em)
  
  #themed-block(title: "Bloc Thématique (Fill)", fill-mode: "fill")[
    Version remplie avec la tonalité du thème.
  ]
]
