#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Combiné Short + Max],
  subtitle: [Short titles, truncation et mapping 3 niveaux],
  author: [David Hajage],
  // Mapping personnalisé pour tester la flexibilité
  mapping: (part: 1, section: 2, subsection: 3),
  // On active les titres courts
  use-short-title: true,
  // On ajoute du tronquage par dessus pour tester la cascade
  // Le niveau 1 (Part) doit être tronqué à 8 chars
  // Le niveau 2 (Section) à 15 chars
  // Le niveau 3 (Subsection) à 20 chars
  max-length: (part: 8, section: 15, subsection: 20),
  show-outline: false,
)

= Partie Principale avec un titre très long
#metadata("Ma Partie Principale") <short>

== Une section très longue à l'intérieur
#metadata("Section Importante") <short>

=== Sous-section détaillée sans titre court
#slide[
  Vérification attendue dans le fil d'ariane :
  - *Partie* : "Ma Parti..." (Short title tronqué à 8 chars)
  - *Section* : "Section Importa..." (Short title tronqué à 15 chars)
  - *Sous-section* : "Sous-section dét..." (Original title tronqué à 20 chars)
  
  Sur la transition :
  - Titre complet original.
]

= Partie 2
== Section Courte
#slide[
  Ici tout doit s'afficher normalement.
]
