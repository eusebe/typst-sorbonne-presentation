#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Annexes Multi-niveaux],
  author: [David Hajage],
  mapping: (part: 1, section: 2, subsection: 3),
)

= Partie Principale
== Section 1
#slide[Contenu]

#appendix()

= Bloc Annexe A
== Détails Techniques
=== Implémentation
#slide[Test Sous-section Annexe]

== Résultats
#slide[Test Section Annexe]

= Bloc Annexe B

#slide[Test Partie Annexe]
