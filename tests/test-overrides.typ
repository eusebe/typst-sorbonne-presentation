#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with(
    theme: "blue",
    primary-color: orange,
    alert-color: purple,
  )
} else {
  sorbonne-template.with(
    faculty: "sante", // Preset Santé (Rouge)
    primary-color: blue, // Mais fond Bleu
    alert-color: orange, // Alerte Ocre
    logo-slide: image("../assets/sorbonne/sorbonne-lettres.png"), // Logos Lettres
    logo-transition: image("../assets/sorbonne/sorbonne-lettres-white.png"),
  )
}

#show: my-template.with(
  title: [Test Surcharges Individuelles],
  author: [David Hajage],
)

= Introduction
#slide[
  Cette slide utilise des surcharges de couleurs et de logos.
  
  Voici une #alert[alerte personnalisée].
]

#focus-slide[
  Transition avec fond surchargé.
]
