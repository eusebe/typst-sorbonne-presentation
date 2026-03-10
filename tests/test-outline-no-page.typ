#import "../lib.typ": *

// Règle pour supprimer les numéros de page de l'outline
#show outline.entry: it => {
  it.element.body
}

#show: sorbonne-template.with(
  title: [Test Sommaire sans numéros],
  author: [Tester],
  show-outline: true,
)

= Section 1
== Sous-section 1.1
#slide[Contenu]

= Section 2
== Sous-section 2.1
#slide[Contenu]
