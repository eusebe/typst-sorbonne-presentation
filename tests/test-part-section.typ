#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(show-outline: true, 
  title: [Test Mapping Part/Section],
  subtitle: [Niveau 1 = Part, Niveau 2 = Section],
  author: [David Hajage],
  mapping: (part: 1, section: 2),
  numbering-format: "a.1",
  part-numbering-format: "I",
)

= Première Partie (Romain)

== Section 1.1 (Arabe)

#slide[
  Cette slide appartient à une section dont le parent est une partie.
  La transition de la partie devait être centrée et sans roadmap.
  La transition de la section devait avoir un numéro géant "1".
]

== Section 1.2

#slide[
  Test de numérotation.
]

= Seconde Partie

== Section 2.1

#slide[
  Fin du test.
]
