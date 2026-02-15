#import "../lib.typ": *

#show: template.with(
  title: [Test Code Mode Sombre],
  faculty: "univ",
  dark-mode: true,
)

= Test Blocs de Code

#slide(title: "Code et Syntaxe")[
  Voici un exemple de code en ligne : `print("hello")`.
  
  Et voici un bloc de code :
  
  ```python
  def workflow():
      data = collect()
      results = analyze(data)
      return results
  ```
  
  Le fond doit être sombre (`luma(40)`) et le texte clair.
]
