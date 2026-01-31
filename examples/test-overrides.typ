#import "../lib.typ": *

#show: template.with(
  title: [Test Surcharges Individuelles],
  author: [David Hajage],
  faculty: "sante", // Preset Santé (Rouge)
  primary-color: sorbonne-blue, // Mais fond Bleu
  alert-color: sorbonne-yellow.darken(40%), // Alerte Ocre
  logo-slide: "assets/logo/sorbonne-lettres.png", // Logos Lettres
  logo-transition: "assets/logo/sorbonne-lettres-white.png",
)

= Introduction
#slide[
  Cette slide utilise le logo de la faculté des *Lettres*.
  
  Voici une #alert[alerte en ocre] sur un document globalement paramétré pour la *Santé*.
]

#focus-slide[
  Transition avec fond Bleu et logo Lettres.
]