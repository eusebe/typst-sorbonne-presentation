#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Bibliography Style],
  subtitle: [Switching from APA to IEEE],
  author: [David Hajage],
  // Utilisation du nouveau paramètre
  bib-style: "ieee", 
)

= Citations Numériques (IEEE)

#slide(title: "Usage des références")[
  Dans ce mode, les citations apparaissent comme des numéros :
  
  - Référence standard : @smith2023
  - Référence multiple : @smith2023, @einstein1905
  
  Le style des encadrés de citation (couleur du thème) doit être conservé.
]

#slide(title: "Cite Box avec IEEE")[
  La boîte de coin fonctionne également :
  
  #cite-box("doe2024", position: "bottom-right")
]

= Bibliographie

#slide(title: "Liste des références")[
  #bibliography("refs.bib", title: none)
]
