#import "../lib.typ": *

#show: template.with(
  title: [Test Focus Slide],
  author: [David Hajage],
  faculty: "univ",
)

= Introduction
#slide[Une slide normale avant le focus.]

#focus-slide[
  "Le savoir est la seule matière qui s'accroît quand on la partage."
]

#slide[Une slide normale après le focus.]
