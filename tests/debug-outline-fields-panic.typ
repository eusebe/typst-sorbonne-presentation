#import "../lib.typ": *

#show: sorbonne-template.with(
  title: [Debug Fields],
  show-outline: true,
)

#show outline.entry: it => {
  panic(it.fields().keys())
}

= Section 1
#slide[Test]
