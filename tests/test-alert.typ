#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with(faculty: "sante")
}

#show: my-template.with(
  title: [Test Fonction Alert],
  author: [David Hajage],
)

= Introduction
#slide[
  Voici un exemple de texte normal.
  
  Voici un exemple de texte avec #alert[une mise en évidence importante].
  
  La couleur doit correspondre à la couleur d'alerte du thème.
]
