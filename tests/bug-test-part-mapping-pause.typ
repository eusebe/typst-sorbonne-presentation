#import "../lib.typ": *

#show: sorbonne-template.with(
  title: [Test: Part/Section Mapping + Appendix + Pause],
  mapping: (part: 1, section: 2),
)

= Partie 1
== Section 1
#slide[
  - A
  #show: pause
  - B
]

#appendix()

= Annexe 1
#slide[Contenu]
