#import "../lib.typ": *

#show: template.with(
  title: [Hiérarchie Complexe],
  subtitle: [Test de l'option mapping à 3 niveaux],
  author: [David Hajage],
  affiliation: [Sorbonne Université],
  mapping: (part: 1, section: 2, subsection: 3),
  show-outline: true,
  numbering-format: "1.a",
  part-numbering-format: "A",
)

= Première Partie
== Introduction
=== Pourquoi Typst ?
#slide[
  - Performance
  - Modernité
]

== Objectifs
#slide[Test de transition.]

= Deuxième Partie
== Méthodologie
=== Analyse du code
#slide[Vérification du logo et du nom de partie en haut à droite.]
