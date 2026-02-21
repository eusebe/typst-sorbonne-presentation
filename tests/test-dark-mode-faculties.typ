#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")
#let variants = if theme-choice == "iplesp" { 
  ("blue", "red", "yellow", "green", "teal", "purple", "orange", "slate") 
} else { 
  ("sante", "sciences", "lettres", "univ") 
}

#for v in variants {
  for is-dark in (false, true) [
    #let my-template = if theme-choice == "iplesp" {
      iplesp-template.with(theme: v)
    } else {
      sorbonne-template.with(faculty: v)
    }

    #show: my-template.with(
      title: [Mode ] + (if is-dark { [Sombre] } else { [Clair] }) + [ : ] + v,
      dark-mode: is-dark,
    )

    = Test #v (#if is-dark { [Sombre] } else { [Clair] })
    #slide[
      Vérification de la couleur primaire et du logo pour *#v*.
      
      #highlight-box(title: "Box test")[Contenu de test.]
      
      - Liste à puces
      - Item 2
    ]
    
    #focus-slide[Focus #v]
  ]
}
