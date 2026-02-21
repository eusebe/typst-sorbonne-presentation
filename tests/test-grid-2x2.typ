#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
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
  #let blue-col = if theme-choice == "iplesp" { iplesp-blue } else { sorbonne-blue }
  #let red-col = if theme-choice == "iplesp" { iplesp-red } else { sorbonne-red }
  #let lightblue-col = if theme-choice == "iplesp" { iplesp-lightblue } else { sorbonne-lightblue }
  #let yellow-col = if theme-choice == "iplesp" { iplesp-yellow } else { sorbonne-yellow }

  #grid-2x2(
    rect(width: 100%, height: 3em, fill: blue-col),
    rect(width: 100%, height: 3em, fill: red-col),
    rect(width: 100%, height: 3em, fill: lightblue-col),
    rect(width: 100%, height: 3em, fill: yellow-col),
    gutter: 1em
  )
]
