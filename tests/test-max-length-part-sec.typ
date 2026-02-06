#import "../lib.typ": *

#show: template.with(
  title: [Test max-length: Part & Section],
  mapping: (part: 1, section: 2),
  max-length: (part: 4, section: 4),
)

= Première Partie
== Méthodologie
#slide[
  Le fil d'ariane doit afficher "Prem / Méth..."
]
