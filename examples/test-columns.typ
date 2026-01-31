#import "../lib.typ": *

#show: template.with(
  title: [Test Multi-colonnes],
  author: [David Hajage],
)

= Introduction
#slide[
  Voici une slide avec deux colonnes :
  
  #v(1em)
  
  #side-by-side(
    [
      *Colonne de gauche*
      - Premier point
      - Deuxième point
    ],
    [
      *Colonne de droite*
      - Image ou texte
      - Encore du contenu
    ]
  )
]
