#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Subtitles],
  author: [David Hajage],
)

= Introduction

#slide(title: "Normal Slide", subtitle: "With a nice subtitle in the header")[
  The subtitle should appear just below the title in the header area.
]

#focus-slide([Impactful Message], subtitle: "A secondary detail for the focus slide")

#figure-slide(
  rect(width: 40%, height: 30%, fill: blue.lighten(80%)),
  title: "Figure Slide",
  subtitle: "Analyzing the rectangle",
  caption: [A centered caption]
)

#equation-slide(
  $ E = m c^2 $,
  title: "Equation Slide",
  subtitle: "Mass-Energy Equivalence",
  definitions: [/ $E$: energy]
)

#acknowledgement-slide(
  title: "Thanks",
  subtitle: "Special gratitude to my team",
  people: ((name: "John Doe", role: "Contributor"),)
)

#ending-slide(subtitle: "Follow-up information")
