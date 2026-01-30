#import "@preview/polylux:0.3.1": *

#let sorbonne-blue = rgb("#1D2769")
#let sorbonne-red = rgb("#AC182E")
#let sorbonne-lightblue = rgb("#52B5E5")
#let sorbonne-yellow = rgb("#FFB700")
#let sorbonne-text = rgb("#263068")
#let primary-color = state("faculty-color", none)

#let logo-white = state("logo-white", none)
#let logo-color = state("logo-color", none)

#let footer-title = state("footer-title", none)
#let footer-author = state("footer-author", none)

#let num-section = state("num-section", 0)

// Subsections
#let subsections-state = state("polylux-subsections", ())
#let register-subsection(name) = locate( loc => {
  subsections-state.update(subsections => {
    subsections.push((body: name, loc: loc))
    subsections
  })
})

#let current-subsection = locate( loc => {
  let subsections = subsections-state.at(loc)
  if subsections.len() > 0 {
    subsections.last().body
  } else {
    []
  }
})

// todo : faire en sorte que toutes les sous-sections apparaissent, avec celle en cours en surbrillance (probablement avec at(label), en mettant un label à la fin de la section en cours)
#let polylux-subsections-outline(
  enum-args: (:), padding: (3em)
  ) = locate( loc => {
  let color = primary-color.get()

  let cur-item = counter("cur-item")
  show enum: it => {
    cur-item.update(0)
    let n-children = it.children.len()
    let block = block
    if it.tight {
      block = block.with(spacing: 0.65em)
    }
  
    for (idx, child) in it.children.enumerate() {
      cur-item.step()
      block(pad(left: it.indent)[
        #stack(dir: ltr, spacing: it.body-indent)[
          #let txt-color = if idx == n-children - 1 { white } else { color.mix((color, 60%), (white, 40%)) }
          #set text(txt-color) 
          #cur-item.display(it.numbering)
        ][
          #let txt-color = if idx == n-children - 1 { white } else { color.mix((color, 60%), (white, 40%)) }
          #set text(txt-color) 
          #child.body
        ]
      ])
    }
  }

  let subsections = subsections-state.at(loc)
  set align(left)
  pad(left: 7em, right: padding, enum(
    ..enum-args,
    ..subsections.map(sub => link(sub.loc, sub.body))
  ))
}
)

// content to string
#let to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(to-string).join("")
  } else if content.has("body") {
    to-string(content.body)
  } else if content == [ ] {
    " "
  }
}

#let sorbonnesante-theme(
  aspect-ratio: "16-9", 
  fontsize: 2.5em,
  faculty: none,
  body) = {

  
  let faculty-color = if faculty == "sante" {
    sorbonne-red
  } else if faculty == "sciences" {
    sorbonne-lightblue
  } else if faculty == "lettres" {
    sorbonne-yellow
  } else {
    sorbonne-blue
  }

  set page(
    paper: "presentation-" + aspect-ratio,
    fill: faculty-color,
    margin: 50pt
  )

  set text(font: "Fira Sans", size: fontsize, fill: sorbonne-text)
  show math.equation: set text(font: "Fira Math")

  if faculty == "sante" {
    logo-white.update(image("logo/sorbonne-sante-white.png", width: 5em))
    logo-color.update(image("logo/sorbonne-sante.png", width: 5em))
  } else if faculty == "sciences" {
    logo-white.update(image("logo/sorbonne-sciences-white.png", width: 5em))
    logo-color.update(image("logo/sorbonne-sciences.png", width: 5em))
  } else if faculty == "lettres" {
    logo-white.update(image("logo/sorbonne-lettres-white.png", width: 5em))
    logo-color.update(image("logo/sorbonne-lettres.png", width: 5em))
  } else {
    logo-white.update(image("logo/sorbonne-univ-white.png", width: 5em))
    logo-color.update(image("logo/sorbonne-univ.png", width: 5em))
  }
  
  if faculty == "sante" {
    primary-color.update(sorbonne-red)
  } else if faculty == "sciences" {
    primary-color.update(sorbonne-lightblue)
  } else if faculty == "lettres" {
    primary-color.update(sorbonne-yellow)
  } else {
    primary-color.update(sorbonne-blue)
  }
  
  body
}

#let title-slide(
  title: [], 
  subtitle: [],
  short-title: [],
  author: [], 
  date: [], 
  location: []
  ) = {
    if short-title != [] {
      footer-title.update(short-title)
    } else {
      footer-title.update(title)
    }
    if author != [] {
      footer-author.update(author)
    } else {
      footer-author.update([])
    }

    let logo = context logo-white.get()
    let color = context primary-color.get()

    set text(
      fill: white, 
      size: 1em, 
    )
  
    //pad(x: 2em,
      grid(
        columns: auto, 
        rows: (0.60fr, 0.40fr), 
        row-gutter: 1em,
        align(horizon)[
          #strong(smallcaps(title))
          #parbreak()
          #strong(emph(text(size: .8em,  subtitle)))
        ],
        align(top)[
          #text(size: .8em, author)
          #parbreak()
          #text(size: .8em, location)
          #parbreak()
          #text(size: .8em, date)
        ] 
      )
    //)
    
    place(
      bottom+right, 
      // image("logo/sorbonne-sante-white.png", width: 5em)
      logo
    )
  }

#let slide(title: none, subtitle: none, body) = {
//  set page(
//    margin: (left: 0em, right: 0.5em)
//  )

  let header = {
    let logo = context logo-color.get()
    grid(
      columns: (5em, 1fr),
      logo,
      {
        show par: set block(spacing: 0em)
        if title != none {
          set align(horizon)
          set text(size: 1em)
          strong(smallcaps(title))
        } else { [] }
        if subtitle != none {
          set text(size: 0.8em)
          strong(emph(subtitle))
        } else { [] }
      }
    )
  }
  // TODO : short-titre de la présentation, titre de la section +- titre de la sous-section, page
  let footer = {
    let short-t = context footer-title.get()
    let short-a = context footer-author.get()
    show: text.with(.4em)
    show: pad.with(.5em)
    
    set align(bottom)
    block(fill: white, height:1.2em, stroke: 0pt, inset: 0.2em,
    grid(
      columns: (0.50fr, 0.50fr),
      align: (left, right),
      short-t + [#h(2em)] + utils.current-section, //grid.vline(),
      current-subsection + [#h(2em)] + logic.logical-slide.display() + [/] + utils.last-slide-number
    ))
  }

  set page(
    fill: white,
    header: header,
    footer: footer,
    margin: (top: 3.5em, bottom: 1em, left: 0em, right: 0.5em),
  )

  let content = {
    show: align.with(horizon)
    show: pad.with(1em)
    show: text.with(0.8em)
    body 
  }

  logic.polylux-slide(content)
}

#let new-section-slide(name) = {
  // let lab = label(to-string("section" + name))

  set page(margin: 2em)
  let content = locate( loc => {
    let logo = logo-white.get()
    place(
      top+left, 
      logo
    )
    utils.register-section(name)
    num-section.update(num-section.get() + 1)
    subsections-state.update(())

    set align(center + horizon)
    {
      show par: set block(spacing: 0em)
      set text(size: 6em, fill: white)
      strong(num-section.display())
      parbreak()
    }
    set text(size: 1em, fill: white)
    strong(smallcaps(name))
  })
  logic.polylux-slide(content)
}

#let new-subsection-slide(name) = {
  set page(margin: 2em)
  let content = locate( loc => {
    let logo = logo-white.get()
    place(
      top+left, 
      logo
    )
    register-subsection(name)

    set align(center + horizon)
    {
      show par: set block(spacing: 0em)
      set text(size: 6em, fill: white)
      strong(num-section.display())
      parbreak()
    }
    {
    set text(size: 1em, fill: white)
    strong(smallcaps(utils.current-section))
    }
    parbreak()
    {
    set text(size: 0.8em, fill: white)
    strong(emph(polylux-subsections-outline()))
    }
  })
  logic.polylux-slide(content)
}

#let focus-slide(background: none, foreground: white, body) = {
  if (background != none) {
    set page(fill: background, margin: 2em)
  }
  {
    set text(fill: foreground, size: 1.2em)
    let content = { v(.1fr); body; v(.1fr) }
    // logic.polylux-slide(align(horizon, body))
    logic.polylux-slide(content)
  }
  let logo = context logo-white.get()
  place(
    top+left, 
    logo
  )
}

#let alert = text.with(fill: sorbonne-red)

#let sorbonne-outline = utils.polylux-outline(enum-args: (tight: false,))