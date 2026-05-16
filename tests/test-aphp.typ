#import "../lib.typ": *

#show: aphp-template.with(
  title: [Réunion du Comité de Direction],
  subtitle: [Bilan annuel et perspectives 2025],
  author: [Dr. Marie Dupont],
  affiliation: [Service d'épidémiologie — AP-HP],
  date: [15 janvier 2025],
  mapping: (section: 1, subsection: 2),
)

= Contexte et objectifs

== Situation actuelle

#slide(title: "État des lieux")[
  - Premier point important
  - Deuxième point
  - Troisième point
]

== Données récentes

#slide(title: "Indicateurs clés")[
  Les indicateurs montrent une amélioration notable.

  #alert-box[Résultat principal : +12% en 2024]
]

= Méthodes

== Protocole

#slide(title: "Protocole d'étude")[
  - Étude multicentrique (N=1 200)
  - Période : janvier 2023 – décembre 2024
  - Critère principal : mortalité à 30 jours
]

== Analyse statistique

#slide(title: "Méthodes statistiques")[
  Régression logistique multivariée ajustée sur :

  - Âge et sexe
  - Comorbidités (score de Charlson)
  - Délai de prise en charge
]

= Résultats

== Résultats principaux

#slide(title: "Résultats principaux")[
  Réduction significative de la mortalité :

  - Groupe intervention : 8,2%
  - Groupe contrôle : 14,7%
  - OR = 0,52 (IC 95% : 0,38–0,71)
]

== Discussion

#slide(title: "Interprétation")[
  Ces résultats sont cohérents avec la littérature internationale.

  #highlight-box[Points forts : randomisation, effectif suffisant, suivi complet]
]

#appendix()

= Annexes

#slide(title: "Analyses de sensibilité")[
  Les analyses de sensibilité confirment la robustesse des résultats.
]

#aphp-ending-slide(
  title: [Merci de votre attention !],
  subtitle: [Questions ?],
  contact: ("marie.dupont@aphp.fr",),
)
