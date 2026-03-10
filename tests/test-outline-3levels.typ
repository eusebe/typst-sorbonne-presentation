#import "../lib.typ": *

#show: sorbonne-template.with(
  title: [Test Outline 3 Levels],
  author: [Tester],
  show-outline: true,
  mapping: (part: 1, section: 2, subsection: 3),
  outline-depth: 3,
)

= Part 1
== Section 1.1
=== Subsection 1.1.1
#slide[Content]

== Section 1.2
=== Subsection 1.2.1
#slide[Content]

#appendix()

= Appendix 1
== Appendix Section 1.1
#slide[Content]
