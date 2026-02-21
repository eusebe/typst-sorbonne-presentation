#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test de l'option max-length dans le fil d'ariane],
  subtitle: [Vérification du tronquage global et par rôle],
  author: [David Hajage],
  mapping: (part: 1, section: 2, subsection: 3),
  // Test d'un dictionnaire avec les rôles
  max-length: (part: 10, section: 5, subsection: 20),
  show-outline: false,
)

= Une Partie Extrêmement Longue
== Une Section Très Longue
=== Une Sous-section avec beaucoup de texte pour tester le breadcrumb
#slide[
  Vérifiez le fil d'ariane :
  - La partie doit être tronquée à 10 caractères.
  - La section doit être tronquée à 5 caractères.
  - La sous-section doit être tronquée à 20 caractères.
]
