#import "../lib.typ": *
#import "@preview/presentate:0.2.4": pdfpc

#show: sorbonne-template.with(
  title: [Test Speaker Notes (pdfpc)],
  author: [David Hajage],
)

// Configuration globale pour la console de présentation
#pdfpc.config(
  duration-minutes: 20,
  note-font-size: 14,
)

= Introduction

#slide(title: "Slide avec notes d'orateur")[
  Contenu visible par l'auditoire.
  
  - Point A
  - Point B
  
  // Note invisible dans le PDF, visible dans la console
  #pdfpc.speaker-note("Rappeler de mentionner l'importance du point A.")
]

#slide(title: "Slide avec note brute")[
  Autre contenu.
  
  #pdfpc.speaker-note(```
  - Premier point à dire
  - Deuxième point
  ```)
]

#ending-slide()
#pdfpc.end-slide
