#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with(faculty: "univ")
}

#show: my-template.with(
  title: [An Example Presentation],
  subtitle: [An academic theme for Typst],
  author: [Community Template],
  affiliation: [Sorbonne Université],
  date: none,
)

// Empty body, only title slide matters for thumbnail
