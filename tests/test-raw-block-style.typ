#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with(title: [Test raw-block-style: false])
} else {
  sorbonne-template.with(title: [Test raw-block-style: false], faculty: "sante")
}

#show: my-template.with(raw-block-style: false)

= Code sans style Sorbonne

#slide(title: "raw-block-style: false")[
  Avec `raw-block-style: false`, les blocs de code n'ont pas le rectangle du thème
  Sorbonne. Utile avec Calepin ou d'autres outils qui gèrent eux-mêmes le style.

  ```python
  def hello():
      print("Pas de double rectangle ici")
  ```

  Du code en ligne : `x = 42` reste inchangé.
]

#slide(title: "Vérification de la mise en page")[
  - Les listes fonctionnent normalement.
  - Le style général du thème est préservé.

  ```r
  plot(mpg ~ hp, data = mtcars)
  ```
]
