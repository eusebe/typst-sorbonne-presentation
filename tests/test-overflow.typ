#import "../lib.typ": *

#let theme-choice = sys.inputs.at("theme", default: "sorbonne")

#let my-template = if theme-choice == "iplesp" {
  iplesp-template.with()
} else {
  sorbonne-template.with()
}

#show: my-template.with(
  title: [Test Long Text Overflow],
  author: [David Hajage],
)

= Long Content Test

#slide(title: "Page Overflow Scenario, no slide breaks", allow-slide-breaks: false)[
  Ce test vérifie le comportement du thème lorsqu'un texte est trop long pour tenir sur une seule diapositive, en utilisant l'option `allow-slide-breaks: false`.

  #lorem(100)
  #lorem(100)
  #lorem(100)
  #lorem(100)
  #lorem(100)
]

#slide(title: "Page Overflow Scenario, slide breaks", allow-slide-breaks: true)[
  Ce test vérifie le comportement du thème lorsqu'un texte est trop long pour tenir sur une seule diapositive, en utilisant l'option `allow-slide-breaks: true`.

  #lorem(100)
  #lorem(100)
  #lorem(100)
  #lorem(100)
  #lorem(100)
]

#slide(title: "Page Overflow Scenario, slide breaks", allow-slide-breaks: true)[
  Ce test vérifie le comportement du thème lorsqu'un texte est trop long pour tenir sur une seule diapositive, en utilisant l'option `allow-slide-breaks: true` et un slide-break manuel :
  
  #lorem(20)
  #slide-break()
  #lorem(20)
]
  

  #slide(title: "Interaction: Pause + slide Breaks", allow-slide-breaks: true)[

    Cette diapositive teste le mélange de `#pause` et de `allow-slide-breaks`.

    

    *Premier bloc de texte.*

    #lorem(40)

    

    #show: pause

    

    *Second bloc (après pause).*

    #lorem(150)

    

    #show: pause

    

    *Troisième bloc (après une autre pause).*

    #lorem(100)

  ]

#slide(title: "Two-Col Overflow: No slide Breaks", allow-slide-breaks: false)[
  #two-col(
    [
      *Left Column*
      #lorem(150)
    ],
    [
      *Right Column*
      #lorem(150)
        ]
      )
    ]
    
    #slide(title: "Unbalanced Two-Col Overflow", allow-slide-breaks: true)[
      #two-col(
        [
          *Short Column* 
          This column fits easily on one slide.
        ],
        [
          *Long Column* 
          #lorem(250)
        ]
      )
    ]
    
    

#slide(title: "Two-Col Overflow: With slide Breaks", allow-slide-breaks: true)[
  #two-col(
    [
      *Left Column*
      #lorem(150)
    ],
    [
      *Right Column*
      #lorem(150)
    ]
  )
]

#slide(title: "Long Left Column Overflow", allow-slide-breaks: true)[
  #two-col(
    [
      *Long Column* 
      #lorem(250)
    ],
    [
      *Short Column* 
      This column fits easily on one slide.
    ]
  )
]
