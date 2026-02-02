#import "../lib.typ": *

#show: template.with(
  title: [Test Long Text Overflow],
  author: [David Hajage],
  faculty: "univ",
)

= Long Content Test

#slide(title: "Page Overflow Scenario, no frame breaks", allow-frame-breaks: false)[
  Ce test vérifie le comportement du thème lorsqu'un texte est trop long pour tenir sur une seule diapositive, en utilisant l'option `allow-frame-breaks: false`.

  #lorem(100)
  #lorem(100)
  #lorem(100)
  #lorem(100)
  #lorem(100)
]#slide(title: "Page Overflow Scenario, frame breaks", allow-frame-breaks: true)[
  Ce test vérifie le comportement du thème lorsqu'un texte est trop long pour tenir sur une seule diapositive, en utilisant l'option `allow-frame-breaks: true`.

  #lorem(100)
  #lorem(100)
  #lorem(100)
  #lorem(100)
  #lorem(100)
]

  

  #slide(title: "Interaction: Pause + Frame Breaks", allow-frame-breaks: true)[

    Cette diapositive teste le mélange de `#pause` et de `allow-frame-breaks`.

    

    *Premier bloc de texte.*

    #lorem(40)

    

    #show: pause

    

    *Second bloc (après pause).*

    #lorem(150)

    

    #show: pause

    

    *Troisième bloc (après une autre pause).*

    #lorem(100)

  ]

#slide(title: "Two-Col Overflow: No Frame Breaks", allow-frame-breaks: false)[
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
    
    #slide(title: "Unbalanced Two-Col Overflow", allow-frame-breaks: true)[
      #two-col(
        [
          *Short Column* \
          This column fits easily on one slide.
        ],
        [
          *Long Column* \
          #lorem(250)
        ]
      )
    ]
    
    

#slide(title: "Two-Col Overflow: With Frame Breaks", allow-frame-breaks: true)[
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

#slide(title: "Long Left Column Overflow", allow-frame-breaks: true)[
  #two-col(
    [
      *Long Column* \
      #lorem(250)
    ],
    [
      *Short Column* \
      This column fits easily on one slide.
    ]
  )
]

  