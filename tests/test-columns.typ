#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Multi-colonnes],
  author: [David Hajage],
)

= Introduction
#slide[
  Voici une slide avec deux colonnes :
  
  #v(1em)
  
  #two-col(
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
