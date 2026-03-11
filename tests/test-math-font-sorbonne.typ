#import "@preview/physica:0.9.7": *
#import "../lib.typ": *

#let m-font = sys.inputs.at("math-font", default: "Fira Math")
#let m-font-label = if m-font == "none" { "Serif (Default Typst)" } else { m-font }

#show: sorbonne-template.with(
  title: [Test Math Font: Sorbonne],
  subtitle: [Current font: #m-font-label],
  math-font: if m-font == "none" { none } else { m-font },
)

= Math Font Verification

#slide(title: "Complex Equation")[
  $ f(x) = 1 / (sigma sqrt(2 pi)) integral_(-infinity)^x exp(- 1/2 ( (t - mu) / sigma )^2) d t $
  
  $ nabla times vb(E) = - pdv(vb(B), t) $
  
  $ sum_(i=1)^n x_i plus.minus sqrt(frac(1, n) sum (x_i - overline(x))^2) $
]

#slide(title: "How to test variants")[
  Compile this file with:
  - Default: `typst compile test-math-font-sorbonne.typ`
  - Serif: `typst compile test-math-font-sorbonne.typ --input math-font=none`
  - Noto: `typst compile test-math-font-sorbonne.typ --input math-font="Noto Sans Math"`
]
