#import "../lib.typ": *

#show: template.with(
  title: [Test Fonction Alert],
  author: [David Hajage],
  faculty: "sante",
)

= Introduction
#slide[
  Voici un exemple de texte normal.
  
  Voici un exemple de texte avec #alert[une mise en évidence importante].
  
  La couleur doit correspondre au rouge de la Faculté de Santé.
]
