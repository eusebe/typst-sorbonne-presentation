#import "../lib.typ": *

#show: template.with(
  title: [Test Footer Toggle],
  author: [David Hajage],
  footer-author: false,
  footer-title: false,
  faculty: "univ",
)

= Test sans auteur ni titre
#slide(title: "Fil d'ariane à gauche")[
  Le pied de page ne doit afficher ni l'auteur ni le titre.
  
  Le fil d'ariane doit commencer tout à gauche du pied de page.
]
