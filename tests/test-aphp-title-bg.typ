#import "../lib.typ": *

// Tests the title-bg-light parameter (added for API coherence with sorbonne/iplesp)
// Uses cover-style: "light" so the full background is visible (no navy right panel)

#show: aphp-template.with(
  title: [Custom Title Background],
  subtitle: [Testing the title-bg-light parameter],
  author: [David Hajage],
  affiliation: [AP-HP],
  date: [2026],
  cover-style: "light",
  title-bg-light: rgb("#e8f0fe"),
  mapping: (section: 1),
)

= Content

#slide(title: "title-bg-light Verification")[
  The title slide should display a custom light blue (`#e8f0fe`) background
  instead of the default white.

  The standard footer and slide decorations are unaffected by this parameter.
]

#aphp-ending-slide(
  title: [End of Test],
  subtitle: none,
  contact: none,
)
