#import "../lib.typ": *

#show: sorbonne-template.with(
  title: [Test: Pause -> Normal -> Appendix],
  mapping: (section: 1),
)

= Section 1
#slide[
  - A 
  #show: pause
  - B
]

#slide[Normal Slide]

#appendix()

= Annexe 1
#slide[Contenu]
