#import "../lib.typ": *

// Tests logo-left and logo-right overrides
// Uses coloured boxes as substitutes for custom institutional logos

#show: aphp-template.with(
  title: [Custom Logo Override Test],
  subtitle: [Verifying logo-left and logo-right parameters],
  author: [David Hajage],
  affiliation: [AP-HP],
  date: [2026],
  logo-left: box(
    fill: blue.lighten(80%), width: 3.5cm, height: 0.85cm,
    align(center + horizon, text(size: 7pt, fill: blue.darken(20%), [Custom Left Logo]))
  ),
  logo-right: box(
    fill: red.lighten(80%), width: 6cm, height: 1.7cm,
    align(center + horizon, text(size: 7pt, fill: red.darken(20%), [Custom Right Logo]))
  ),
  mapping: (section: 1),
)

= Content

#slide(title: "Logo Override Verification")[
  The coloured boxes below replace the default AP-HP logos:

  - *Bottom-left* — blue box (replaces AP-HP / Sorbonne Université logo)
  - *Bottom-right* — red box (replaces AP-HP full logo)

  Both should appear on every content slide and on the title slide.
]

#slide(title: "Second Slide — Logos Should Persist")[
  Custom logos must also be visible on continuation slides.
  This verifies that the override is applied globally, not only on the first slide.
]

#aphp-ending-slide(
  title: [End of Test],
  subtitle: [Custom logos should appear here too],
  contact: none,
)
