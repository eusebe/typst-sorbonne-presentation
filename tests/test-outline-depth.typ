#import "../lib.typ": *

#show: sorbonne-template.with(
  title: [Test Outline Depth],
  author: [Tester],
  show-outline: true,
  outline-depth: 1,
)

= Section 1
== Subsection 1.1
#slide[Content]

= Section 2
== Subsection 2.1
#slide[Content]

#appendix()

= Appendix 1
#slide[Content]
