#import "../lib.typ": *

#show: template.with(
  title: [Test Long Text Overflow],
  author: [David Hajage],
  faculty: "univ",
)

= Long Content Test

#slide(title: "Page Overflow Scenario")[
  Ce test vérifie le comportement du thème lorsqu'un texte est trop long pour tenir sur une seule diapositive. 

  #lorem(100)

  #lorem(100)

  #lorem(100)

  #lorem(100)
]
