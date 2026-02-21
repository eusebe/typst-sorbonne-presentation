#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(show-outline: true, title: [Test Only Subsection], mapping: (subsection: 1))
= Sous-section Unique
#slide[Test]
