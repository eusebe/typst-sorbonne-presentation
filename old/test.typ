#import "sorbonne-slides.typ": *

#show: sorbonnesante-theme.with(
  aspect-ratio: "4-3", 
  faculty: "sante",
)

#title-slide(
  title: [A title],
  subtitle: [A subtitle],
  short-title: [A short title],
  date: [February 20, 1967],
  author: [Kurt Cobain],
  location: [Aberdeen], 
)

#slide(title: "Outline")[
  #sorbonne-outline
]

#slide(title: "Slide title", subtitle: "A subtitle")[
  A slide with some maths:
  $ x_(n+1) = (x_n + a/x_n) / 2 $

  #lorem(200)
]

#new-section-slide("First section")

#slide[
  A slide without a title but with #alert[important] infos
]

#new-section-slide([Second section])

#slide(title: "Slide title")[
  - #lorem(20)
  - #lorem(10)
]

#focus-slide[
 #set align(center)
  A focus slide
  
  Wake up!
]

#new-subsection-slide([A subsection])

#slide(title: "Slide title")[
  - #lorem(20)
  - #lorem(10)
]

#new-subsection-slide([Another subsection])

#slide(title: "Slide title")[

$ A = pi r^2 $
$ "area" = pi dot "radius"^2 $
$ cal(A) :=
    { x in RR | x "is natural" } $
#let x = 5
$ #x < 17 $
$ #x != 17 $
]
