#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with(faculty: "sciences")
}

#show: my-template.with(
  title: [Ceci est un titre extrêmement long qui ne tiendrait pas bien dans un pied de page],
  short-title: [Titre Court],
  author: [David Hajage (Sorbonne Université, Labo IPLESP, Equipe ERES)],
  short-author: [D. Hajage],
)

= Test des versions courtes
#slide(title: "Vérification du pied de page")[
  Regardez le pied de page :
  
  - À gauche, vous devriez voir "*D. Hajage*" (au lieu du nom complet).
  - Au centre, sous le fil d'ariane, vous devriez voir "*Titre Court*" (au lieu du titre long).
]
