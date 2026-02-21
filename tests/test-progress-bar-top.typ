#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Progress Bar Top],
  author: [David Hajage],
  progress-bar: "top",
)

= Introduction
#slide[
  Check the top of the slide.
]

#slide[
  Slide 2 / 2
]
