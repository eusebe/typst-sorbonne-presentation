#import "../lib.typ": *

#show: template.with(
  title: [Test Ending Slide],
  author: [David Hajage],
)

= Introduction
#slide[
  Testing the new ending slide.
]

#ending-slide()

#ending-slide(
  title: [Merci de votre attention],
  subtitle: [Avez-vous des questions ?],
  contact: ("david@example.com", "@david_h")
)
