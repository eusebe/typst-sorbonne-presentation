#import "../lib.typ": *

// Tests cover-style: "light" and classification banner

#show: aphp-template.with(
  title: [Annual Strategy Report],
  subtitle: [Q1–Q2 2026 Results],
  author: [Dr. Marie Dupont],
  short-author: [M. Dupont],
  affiliation: [AP-HP · Sorbonne Université],
  date: [June 2026],
  cover-style: "light",
  classification: [C1 — Internal],
  mapping: (section: 1),
)

= Results

#slide(title: "Key Findings")[
  Main results for the period under review:

  - Metric A increased by 12%
  - Metric B remained stable
  - Metric C showed a 5% decline

  #highlight-box(title: "Conclusion")[
    Overall performance is above target for this period.
  ]
]

#slide(title: "Two-Column Layout")[
  #two-col(
    [*This quarter*

    Three new projects launched across the division.],
    [*Next quarter*

    Focus shifts to evaluation and external reporting.]
  )
]

#ending-slide(
  title: [Thank you],
  subtitle: [Questions?],
  contact: ("marie.dupont@aphp.fr",),
)
