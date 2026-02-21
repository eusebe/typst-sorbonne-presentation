#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Progress Bar],
  author: [David Hajage],
  progress-bar: "bottom",
)

= Introduction
#slide[
  Check the bottom of the slide.
]

#slide[
  Slide 2 / 3
]

#slide[
  Slide 3 / 3
]

#appendix()

= Appendix
#slide[
  In appendix, the bar should be full.
]
