#import "@preview/physica:0.9.7": *
#import "../lib.typ": *

#let m-font = sys.inputs.at("math-font", default: "Noto Sans Math")
#let m-font-label = if m-font == "none" { "Serif (Default Typst)" } else { m-font }

#show: iplesp-template.with(
  title: [Test Math Font: IPLESP],
  subtitle: [Current font: #m-font-label],
  math-font: if m-font == "none" { none } else { m-font },
)

= Math Font Verification

#slide(title: "Complex Equation")[
  $ cal(L) = bar(psi) (i gamma^mu D_mu - m) psi - 1/4 F_(mu v) F^(mu v) $
  
  $ cases(
    dot(x) = sigma (y - x),
    dot(y) = x (rho - z) - y,
    dot(z) = x y - beta z
  ) $
]

#slide(title: "Comparison")[
  The default font for IPLESP is now *Noto Sans Math* to match the *Lato* text font.
]
