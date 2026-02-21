#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with(faculty: "lettres")
}

#show: my-template.with(
  title: [Test Couleur Fil d'Ariane],
  author: [David Hajage],
  mapping: (section: 1, subsection: 2),
)

= Première Section
== Sous-section
#slide[
  Regardez le fil d'ariane en bas au centre.
  
  L'élément actif doit être à la couleur du thème.
]
