#import "../lib.typ": *

#show: sorbonne-template.with(
  title: [Test: Part/Section Mapping + Appendix],
  mapping: (part: 1, section: 2),
)

= Partie 1
== Section 1
#slide[Content]

#appendix()

= Annexe 1
#slide[Contenu]
