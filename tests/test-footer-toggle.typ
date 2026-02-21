#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Footer Toggle],
  author: [David Hajage],
  footer-author: false,
  footer-title: false,
)

= Test sans auteur ni titre
#slide(title: "Fil d'ariane à gauche")[
  Le pied de page ne doit afficher ni l'auteur ni le titre.
  
  Le fil d'ariane doit commencer tout à gauche du pied de page.
]
