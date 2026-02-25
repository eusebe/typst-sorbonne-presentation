#import "../lib.typ": *

#show: sorbonne-template.with(
  title: [Debug 2: Footer Stress],
  author: [Debug],
)

#for i in range(1, 10) [
  = Section #i
  #slide[Slide #i.1]
  #slide[Slide #i.2]
]

#appendix()

= Annexes
#slide[Page A1]
#slide[Page A2]
