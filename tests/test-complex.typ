#import "../lib.typ": *

#let handout-mode = sys.inputs.at("handout", default: "false") == "true"

#show: sorbonne-template.with(
  title: [Test Complexe Handout & Notes],
  author: [David Hajage],
  handout: handout-mode,
  mapping: (section: 1, subsection: 2),
)

= Introduction

== Objectifs
#slide(title: "Contenu Animé")[
  - Point 1 
  #show: pause
  - Point 2 
  #show: pause
  - Point 3
  
  #note[Notes pour la première slide.]
]

== Détails techniques
#slide(title: "Sans Notes")[
  Cette slide a des animations mais aucune note.
  #uncover(2, [Apparaît à l'étape 2.])
]

= Développement

== Analyse
#slide(title: "Slide avec plusieurs notes")[
  Contenu complexe.
  #note[Première partie de la note.]
  #note[Seconde partie de la note.]
]

#appendix()

= Annexes

#slide(title: "Slide d'annexe")[
  Contenu en annexe.
]
