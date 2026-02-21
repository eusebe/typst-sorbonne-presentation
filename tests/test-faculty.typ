#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with(faculty: "sciences")
}

#show: my-template.with(
  title: [Test Faculté],
  subtitle: [Démonstration du thème],
  author: [David Hajage],
  affiliation: [Sorbonne Université],
  show-outline: true,
)

= Introduction
== Recherche
#slide[
  - Laboratoires d'excellence
  - Projets internationaux
  - Innovation technologique
]

= Projets
== Intelligence Artificielle
#slide[
  Démonstration du changement de couleur et de logo.
]
