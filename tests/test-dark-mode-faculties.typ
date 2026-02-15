#import "../lib.typ": *

#let faculties = ("sante", "sciences", "lettres", "univ")

#for f in faculties [
  #show: template.with(
    title: [Mode Sombre : ] + f,
    faculty: f,
    dark-mode: true,
  )

  = Test Faculté #f
  #slide[
    Vérification de la couleur primaire et du logo pour la faculté *#f*.
    
    #highlight-box(title: "Box test")[Contenu de test.]
    
    - Liste à puces
    - Item 2
  ]
  
  #focus-slide[Focus #f]
]
