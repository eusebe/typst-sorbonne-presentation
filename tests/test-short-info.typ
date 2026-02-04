#import "../lib.typ": *

#show: template.with(
  title: [Ceci est un titre extrêmement long qui ne tiendrait pas bien dans un pied de page],
  short-title: [Titre Court],
  author: [David Hajage (Sorbonne Université, Labo IPLESP, Equipe ERES)],
  short-author: [D. Hajage],
  faculty: "sciences",
)

= Test des versions courtes
#slide(title: "Vérification du pied de page")[
  Regardez le pied de page :
  
  - À gauche, vous devriez voir "*D. Hajage*" (au lieu du nom complet).
  - Au centre, sous le fil d'ariane, vous devriez voir "*Titre Court*" (au lieu du titre long).
]
