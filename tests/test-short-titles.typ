#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test des Titres Courts],
  subtitle: [Vérification breadcrumb vs transition],
  author: [David Hajage],
  mapping: (section: 1, subsection: 2),
  use-short-title: true,
  show-outline: false,
)

= Une section avec un titre extrêmement long pour tester le mécanisme de remplacement
#metadata("Titre Court 1") <short>

== Une sous-section également trop longue pour tenir confortablement en bas
#metadata("Court 2") <short>

#slide[
  Sur cette diapositive :
  - La diapositive de transition précédente doit afficher le titre *long*.
  - Le fil d'ariane en bas doit afficher *"Titre Court 1 / Court 2"*.
]

= Autre section sans titre court
#slide[
  Ici, le fil d'ariane doit afficher le titre complet par défaut car aucune métadonnée `<short>` n'est définie.
]
