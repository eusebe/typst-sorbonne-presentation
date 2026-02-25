#import "../lib.typ": *

#show: sorbonne-template.with(
  title: [Debug: Mapping + Appendix (Pause After)],
  mapping: (section: 1),
)

= Section 1
#slide[Normal]

#appendix()

= Annexe 1
#slide[
  - A 
  #show: pause
  - B
]
