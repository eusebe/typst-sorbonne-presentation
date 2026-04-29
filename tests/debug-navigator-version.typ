// Test minimal : progressive-outline dans un contexte de state (compteur de slides)

#import "@preview/navigator:0.1.5" as nav

#let slide-counter = counter("slide")

#let slide(body) = {
  slide-counter.step()
  page(body)
}

#show heading.where(level: 1): h => {
  slide({
    context nav.progressive-outline(
      target-location: h.location()
    )
    place(hide(h))
  })
}

#show heading.where(level: 2): h => {
  slide(h.body)
}

= Section 1
== Slide 1
== Slide 2
= Section 2
== Slide 3
== Slide 4
