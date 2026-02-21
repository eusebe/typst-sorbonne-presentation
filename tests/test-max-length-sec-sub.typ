#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test max-length: Section & Subsection],
  mapping: (section: 1, subsection: 2),
  max-length: (section: 5, subsection: 5),
)

= Introduction
== Détails Techniques
#slide[
  Le fil d'ariane doit afficher "Intro / Détai..."
]
