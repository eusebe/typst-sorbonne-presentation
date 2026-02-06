#import "../lib.typ": *

#show: template.with(
  title: [Test max-length: Section Only],
  mapping: (section: 1),
  max-length: (section: 10),
)

= Une Section Extrêmement Longue
#slide[
  Le fil d'ariane doit afficher "Une Sectio..."
]
