#import "../lib.typ": *

#set bibliography(style: "apa")

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")
#let comp = sys.inputs.at("component", default: "slide")

#let template-func = if theme-choice == "iplesp" {
  iplesp-template.with(
    theme: if comp.starts-with("theme-") { comp.split("-").at(1) } else { "blue" },
    dark-mode: comp.contains("-dark"),
  )
} else {
  sorbonne-template.with(
    faculty: if comp.starts-with("faculty-") { comp.split("-").at(1) } else { "sante" },
    dark-mode: comp.contains("-dark"),
  )
}

#show: template-func.with(
  title: [Gallery Preview],
  author: [John Doe],
)

// Main content logic
#if comp == "slide" {
  slide(title: "Normal Slide Usage")[
    - Support for bullet points
    - Automatic layout management
    - Clean and academic style
  ]
} else if comp == "focus-slide" {
  focus-slide([Impactful Messages], subtitle: "A dedicated layout for key quotes")
} else if comp == "figure-slide" {
  figure-slide(
    rect(width: 40%, height: 30%, fill: blue.lighten(80%), stroke: 1pt + black),
    title: "Data Visualization",
    caption: [A centered figure with caption]
  )
} else if comp == "equation-slide" {
  equation-slide(
    $ f(x) = 1 / (sigma sqrt(2 pi)) exp(- 1/2 ( (x - mu) / sigma )^2) $,
    title: [Scientific Formulas],
    definitions: [/ $mu$: Mean / $sigma$: SD],
    citation: (bib-key: "gauss1809", label: "Gauss")
  )
} else if comp == "acknowledgement-slide" {
  acknowledgement-slide(
    title: "Acknowledgements",
    people: ((name: "Prof. Smith", role: "Supervisor"),),
    institutions: ("Sorbonne University", "CNRS"),
  )
} else if comp == "ending-slide" {
  ending-slide(
    title: [Thank you!],
    contact: ("contact\@example.com",)
  )
} else if comp == "helper-text" {
  slide(title: "Text Helpers")[
    - #alert[Alert text]
    - #muted[Muted text]
    - #subtle[Subtle text]
  ]
} else if comp == "layout-2col" {
  slide(title: "Two Columns")[
    #two-col([Left side content], [Right side content])
  ]
} else if comp == "layout-3col" {
  slide(title: "Three Columns")[
    #three-col([A], [B], [C])
  ]
} else if comp == "layout-grid2x2" {
  slide(title: "Grid Layout")[
    #grid-2x2([1], [2], [3], [4])
  ]
} else if comp == "boxes" {
  slide(title: "Boxes")[
    #highlight-box(title: "Note")[Some content]
    #v(1em)
    #alert-box(title: "Warning")[Caution]
  ]
} else if comp == "citations" {
  slide(title: "Citations Style")[
    Check this @smith2023.
    #cite-box("doe2024", position: "bottom-right")
  ]
}

#context {
  if query(cite).len() > 0 {
    bibliography("refs.bib", title: none)
  }
}
