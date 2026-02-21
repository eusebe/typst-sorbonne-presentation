#import "../lib.typ": *
#let theme-choice = sys.inputs.at("theme", default: "sorbonne")
#let my-template = if theme-choice == "iplesp" { iplesp-template.with() } else { sorbonne-template.with(faculty: "sante") }
#show: my-template.with(title: [Alert Santé])
#slide[Texte normal. #alert[Ceci est une alerte en rouge sombre (Santé)].]
