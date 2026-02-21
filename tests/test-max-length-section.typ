#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test max-length: Section Only],
  mapping: (section: 1),
  max-length: (section: 10),
)

= Une Section Extrêmement Longue
#slide[
  Le fil d'ariane doit afficher "Une Sectio..."
]
