#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Citations],
  author: [David Hajage],
)

= État de l'art

#slide[
  Les travaux récents ont montré des améliorations significatives dans le rendu des documents @smith2023.
  
  Cependant, une approche purement artistique reste pertinente pour capter l'auditoire @doe2024.
  
  #v(2em)
  _Note : La couleur de l'encadré suit la couleur principale du thème._

  Autre essai utilisant `#cite(..., form: "prose")` : #cite(<smith2023>, form: "prose")
]

= Test Cite Box

#slide[
  Cette slide montre l'utilisation de `cite-box` en bas à droite (par défaut).
  
  #lorem(20)
  
  #cite-box("smith2023")
]

#slide[
  Cette slide montre `cite-box` en haut à droite avec un label personnalisé.
  
  #lorem(20)
  
  #cite-box(("smith2023", "doe2024"), display-label: "Smith 2023; Doe 2024", position: "top-right")
]

#slide[
  Cette slide montre `cite-box` en bas à gauche.
  
  #cite-box("doe2024", position: "bottom-left")
]

#slide(title: "Cite Box avec paramètre 'form'")[
  On peut désormais utiliser le paramètre `form` (ex: `"prose"`) :
  
  #cite-box("smith2023", form: "prose", position: "bottom-right")
]

= Bibliographie

#slide[
  #bibliography("refs.bib", title: none)
]
