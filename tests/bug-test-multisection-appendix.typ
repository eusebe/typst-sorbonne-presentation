#import "../lib.typ": *

#show: sorbonne-template.with(
  title: [Test: Multiple Sections + Appendix],
  mapping: (section: 1),
)

= Section 1
#slide[Content 1]

= Section 2
#slide[Content 2]

#appendix()

= Annexe 1
#slide[Contenu]
