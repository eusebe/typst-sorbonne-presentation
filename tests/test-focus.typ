#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Focus Slide],
  author: [David Hajage],
)

= Introduction
#slide[Une slide normale avant le focus.]

#focus-slide[
  "Le savoir est la seule matière qui s'accroît quand on la partage."
]

#slide[Une slide normale après le focus.]
