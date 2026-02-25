#import "../lib.typ": *

#show: sorbonne-template.with(
  title: [Test: Appendix before Pause],
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
