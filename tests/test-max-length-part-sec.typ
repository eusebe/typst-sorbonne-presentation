#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test max-length: Part & Section],
  mapping: (part: 1, section: 2),
  max-length: (part: 4, section: 4),
)

= Première Partie
== Méthodologie
#slide[
  Le fil d'ariane doit afficher "Prem / Méth..."
]
