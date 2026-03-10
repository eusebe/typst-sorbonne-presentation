#import "../lib.typ": *

#show: sorbonne-template.with(
  title: [Test Outline Custom],
  author: [Tester],
  show-outline: true,
  outline-title: [Sommaire détaillé],
  outline-columns: 2,
)

= Section 1
== Subsection 1.1
#slide[Content]
== Subsection 1.2
#slide[Content]

= Section 2
== Subsection 2.1
#slide[Content]
== Subsection 2.2
#slide[Content]

= Section 3
== Subsection 3.1
#slide[Content]

#appendix()

= Appendix 1
#slide[Content]
