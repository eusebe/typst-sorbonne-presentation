#import "../lib.typ": *

#show: iplesp-template.with(
  title: [Test Custom Logos Dark],
  author: [Tester],
  dark-mode: true,
  // Customizing only the center logo
  logo-center: circle(radius: 0.8em, fill: red),
  logo-center-transition: circle(radius: 0.8em, fill: white),
)

= Slide 1
#slide[
  The center logo should be a white circle in the header (dark mode).
]
