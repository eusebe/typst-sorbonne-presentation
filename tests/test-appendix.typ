#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Support Annexes V2],
  author: [David Hajage],
  annex-title: [Annexes],
  annex-numbering-format: "I",
)

= Partie Principale
#slide[
  Cette slide doit afficher 1 / 2.
]

#slide[
  Cette slide doit afficher 2 / 2.
]

#appendix()

= Détails techniques
#slide[
  Cette slide doit afficher 4 / 2.
  
  Le titre au-dessus doit être "Annexes I Détails techniques" (ou similaire selon le format).
]

= Résultats bruts
#slide[
  Cette slide doit afficher 5 / 2.
  
  Titre attendu : "Annexes II Résultats bruts".
]
