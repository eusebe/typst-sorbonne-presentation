#import "../lib.typ": *

#show: template.with(
  title: [Test Mapping Part/Section],
  subtitle: [Niveau 1 = Part, Niveau 2 = Section],
  author: [David Hajage],
  mapping: (part: 1, section: 2)
)

= Première Partie (Romain)

== Section 1.1 (Arabe)

#slide[
  Cette slide appartient à une section dont le parent est une partie.
  La transition de la partie devait être centrée et sans roadmap.
  La transition de la section devait avoir un numéro géant "1".
]

== Section 1.2

#slide[
  Test de numérotation.
]

= Seconde Partie

== Section 2.1

#slide[
  Fin du test.
]
