#import "../lib.typ": *
#import "@preview/pergamon:0.7.2": *

// 1. Chargement des ressources bibliographiques
#add-bib-resource(read("refs.bib"))

// 2. Choix du style Auteur-Année
#let pergamon-style = format-citation-authoryear()

// 3. Application du template Sorbonne
#show: template.with(
  title: [Guide des Citations Pergamon],
  subtitle: [Focus sur le style Auteur-Année],
  author: [David Hajage],
  faculty: "lettres",
)

// 4. Initialisation de la section de référence pour tout le document
// Cela permet d'utiliser print-bibliography n'importe où dans le document.
#show: doc => refsection(format-citation: pergamon-style.format-citation, doc)

= Introduction

#slide(title: "Pourquoi Pergamon ?")[
  Pergamon permet une gestion fine des citations directement via du code Typst, offrant plus de flexibilité que le système CSL natif pour certains cas d'usage académiques.
  
  Le style *Auteur-Année* est particulièrement puissant car il propose plusieurs formes de citations selon le contexte grammatical.
]

= Les Commandes de Citation

#slide(title: "Citations Parenthétiques")[
  La commande *`#citep("key")`* produit une citation complète entre parenthèses.
  
  - *Exemple :* #citep("smith2023")
  - *Usage :* En fin de phrase ou pour sourcer une information sans interrompre la lecture.
  - *Citations multiples :* #citep("smith2023", "einstein1905")
]

#slide(title: "Citations Textuelles")[
  La commande *`#citet("key")`* place uniquement l'année entre parenthèses.
  
  - *Exemple :* Comme le souligne #citet("smith2023"), les templates Typst s'améliorent.
  - *Usage :* Lorsque vous intégrez le nom de l'auteur directement dans votre récit.
]

#slide(title: "Extractions Spécifiques")[
  Pergamon permet aussi d'extraire des composants individuels :
  
  - *Nom de l'auteur* (`#citename`) : #citename("doe2024")
  - *Année seule* (`#citeyear`) : #citeyear("doe2024")
  - *Avec options* : #cite("doe2024", form: "p", prefix: "voir", suffix: "chap. 1")
]

= Bibliographie

#slide(title: "Liste des Références")[
  // Impression de la bibliographie avec le style de label correspondant
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
