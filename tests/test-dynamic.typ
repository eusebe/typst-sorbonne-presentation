#import "../lib.typ": *

#show: template.with(
  title: [Dynamic Features Test],
  author: [David Hajage],
)

= Standard Pause
#slide(title: "Sequential Reveal")[
  - Point 1
  #show: pause
  - Point 2 (after pause)
  #show: pause
  - Point 3 (after another pause)
]

= Columns and Pause
#slide(title: "Pause inside Two-Col")[
  Testing if columns can appear one after another:
  
  #v(1em)
  
  #two-col(
    [
      *Step 1: First Column* \ 
      This is always visible.
    ],
    [
      #show: pause
      *Step 2: Second Column* \ 
      This should only appear after a click.
    ]
  )
]

#slide(title: "Precise Control with Only/Uncover")[
  #three-col(
    [Always here],
    [#uncover(2)[Only from subslide 2]],
    [#only(3)[Only on subslide 3]],
  )
  
  #v(2em)
  #show: pause
  Current subslide index is now 2.
  #show: pause
  Current subslide index is now 3.
]

#slide(title: "Step-item List")[
  #step-item[
    - One
    - Two
    - Three
  ]
]
