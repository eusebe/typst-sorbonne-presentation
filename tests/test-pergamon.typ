#import "../lib.typ": *
#import "@preview/pergamon:0.7.2": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

// 1. Chargement des ressources bibliographiques
#add-bib-resource(read("refs.bib"))

// 2. Choix du style Auteur-Année
#let pergamon-style = format-citation-authoryear()

// 3. Application du template
#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with(faculty: "lettres")
}

#show: my-template.with(
  title: [Guide des Citations Pergamon],
  subtitle: [Focus sur le style Auteur-Année],
  author: [David Hajage],
)

// 4. Initialisation de la section de référence pour tout le document
#show: doc => refsection(format-citation: pergamon-style.format-citation, doc)

= Introduction

#slide(title: "Pourquoi Pergamon ?")[
  Pergamon permet une gestion fine des citations directement via du code Typst.
  
  Le style *Auteur-Année* est particulièrement puissant car il propose plusieurs formes de citations selon le contexte grammatical.
]

= Les Commandes de Citation

#slide(title: "Citations Parenthétiques")[
  La commande *`#citep("key")`* produit une citation complète entre parenthèses.
  
  - *Exemple :* #citep("smith2023")
  - *Citations multiples :* #citep("smith2023", "einstein1905")
]

#slide(title: "Citations Textuelles")[
  La commande *`#citet("key")`* place uniquement l'année entre parenthèses.
  
  - *Exemple :* Comme le souligne #citet("smith2023"), les templates Typst s'améliorent.
]

= Bibliographie

#slide(title: "Liste des Références")[
  #print-bibliography(
    format-reference: format-reference(
      reference-label: pergamon-style.reference-label,
      print-date-after-authors: true, 
    ),
    label-generator: pergamon-style.label-generator,
    sorting: "nyt",
    title: none,
  )
]

#ending-slide()
