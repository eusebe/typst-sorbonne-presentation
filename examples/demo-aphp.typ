#import "../lib.typ": *

#show: aphp-template.with(
  title: [Thème APHP],
  title-line2: [Démonstration complète],
  subtitle: [Présentation des fonctionnalités],
  author: [David Hajage],
  short-author: [D. Hajage],
  affiliation: [AP-HP · Sorbonne Université],
  date: [1er février 2026],
  aspect-ratio: sys.inputs.at("ratio", default: "16-9"),
  mapping: (section: 1, subsection: 2),
)

// ── SECTION 1 ─────────────────────────────────────────────────────────────────

= Introduction

== Objectifs de la session

#slide(title: "Correction des défauts visuels")[
  Cette présentation sert de base pour identifier et corriger les
  défauts visuels du thème AP-HP.

  - Vérification du positionnement des logos
  - Vérification du numéro de slide
  - Vérification de la sidebar et des lignes décoratives
  - Validation des couleurs institutionnelles
]

== Boîtes de mise en évidence

#slide(title: "Boîtes contextuelles")[
  #alert-box(title: "Point critique")[
    Les logos doivent apparaître en bas-gauche et bas-droit sur toutes les slides.
  ]

  #v(1em)

  #highlight-box(title: "Point clé")[
    Le numéro de slide doit être visible dans le rectangle bleu en bas de la sidebar.
  ]
]

== Contenu structuré

#slide(title: "Listes et paragraphes")[
  Exemples de contenu structuré dans le thème APHP :

  + Premier point numéroté
  + Deuxième point numéroté
  + Troisième point numéroté

  #v(0.8em)

  Paragraphe de texte courant avec la police institutionnelle.
  Le texte utilise la couleur APHP navy (bleu institutionnel).
]

// ── SECTION 2 ─────────────────────────────────────────────────────────────────

= Sidebar et Logos

== Vérification de la sidebar

#slide(title: "Éléments de la sidebar")[
  La sidebar gauche contient les éléments suivants :

  - *Cœur AP-HP* — icône en haut de la ligne verticale
  - *Double rail* — lignes bleue et blanche (slides de contenu)
  - *Label de section* — texte vertical en blanc sur fond marine
  - *Titre de slide* — zone headline en haut
  - *Numéro de slide* — rectangle bleu en bas de la sidebar
  - *Logos* — AP-HP Sorbonne (bas-gauche) et AP-HP (bas-droit)
]

== Mise en page sur deux colonnes

#slide(title: "Layout deux colonnes")[
  #two-col(
    [
      *Colonne gauche*

      Contenu de la première colonne avec du texte explicatif.

      #highlight-box[Élément mis en avant dans la colonne gauche]
    ],
    [
      *Colonne droite*

      Contenu de la deuxième colonne.

      #alert-box(title: "Attention")[Vérifier l'alignement avec la sidebar]
    ]
  )
]

== Slide focus

#focus-slide[Slide de focus AP-HP]

// ── ANNEXES ───────────────────────────────────────────────────────────────────

#appendix()

= Analyses complémentaires

#slide(title: "Analyse de sensibilité")[
  Les analyses complémentaires confirment les observations principales.

  #highlight-box(title: "Résultat robuste")[
    Les défauts identifiés sont reproductibles sur tous les types de slides.
  ]
]

// ── SLIDE DE FIN ──────────────────────────────────────────────────────────────

#aphp-ending-slide(
  title: [Merci de votre attention !],
  subtitle: [Questions ?],
  contact: ("david.hajage@aphp.fr", "www.aphp.fr"),
)
