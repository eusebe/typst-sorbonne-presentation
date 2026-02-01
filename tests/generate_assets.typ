#import "../lib.typ": *
#import "@preview/physica:0.9.6": *

// PPI et dimensions gérées par la CLI
#let comp = sys.inputs.at("component", default: "slide")

#if comp == "faculty-univ" {
  template(faculty: "univ", title: [Faculty: Univ], author: [John Doe], date: none)[]
} else if comp == "faculty-sante" {
  template(faculty: "sante", title: [Faculty: Sante], author: [John Doe], date: none)[]
} else if comp == "faculty-sciences" {
  template(faculty: "sciences", title: [Faculty: Sciences], author: [John Doe], date: none)[]
} else if comp == "faculty-lettres" {
  template(faculty: "lettres", title: [Faculty: Lettres], author: [John Doe], date: none)[]
} else if comp == "slide" {
  show: template.with(title: [Standard Slide], author: [John Doe])
  slide(title: "Normal Slide Usage", subtitle: "With an optional subtitle")[
    - Support for bullet points
    - Automatic layout management
    - Clean and academic style
  ]
} else if comp == "focus-slide" {
  show: template.with()
  focus-slide([Impactful Messages], subtitle: "A dedicated layout for key quotes")
} else if comp == "figure-slide" {
  show: template.with()
  figure-slide(
    rect(width: 40%, height: 30%, fill: sorbonne-lightblue, stroke: 1pt + sorbonne-blue),
    title: "Data Visualization",
    subtitle: "Including figures and charts",
    caption: [A centered figure with caption]
  )
} else if comp == "equation-slide" {
  show: template.with()
  // On place la biblio à la fin pour éviter le décalage (voir fin de fichier)
  equation-slide(
    $ i hbar pdv(Psi, t) = - hbar^2 / (2m) laplacian(Psi) + V Psi $,
    title: [Scientific Formulas],
    subtitle: [The foundation of modern physics],
    definitions: [
      / $Psi$: Wavefunction
      / $V$: Potential energy
    ],
    citation: (bib-key: "einstein1905", label: "Quantum Origins")
  )
} else if comp == "acknowledgement-slide" {
  show: template.with()
  acknowledgement-slide(
    title: "Acknowledgements",
    subtitle: [Special thanks to our contributors],
    people: ((name: "Prof. Smith", role: "Supervisor"),),
    institutions: ("Sorbonne University", "CNRS"),
  )
} else if comp == "ending-slide" {
  show: template.with()
  ending-slide(
    title: [Thank you for your attention!],
    subtitle: [Any questions?],
    contact: ("contact@example.com", "github.com/user")
  )
} else if comp == "helper-text" {
  show: template.with()
  slide(title: "Text Helpers", subtitle: "Hierarchy of information")[
    - #alert[Alert]: for critical information.
    - #muted[Muted]: for secondary information.
    - #subtle[Subtle]: for tertiary information.
  ]
} else if comp == "layout-2col" {
  show: template.with()
  slide(title: "Layout: Two Columns", subtitle: "Balanced content distribution")[
    #two-col(
      [#lorem(10)],
      [#lorem(10)]
    )
  ]
} else if comp == "layout-3col" {
  show: template.with()
  slide(title: "Layout: Three Columns", subtitle: "Complex side-by-side components")[
    #three-col(
      [Col A],
      [Col B],
      [Col C]
    )
  ]
} else if comp == "boxes" {
  show: template.with()
  slide(title: "Boxes & Blocks", subtitle: "Highlighting key information")[
    #highlight-box(title: "Highlight")[Key points using theme color.]
    #v(0.5em)
    #alert-box(title: "Alert", fill-mode: "fill")[Warnings and critical info.]
    #v(0.5em)
    #algorithm-box(title: "Algorithm")[
      + Initialize data
      + Compute results
    ]
  ]
} else if comp == "citations" {
  show: template.with()
  set bibliography(style: "apa")
  slide(title: "Citations Style", subtitle: "Standard and custom corner references")[
    Inline citations like @smith2023 are highlighted automatically.
    
    You can also use custom labels in corner boxes:
    #cite-box("doe2024", display-label: "Jane Doe (2024)", position: "bottom-right")
  ]
}

// On place la bibliographie à la fin, elle ne sera pas dans les pages extraites (1 ou 2)
// mais elle permettra la résolution des citations dans tout le document.
#context {
  if query(cite).len() > 0 {
    bibliography("refs.bib", title: none)
  }
}
