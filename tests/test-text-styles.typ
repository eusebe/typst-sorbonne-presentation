#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Styles de Texte],
  author: [David Hajage],
)

= Styles de Texte
#slide[
  Voici du texte standard.

  Voici une information #alert[importante] (Couleur Alert).

  Voici une information #muted[secondaire] (Gris moyen).

  Voici une information #subtle[tertiaire] (Gris clair).
]
