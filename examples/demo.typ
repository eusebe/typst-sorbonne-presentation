#import "../lib.typ": *

#show: template.with(
  title: [Typesetting moderne à l'Université],
  subtitle: [Template Sorbonne Université pour Typst],
  author: [David Hajage],
  affiliation: [Sorbonne Université, Faculté de Santé],
  show-header-numbering: false,
  show-outline: true,
)

= Introduction
== Pourquoi Typst ?
#slide[
  - Performance (compilation instantanée)
  - Syntaxe intuitive et moderne
  - Programmabilité via des fonctions
  #show: pause
  *Le thème Sorbonne :*
  - Intègre `presentate` pour les animations.
  - Utilise `navigator` pour la structure.
]

= Fonctionnement Technique
== Transitions Automatiques
#slide[
  Le thème détecte automatiquement les titres de niveau 1 (=) et de niveau 2 (==).
  #show: pause
  Il génère alors une diapositive de transition avec :
  - Le numéro de section en gros
  - Le titre de la section
  - Le sommaire de la section (liste des sous-sections)
]

== Fil d'Ariane
#slide(title: "Personnalisation du Titre")[
  Regardez en bas de la diapositive : le fil d'Ariane s'adapte à votre position.
  #show: pause
  Vous pouvez aussi forcer un titre manuel pour la slide, comme je l'ai fait ici.
]

= Conclusion
#slide[
  Merci pour votre patience ! Le template est prêt à être utilisé.
]
