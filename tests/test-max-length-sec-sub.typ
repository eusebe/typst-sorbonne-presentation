#import "../lib.typ": *

#show: template.with(
  title: [Test max-length: Section & Subsection],
  mapping: (section: 1, subsection: 2),
  max-length: (section: 5, subsection: 5),
)

= Introduction
== Détails Techniques
#slide[
  Le fil d'ariane doit afficher "Intro / Détai..."
]
