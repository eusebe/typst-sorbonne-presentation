#import "../lib.typ": *

#show: sorbonne-template.with(
  title: [Test: Mapping + Pause (No Appendix)],
  mapping: (section: 1),
)

= Section 1
#slide[
  - A 
  #show: pause
  - B
]

= Section 2
#slide[Content]
