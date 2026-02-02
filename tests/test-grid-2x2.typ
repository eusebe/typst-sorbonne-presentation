#import "../lib.typ": *

#show: template.with(
  title: [Test Grid 2x2],
  author: [David Hajage],
)

= Layout Demonstration
#slide(title: "2x2 Grid Layout")[
  #grid-2x2(
    [
      *Top Left* \ #lorem(10)
    ],
    [
      *Top Right* \ #lorem(10)
    ],
    [
      *Bottom Left* \ #lorem(10)
    ],
    [
      *Bottom Right* \ #lorem(10)
    ]
  )
]

#slide(title: "Grid of Images")[
  #grid-2x2(
    rect(width: 100%, height: 3em, fill: sorbonne-blue),
    rect(width: 100%, height: 3em, fill: sorbonne-red),
    rect(width: 100%, height: 3em, fill: sorbonne-lightblue),
    rect(width: 100%, height: 3em, fill: sorbonne-yellow),
    gutter: 1em
  )
]

