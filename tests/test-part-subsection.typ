#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(show-outline: true, title: [Test Part & Subsection], mapping: (part: 1, subsection: 2))
= Partie I
== Sous-section 1.1
#slide[Test]
