#import "../lib.typ": *

#show: template.with(
  title: [Test Multi-Columns],
  author: [David Hajage],
)

= Two Columns
#slide[
  #two-col(
    [
      *Left Column*
      #lorem(15)
    ],
    [
      *Right Column*
      #lorem(15)
    ]
  )
]

= Three Columns
#slide[
  #three-col(
    [
      *Column A*
      #lorem(10)
    ],
    [
      *Column B*
      #lorem(10)
    ],
    [
      *Column C*
      #lorem(10)
    ]
  )
]
