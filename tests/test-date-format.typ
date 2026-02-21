#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

// Test different date formats
#let custom-date = datetime.today().display("[day] [month repr:long] [year]")
// Or a fixed string
// #let custom-date = "Paris, le 18 février 2026"

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with(
    title: [Test Date Format],
    theme: "blue",
    date: custom-date,
  )
} else {
  sorbonne-template.with(
    title: [Test Date Format],
    faculty: "univ",
    date: custom-date,
  )
}

#show: my-template.with(
  author: [David Hajage],
  affiliation: [Sorbonne University],
)

= Introduction
#slide[
  Check the title slide to see the custom date format:
  
  `datetime.today().display("[day] [month repr:long] [year]")`
]
