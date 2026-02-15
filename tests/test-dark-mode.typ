#import "../lib.typ": *

#show: template.with(
  title: [Test du Mode Sombre],
  subtitle: [Diapositives académiques en salle obscure],
  author: [David Hajage],
  faculty: "sciences",
  dark-mode: true,
  show-outline: true,
)

= Introduction

#slide(title: "Pourquoi un mode sombre ?")[
  - Meilleur confort visuel dans les salles obscures.
  - Esthétique moderne et élégante.
  - Préservation du contraste pour le texte scientifique.
]

= Composants en Mode Sombre

#slide(title: "Styles de texte et alertes")[
  Voici du texte standard sur fond sombre.
  
  - #alert[Information critique en bleu (Sciences)]
  - #muted[Information secondaire (Gris clair)]
  - #subtle[Information tertiaire (Gris moyen)]
]

#slide(title: "Boîtes et Blocs")[
  #highlight-box(title: "Key Point")[Les boîtes s'adaptent automatiquement.]
  #v(0.5em)
  #alert-box(title: "Warning", fill-mode: "fill")[Le remplissage est assombri pour ne pas éblouir.]
  #v(0.5em)
  #themed-block(title: "Bloc Sciences")[Identité visuelle conservée.]
]

#focus-slide[
  Les diapositives de focus conservent leur couleur de faculté.
]

#slide(title: "Citations")[
  Les citations sont également adaptées : @smith2023.
  
  #cite-box("smith2023", position: "bottom-right")
]

#slide[
  #bibliography("refs.bib", title: none)
]

= Conclusion

#ending-slide()
