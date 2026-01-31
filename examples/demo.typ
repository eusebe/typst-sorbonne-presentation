#import "../lib.typ": *
#import "@preview/physica:0.9.6": *

#show: template.with(
  title: [Sorbonne Template: Complete Guide],
  subtitle: [Demonstration of all features and components],
  author: [David Hajage],
  affiliation: [Sorbonne University],
  faculty: "univ",
  show-outline: true,
  outline-columns: 2,
  mapping: (section: 1),
)

// ==========================================
= Basic Components & Layout
// ==========================================

#slide(title: "Slides & Lists")[
  The `#slide()` function is the core component. It supports standard Typst content.
  
  + First item
  + Second item
    - Sub-item
]

#slide(title: "Text Styles")[
  Three functions to prioritize information:
  
  - *Alert*: For #alert[critical] information.
  - *Muted*: For #muted[secondary] information.
  - *Subtle*: For #subtle[tertiary] information.
]

#slide(title: "Multi-column Layouts")[
  The template provides dedicated functions for balanced layouts:
  
  - `two-col(left, right, ..)` and `three-col(left, center, right, ..)`
  - *Parameters*:
    - `columns`: Array of widths (e.g., `(1fr, 2fr)`). Defaults to equal widths.
    - `gutter`: Spacing between columns (default: `2em`).

  #v(0.5em)
  #two-col(
    [*Two-col*: Default equal width. #lorem(5)],
    [#lorem(10)]
  )
  #v(0.5em)
  #two-col(
    [*Custom width*: Using `columns: (1fr, 2fr)`.], [#lorem(10)],
    columns: (1fr, 2fr)
  )
  #v(0.5em)
  #three-col(
    [*Three-col*], [Equal width], [distribution]
  )
]

// ==========================================
= Boxes & Blocks
// ==========================================

#slide(title: "Institutional Boxes")[
  #highlight-box(title: "Highlight Box")[Key points using theme blue.]
  #v(0.5em)
  #alert-box(title: "Alert Box", fill-mode: "fill")[Warnings using theme red.]
  #v(0.5em)
  #example-box(title: "Example Box", fill-mode: "full")[Examples using green.]
]

#slide(title: "Technical Blocks")[
  #algorithm-box(title: "Algorithm Box")[
    + Step 1: Initialize
    + Step 2: Process
  ]
  #v(1em)
  #themed-block(title: "Themed Block")[Adapts to the chosen faculty color.]
]

// ==========================================
= Citations & References
// ==========================================

#slide(title: "Citations Style")[
  Inline citations like @smith2023 or @einstein1905 are highlighted.
  
  You can also use corner boxes:
  
  #cite-box("smith2023", position: "bottom-right")
  #cite-box("doe2024", display-label: "Jane Doe (2024)", position: "top-right")
]

#slide(title: "Bibliography Slide")[
  The bibliography is standard and should be placed in a `#slide()`.
  
  #bibliography("refs.bib", title: none)
]

// ==========================================
= Special Slide Types
// ==========================================

#focus-slide[
  This is a `#focus-slide` for impactful messages.
]

#figure-slide(
  rect(width: 40%, height: 30%, fill: sorbonne-lightblue),
  title: "Figure Slide",
  caption: [A centered caption]
)

#acknowledgement-slide(
  subtitle: [Acknowledgements:],
  people: ((name: "Prof. Smith", role: "Supervisor"),),
  institutions: ("Sorbonne University",),
)

#equation-slide(
  $ i hbar pdv(Psi, t) = - hbar^2 / (2m) laplacian(Psi) + V Psi $,
  title: [Equation Slide],
  definitions: [
    / $Psi$: Wavefunction
    / $V$: Potential energy
  ],
  citation: (bib-key: "einstein1905", label: "Quantum Origins")
)

#ending-slide()

// ==========================================
= Template Configuration
// ==========================================

#slide(title: "Appendix & Hierarchy Control")[
  #two-col(
    [
      *Using Appendices*
      - Call `#appendix()` to start.
      - Resets heading counters.
      - Displays a focus slide using `annex-main-title`.
      - Changes numbering style to `annex-title` + `annex-numbering-format`.
    ],
    [
      *Mapping Logic*
      - `mapping` defines roles for levels:
      - `(section: 1)` : Level 1 is a section.
      - `(part: 1, section: 2)` : Level 1 is a Part, Level 2 is a Section.
      - Transition slides and breadcrumbs adapt to these roles.
    ]
  )
]

#slide(title: "Theme Configuration Reference (1/2)")[
  #set text(size: 0.72em)
  #two-col(
    [
      *Identification & Date*
      - `title`, `subtitle`, `author`, `affiliation`.
      - `date`: Defaults to today.
      
      *Visual Identity*
      - `faculty`: `"univ"` (default), `"sante"`, `"sciences"`, `"lettres"`.
      - `primary-color` / `alert-color`: Manual hex/rgb overrides.
      - `logo-slide` / `logo-transition`: Image paths.
      
      *Typography & Global*
      - `text-font` / `text-size`: e.g., `"Fira Sans"`, `20pt`.
      - `aspect-ratio`: `"16-9"` or `"4-3"`.
    ],
    [
      *Outline (TOC)*
      - `show-outline`: Toggle summary slide.
      - `outline-title`: Title of the TOC.
      - `outline-depth`: Levels shown in TOC.
      - `outline-columns`: Number of columns for TOC.
      
      *Header & Numbering*
      - `show-header-numbering`: Toggle all numbers.
      - `numbering-format`: For sections (e.g., `"1.1"`).
      - `part-numbering-format`: For parts (e.g., `"I"`).
    ]
  )
]

#slide(title: "Theme Configuration Reference (2/2)")[
  #set text(size: 0.8em)
  *Navigation & Appendix*
  - `mapping`: Dict of roles (part/section/subsection) vs levels.
  - `auto-title`: Boolean. If true, slides without a title use the section name.
  - `transitions`: Dictionary for `navigator` roadmap customization.
  - `annex-title`: Prefix for single appendix (e.g., `"Appendix"`).
  - `annex-main-title`: Focus slide text (e.g., `"Technical Annexes"`).
  - `annex-numbering-format`: Numbering style (e.g., `"A"`, `"I"`, `"1"`).
]
