#import "../lib.typ": *

#show: template.with(
  title: [Test Footnote Scenarios],
  author: [David Hajage],
  faculty: "univ",
)

= Footnote Tests

#slide(title: "Case 1: No Footnote, Long Text")[
  #lorem(60)
  
  #lorem(40)
]

#slide(title: "Case 2: One Footnote, Short Text")[
  Here is a short text with a single footnote#footnote[This is a single footnote.].
  
  The layout should remain clean.
]

#slide(title: "Case 3: Multiple Footnotes, Short Text")[
  Here is a short text with multiple footnotes.
  
  First point#footnote[First footnote.].
  
  Second point#footnote[Second footnote.].
  
  Third point#footnote[Third footnote.].
]

#slide(title: "Case 4: Multiple Footnotes, Long Text")[
  Here is a long text with multiple footnotes to check spacing and overlap.
  
  #lorem(30)
  
  First point#footnote[First footnote in long text.].
  
  #lorem(30)
  
  Second point#footnote[Second footnote in long text.].
  
  #lorem(20)
  
  Third point#footnote[Third footnote in long text.].
]