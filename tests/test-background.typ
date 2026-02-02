#import "../lib.typ": *

#show: template.with(
  title: [Test Background Slide],
  author: [David Hajage],
)

= Background Color
#slide(background: rect(fill: sorbonne-lightblue.lighten(80%), width: 100%, height: 100%))[
  Cette slide a un fond bleu clair uniforme.
  
  Le texte doit rester lisible par-dessus.
]

= Background Image
#slide(
  title: "Image de fond",
  background: block(width: 100%, height: 100%, {
    align(center + horizon, image("../assets/logo/sorbonne-univ.png", width: 60%))
    place(top + left, rect(fill: white.transparentize(80%), width: 100%, height: 100%))
  })
)[
  Cette slide utilise une image de fond simulant de l'opacité via un overlay blanc semi-transparent.
  
  #lorem(40)
  
  Le texte reste parfaitement lisible grâce à l'atténuation de l'image de fond. On peut ainsi illustrer une diapositive sans nuire à la clarté du contenu.
]

#slide(
  title: "Fond plein écran",
  background: block(width: 100%, height: 100%, fill: gray.lighten(90%))
)[
  Vérification que le header et le footer sont bien visibles par-dessus.
]
