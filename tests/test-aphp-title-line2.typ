#import "../lib.typ": *

// Tests title-line2 with both cover styles (full and light)
// cover-style: "full" uses the navy right panel; title-line2 appears as a second blue bloc

#show: aphp-template.with(
  title: [Annual Clinical Report],
  title-line2: [Cardiology Department],
  subtitle: [Year 2025 — Summary],
  author: [Prof. Jean Martin],
  short-author: [J. Martin],
  affiliation: [AP-HP · Hôpital Lariboisière],
  date: [January 2026],
  mapping: (section: 1),
)

= Highlights

#slide(title: "Year in Review")[
  Activity summary for the cardiology department:

  - 1,200 patients treated
  - 98.2% satisfaction rate
  - 3 clinical trials initiated
  - 12 publications in peer-reviewed journals
]

#slide(title: "Two-Line Title — Light Mode")[
  The same title-line2 option also works with cover-style: "light".
  See test-aphp-cover-light-line2.typ for that variant.
]

#ending-slide(
  title: [Thank you],
  subtitle: [Questions?],
  contact: ("jean.martin@aphp.fr",),
)
