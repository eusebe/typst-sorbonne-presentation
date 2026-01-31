#import "../lib.typ": *

#show: template.with(
  title: [Test Boîtes Améliorées],
  author: [David Hajage],
  faculty: "lettres",
)

= Boîtes avec mode Fill
#slide[
  #highlight-box(title: "Important", fill-mode: "fill")[
    Le corps de cette boîte doit être teinté en bleu clair sans espace blanc avec le titre.
  ]
  
  #v(0.5em)
  
  #alert-box(title: "Warning", fill-mode: "fill")[
    Le corps doit être teinté en rouge clair.
  ]
  
  #v(0.5em)
  
  #example-box(title: "Example", fill-mode: "fill")[
    Le corps doit être teinté en vert clair.
  ]
]

#slide(title: "Blocs Thématiques")[
  #themed-block(title: "Thème Lettres (Fill)", fill-mode: "fill")[
    Ce bloc doit être ocre/jaune sans espace blanc.
  ]
]