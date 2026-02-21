#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with(title: [Test Dark Mode])
} else {
  sorbonne-template.with(title: [Test Dark Mode])
}

#show: my-template.with(dark-mode: true)

= Section 1

== Subsection 1

#slide(title: "Dark Slide")[
  Check if colors are correct in dark mode.
  #alert[Alert text]
  #muted[Muted text]
]

#slide(title: "Code and Algorithms")[
  ```python
  def compute_science():
      # Correct contrast in dark mode
      return 42
  ```

  #v(0.5em)

  #algorithm-box(title: "Dark Processing")[
    + Initialize environment
    + Apply dark theme styles
    + Render components
  ]
]

#slide[
  #bibliography("refs.bib", title: none)
]
