#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with(title: [Test Code Dark Mode])
} else {
  sorbonne-template.with(title: [Test Code Dark Mode], faculty: "sante")
}

#show: my-template.with(dark-mode: true)

= Code Block Test
#slide[
  Voici un exemple de bloc de code en mode sombre :

  ```python
  def hello_world():
      print("Hello from dark mode!")
      return True
  ```

  Et du code en ligne : `print("inline code")`.
]
