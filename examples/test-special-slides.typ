#import "../lib.typ": *

#show: template.with(
  title: [Diapositives Spéciales],
  subtitle: [Focus, Figures et Comparaisons],
  author: [David Hajage],
)

= Composants Visuels
#slide(title: "Diapositive Standard")[
  Voici une diapositive standard avec du texte.
  - Point 1
  - Point 2
]

#focus-slide[
  Ceci est une Focus Slide.\
  Pour les messages percutants.
]

#figure-slide(
  rect(width: 60%, height: 40%, fill: sorbonne-lightblue, stroke: 2pt + sorbonne-blue),
  title: [Visualisation simple],
  caption: [Une figure centrée avec sa légende automatique.]
)

#figure-slide-split(
  rect(width: 100%, height: 50%, fill: sorbonne-red.lighten(80%), stroke: 1pt + sorbonne-red),
  rect(width: 100%, height: 50%, fill: rgb("#2E7D32").lighten(80%), stroke: 1pt + rgb("#2E7D32")),
  title: [Comparaison Côte à Côte],
  caption-left: [Analyse A],
  caption-right: [Analyse B],
)

#slide(title: "Intégration Mixte")[
  #two-col(
    [
      On peut aussi mixer les composants standard :
      #alert-box(title: "Observation")[
        Le comportement est cohérent.
      ]
    ],
    rect(width: 100%, height: 100%, fill: gray.lighten(90%), stroke: gray)
  )
]
