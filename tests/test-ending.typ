#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Ending Slide],
  author: [David Hajage],
)

= Introduction
#slide[
  Testing the new ending slide.
]

#ending-slide()

#ending-slide(
  title: [Merci de votre attention],
  subtitle: [Avez-vous des questions ?],
  contact: ("david@example.com", "@david_h")
)
