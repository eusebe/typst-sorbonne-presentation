#import "../lib.typ": *

#show: template.with(show-outline: true, 
  title: [Ma Présentation Sorbonne],
  subtitle: [Template basé sur presentate],
  author: [David Hajage],
  affiliation: [Sorbonne Université, Faculté de Santé],
)

#slide(title: "Introduction")[
  Voici une présentation utilisant le nouveau thème Sorbonne.
  
  - Basé sur `presentate`
  - Utilise `navigator` pour les transitions
  - Respecte la charte graphique
]

= Première Section

== Sous-section 1.1

#slide(title: "Contenu de test")[
  #lorem(40)
  
  #pause
  
  Apparition après une pause.
]

== Sous-section 1.2

#slide(title: "Encore du contenu")[
  $ x_(n+1) = (x_n + a/x_n) / 2 $
]

= Deuxième Section

#slide(title: "Conclusion")[
  Merci de votre attention !
]
