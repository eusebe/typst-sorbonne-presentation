#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Acknowledgement],
  author: [David Hajage],
)

= Introduction
#slide[
  Ceci est une présentation de test pour la nouvelle slide de remerciements.
]

= Remerciements

#acknowledgement-slide(
  subtitle: [Nous tenons à remercier les personnes suivantes :],
  people: (
    (name: "Prof. Smith", role: "Superviseur"),
    (name: "Dr. Jones", role: "Conseiller"),
    (name: "Mme. Martin", role: "Experte Technique"),
  ),
  institutions: ("Sorbonne Université", "CNRS", "INSERM"),
  extra: [Merci spécial à tous les contributeurs open-source.],
)

#acknowledgement-slide(
  title: "Thanks",
  subtitle: [Special thanks to:],
  people: (
    (name: "Batman", role: "Security"),
    (name: "Robin", role: "Support"),
  ),
  institutions: ("Wayne Enterprises",),
)
