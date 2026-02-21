#import "../lib.typ": *
#let theme-choice = sys.inputs.at("theme", default: "sorbonne")
#let my-template = if theme-choice == "iplesp" { iplesp-template.with() } else { sorbonne-template.with(faculty: "lettres") }
#show: my-template.with(title: [Alert Lettres])
#slide[Texte normal. #alert[Ceci est une alerte en ocre lisible (Lettres)].]
