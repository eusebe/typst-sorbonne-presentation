#import "../lib.typ": *

#show: template.with(
  title: [Test Code Mode Sombre (Sorbonne)],
  faculty: "univ",
  dark-mode: true,
)

= Code Block Test
#slide[
  Voici un exemple de bloc de code en mode sombre :

  ```python
  def hello_sorbonne():
      print("Hello from Sorbonne in dark mode!")
      return True
  ```

  Et du code en ligne : `print("inline code")`.
]
