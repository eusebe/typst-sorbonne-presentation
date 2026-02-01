#import "../lib.typ": *

#show: template.with(
  title: [Test Subtitles],
  author: [David Hajage],
)

= Introduction

#slide(title: "Normal Slide", subtitle: "With a nice subtitle in the header")[
  The subtitle should appear just below the title in the header area.
]

#focus-slide([Impactful Message], subtitle: "A secondary detail for the focus slide")

#figure-slide(
  rect(width: 40%, height: 30%, fill: sorbonne-lightblue),
  title: "Figure Slide",
  subtitle: "Analyzing the blue rectangle",
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
