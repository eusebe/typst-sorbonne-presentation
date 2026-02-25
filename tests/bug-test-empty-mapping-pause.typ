#import "../lib.typ": *

#show: sorbonne-template.with(
  title: [Test: Empty Mapping + Pause],
  mapping: (:),
)

= Section 1
#slide[
  - A 
  #show: pause
  - B
]

#appendix()

= Annexe 1
#slide[Contenu]
