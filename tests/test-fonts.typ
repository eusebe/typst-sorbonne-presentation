#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Harmonisation Polices],
  author: [David Hajage],
  text-font: "PT Sans",
  text-size: 25pt,
)

= Introduction
#slide[
  Cette diapositive doit utiliser PT Sans en 25pt.
  
  Le titre de slide en haut doit aussi suivre.
]
