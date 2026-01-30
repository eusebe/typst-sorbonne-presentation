#import "../lib.typ": *

#show: template.with(
  title: [Typesetting moderne à l'Université], // Titre principal de la présentation
  subtitle: [Template Sorbonne Université pour Typst], // Sous-titre (optionnel)
  author: [David Hajage], // Nom de l'auteur
  affiliation: [Sorbonne Université, Faculté de Santé], // Affiliation ou laboratoire
  // date: [30 janvier 2026], // Date de la présentation (par défaut : date du jour)
  // aspect-ratio: "16-9", // Format des diapositives ("16-9" ou "4-3")
  // show-header-numbering: true, // Afficher ou non la numérotation des titres (global)
  // numbering-format: "1.", // Style de numérotation (ex: "1.", "1.1", "I.a")
  // text-font: "Fira Sans", // Police de caractères de base
  // text-size: 20pt, // Taille de police de base
)

= Introduction

== Pourquoi Typst ?

#slide[
  - Performance (compilation instantanée)
  - Syntaxe intuitive et moderne
  - Programmabilité via des fonctions
  
  #show: pause
  
  *Le thème Sorbonne :*
  - Intègre `presentate` pour les animations.
  - Utilise `navigator` pour la structure.
]

= Fonctionnement Technique

== Transitions Automatiques

#slide[
  Le thème détecte automatiquement les titres de niveau 1 (`=`) et de niveau 2 (`==`).
  
  #show: pause
  
  Il génère alors une diapositive de transition avec :
  - Le numéro de section en gros
  - Le titre de la section
  - Le sommaire de la section (liste des sous-sections)
]

== Fil d'Ariane

#slide(title: "Personnalisation du Titre")[
  Regardez en bas de la diapositive : le fil d'Ariane s'adapte à votre position.
  
  #show: pause
  
  Vous pouvez aussi forcer un titre manuel pour la slide, comme je l'ai fait ici.
]

= Conclusion

#slide[
  Merci pour votre patience ! Le template est prêt à être utilisé.
]

#slide(title: "Debug Compteurs")[
  Numéro de section actuel (via counter) : #context counter(heading).display() \
  Localisation de la slide : #context here().position()
]
