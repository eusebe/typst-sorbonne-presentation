#import "../lib.typ": *

#show: template.with(
  title: [Test Equation Slide],
  author: [David Hajage],
  faculty: "sciences"
)

= Physique Fondamentale

#equation-slide(
  $E = m c^2$,
  title: [Équivalence Masse-Énergie],
  subtitle: [L'équation la plus célèbre d'Einstein],
  definitions: [
    / $E$: Énergie (Joules)
    / $m$: Masse (kg)
    / $c$: Vitesse de la lumière ($3 times 10^8$ m/s)
  ],
  citation: (bib-key: "einstein1905", label: "Einstein 1905")
)

= Mathématiques Financières

#equation-slide(
  $ C_n = C_0 (1 + t)^n $,
  title: [Intérêts Composés],
  definitions: [
    Nous définissons les termes suivants :
    / $C_n$: Capital à l'année $n$
    / $C_0$: Capital initial
    / $t$: Taux d'intérêt annuel
    / $n$: Durée en années
  ]
)

= Bibliographie
#slide[
  #bibliography("refs.bib", title: none)
]