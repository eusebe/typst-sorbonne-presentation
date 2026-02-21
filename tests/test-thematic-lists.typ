#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with(faculty: "sante")
}

#show: my-template.with(
  title: [Test Listes Thématiques],
  author: [David Hajage],
)

= Liste de test
#slide[
  - Liste à puces
  - Deuxième item
  
  + Premier numéro
  + Deuxième numéro
]
