#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with(
    title: [Test Manual Date],
    date: "Paris, le 18 février 2026",
  )
} else {
  sorbonne-template.with(
    title: [Test Manual Date],
    date: "Paris, le 18 février 2026",
  )
}

#show: my-template.with(
  author: [David Hajage],
)

= Introduction
#slide[
  Sur la page de titre, la date doit être : 
  
  "Paris, le 18 février 2026"
]
