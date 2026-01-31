#import "../lib.typ": *

#show: template.with(
  title: [Test Composants de Boîtes],
  subtitle: [Démonstration des variantes et modes],
  author: [David Hajage],
  faculty: "lettres",
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
    *Input:* Data $X$ \
    *Output:* Result $Y$ 
    + Process data
    + Apply transformation
    + Validate results
    + Return $Y$
  ]
]

= Blocs Thématiques
#slide(title: "Adaptation à la Faculté")[
  #themed-block(title: "Bloc Lettres (Outline)")[
    S'adapte automatiquement à la couleur jaune/ocre de la faculté.
  ]
  
  #v(2em)
  
  #themed-block(title: "Bloc Lettres (Fill)", fill-mode: "fill")[
    Version remplie avec la tonalité de la faculté.
  ]
]