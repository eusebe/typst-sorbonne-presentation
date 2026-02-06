// Some definitions presupposed by pandoc's typst output.
#let blockquote(body) = [
  #set text( size: 0.92em )
  #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]

#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

// Some quarto-specific definitions.

#show raw.where(block: true): set block(
    fill: luma(230),
    width: 100%,
    inset: 8pt,
    radius: 2pt
  )

#let block_with_new_content(old_block, new_content) = {
  let d = (:)
  let fields = old_block.fields()
  fields.remove("body")
  if fields.at("below", default: none) != none {
    // TODO: this is a hack because below is a "synthesized element"
    // according to the experts in the typst discord...
    fields.below = fields.below.abs
  }
  return block.with(..fields)(new_content)
}

#let empty(v) = {
  if type(v) == str {
    // two dollar signs here because we're technically inside
    // a Pandoc template :grimace:
    v.matches(regex("^\\s*$")).at(0, default: none) != none
  } else if type(v) == content {
    if v.at("text", default: none) != none {
      return empty(v.text)
    }
    for child in v.at("children", default: ()) {
      if not empty(child) {
        return false
      }
    }
    return true
  }

}

// Subfloats
// This is a technique that we adapted from https://github.com/tingerrr/subpar/
#let quartosubfloatcounter = counter("quartosubfloatcounter")

#let quarto_super(
  kind: str,
  caption: none,
  label: none,
  supplement: str,
  position: none,
  subrefnumbering: "1a",
  subcapnumbering: "(a)",
  body,
) = {
  context {
    let figcounter = counter(figure.where(kind: kind))
    let n-super = figcounter.get().first() + 1
    set figure.caption(position: position)
    [#figure(
      kind: kind,
      supplement: supplement,
      caption: caption,
      {
        show figure.where(kind: kind): set figure(numbering: _ => numbering(subrefnumbering, n-super, quartosubfloatcounter.get().first() + 1))
        show figure.where(kind: kind): set figure.caption(position: position)

        show figure: it => {
          let num = numbering(subcapnumbering, n-super, quartosubfloatcounter.get().first() + 1)
          show figure.caption: it => {
            num.slice(2) // I don't understand why the numbering contains output that it really shouldn't, but this fixes it shrug?
            [ ]
            it.body
          }

          quartosubfloatcounter.step()
          it
          counter(figure.where(kind: it.kind)).update(n => n - 1)
        }

        quartosubfloatcounter.update(0)
        body
      }
    )#label]
  }
}

// callout rendering
// this is a figure show rule because callouts are crossreferenceable
#show figure: it => {
  if type(it.kind) != str {
    return it
  }
  let kind_match = it.kind.matches(regex("^quarto-callout-(.*)")).at(0, default: none)
  if kind_match == none {
    return it
  }
  let kind = kind_match.captures.at(0, default: "other")
  kind = upper(kind.first()) + kind.slice(1)
  // now we pull apart the callout and reassemble it with the crossref name and counter

  // when we cleanup pandoc's emitted code to avoid spaces this will have to change
  let old_callout = it.body.children.at(1).body.children.at(1)
  let old_title_block = old_callout.body.children.at(0)
  let old_title = old_title_block.body.body.children.at(2)

  // TODO use custom separator if available
  let new_title = if empty(old_title) {
    [#kind #it.counter.display()]
  } else {
    [#kind #it.counter.display(): #old_title]
  }

  let new_title_block = block_with_new_content(
    old_title_block, 
    block_with_new_content(
      old_title_block.body, 
      old_title_block.body.body.children.at(0) +
      old_title_block.body.body.children.at(1) +
      new_title))

  block_with_new_content(old_callout,
    block(below: 0pt, new_title_block) +
    old_callout.body.children.at(1))
}

// 2023-10-09: #fa-icon("fa-info") is not working, so we'll eval "#fa-info()" instead
#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black, body_background_color: white) = {
  block(
    breakable: false, 
    fill: background_color, 
    stroke: (paint: icon_color, thickness: 0.5pt, cap: "round"), 
    width: 100%, 
    radius: 2pt,
    block(
      inset: 1pt,
      width: 100%, 
      below: 0pt, 
      block(
        fill: background_color, 
        width: 100%, 
        inset: 8pt)[#text(icon_color, weight: 900)[#icon] #title]) +
      if(body != []){
        block(
          inset: 1pt, 
          width: 100%, 
          block(fill: body_background_color, width: 100%, inset: 8pt, body))
      }
    )
}

#import "../lib.typ": *
#import "@preview/fontawesome:0.5.0": *

#set page(
  paper: "us-letter",
  margin: (x: 1.25in, y: 1.25in),
  numbering: "1",
)

#let slide-level = 3
#let mapping = {
  if slide-level == 1 { (:) } 
  else if slide-level == 2 { (section: 1) } 
  else if slide-level == 3 { (section: 1, subsection: 2) } 
  else { (part: 1, section: 2, subsection: 3) }
}

#show: template.with(
  title: [Une (rapide) introduction aux données manquantes],
  
  
  
   author: [David Hajage #link("mailto:david.hajage@aphp.fr")[david.hajage\@aphp.fr];], 
   affiliation: [Sorbonne Université], 
  
  mapping: mapping,
  
  
  
  
   faculty: "sante", 
  
  
  
  
  
  
  
  
  
  
  
   show-outline: true, 
  
  
  
  
   progress-bar: "bottom", 
  footer-author: false,
  footer-title: false,
)

= Pourquoi existe-t-il des données manquantes ?
<pourquoi-existe-t-il-des-données-manquantes>
#slide(title: [Non réponse globale (non réponse au niveau de l'individu)])[
Dans une étude/enquête, certains individus peuvent être injoignables ou refuser de participer.

]
#slide(title: [Non réponse à certains items])[
Certains individus peuvent ne pas connaître la réponse à des questions spécifiques ou refuser d'y répondre.

]
#slide(title: [Erreurs de collecte ou de traitement des données])[
Un enquêteur peut, par exemple, oublier de poser une question à un individus, ou de collecter ceraines données.

]
#slide(title: [Données manquantes prévues par le plan d'étude])[
Certaines questions peuvent être posées uniquement à un sous-échantillon aléatoire d'individus.

]
#slide(title: [Certaines valeurs peuvent être #emph[censurées]])[
En analyse de survie (ou de délai jusqu'à un événement), l'événement d'intérêt (par exemple le décès) peut ne pas survenir avant la fin de la période de suivi d'un individu.

]
#slide(title: [Données manquantes #emph[vs.] données conditionnellement non définies])[
Les données manquantes doivent être distinguées des données qui sont conditionnellement non définies.

Par exemple, un répondant sans enfants ne peut pas indiquer l'âge de ses enfants.

]
#slide(title: [Il n'existe pas de solution miracle])[
#strong[Toutes les données manquantes n'ont pas a être prises en compte]

- Données manquantes prévues par le plan d'étude
- "Données manquantes" conditionnellement définies

#block[
#callout(
body: 
[
Pour les autres, il est généralement impossible de procéder de manière rigoureuse sans faire au moins des hypothèses partiellement invérifiables sur le mécanisme générant les données manquantes.

]
, 
title: 
[
Important
]
, 
background_color: 
rgb("#f7dddc")
, 
icon_color: 
rgb("#CC1914")
, 
icon: 
fa-exclamation()
, 
body_background_color: 
white
)
]
]
#slide(title: [Notations])[
Rubin a introduit plusieurs distinctions fondamentales concernant les données manquantes.

Soit la matrice $X$ ($n times p$) représentant les données complètes pour un échantillon de $n$ observations sur $p$ variables.

- Certaines entrées de $X$, notées $X_(m i s)$, sont manquantes.
- Les entrées observées de $X$ sont notées $X_(o b s)$.

]
= Types de données manquantes
<types-de-données-manquantes>
== Les mécanismes MCAR, MAR, MNAR
<les-mécanismes-mcar-mar-mnar>
#slide(title: [Données manquantes complètement au hasard (MCAR)])[
Les données sont dites #emph[manquantes complètement au hasard] (#emph[Missing Completely At Random];, MCAR) si les données observées peuvent être considérées comme un échantillon aléatoire simple des données complètes.

La probabilité qu'une valeur soit manquante est indépendante de cette valeur elle-même et de toute autre valeur (observée ou manquante) du jeu de données.

]
#slide(title: [Données manquantes au hasard (MAR)], allow-frame-breaks: true)[
Les données sont #emph[manquantes au hasard] (#emph[Missing At Random];, MAR) lorsque le mécanisme de non-réponse dépend des données observées mais, conditionnellement à celles-ci, pas des données manquantes elles-mêmes.

#block[
#callout(
body: 
[
- Certains individus refusent de déclarer leur revenu et diffèrent systématiquement du reste de l'échantillon.
- Si la décision de ne pas déclarer le revenu est indépendante du revenu lui-même, conditionnellement aux informations #emph[observées] (niveau d'éducation, profession, etc.), alors les données sont MAR.

]
, 
title: 
[
Exemple
]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
, 
body_background_color: 
white
)
]
#framebreak()

La condition MCAR est un cas particulier plus restrictif de MAR. Exemple :

#block[
#callout(
body: 
[
- #strong[MCAR] : la probabilité que le revenu soit manquant est indépendante du niveau de revenu lui-même, et est la même pour tous les individus.
- #strong[MAR] : la probabilité que le revenu soit manquant est indépendante du niveau de revenu lui-même, et est la même pour tous les individus #emph[ayant un même niveau d'éducation];.

]
, 
title: 
[
Exemple
]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
, 
body_background_color: 
white
)
]
]
#slide(title: [Données manquantes non au hasard (MNAR)])[
Les données sont #emph[manquantes non au hasard] (#emph[Missing Not At Random];, MNAR) lorsque la probabilité d'être manquante dépend de la valeur manquante elle-même, même après prise en compte des données observées.

#block[
#callout(
body: 
[
Si, à caractéristiques observées égales, les individus à revenu élevé sont plus susceptibles de ne pas déclarer leur revenu, alors les données manquantes sur le revenu sont MNAR.

]
, 
title: 
[
Exemple
]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
, 
body_background_color: 
white
)
]
]
== Mécanismes ignorables et non ignorables
<mécanismes-ignorables-et-non-ignorables>
#slide(title: [Mécanismes ignorables et non ignorables])[
- Si les données sont MCAR ou MAR, il n'est pas nécessaire de modéliser explicitement le mécanisme de données manquantes pour obtenir des analyses valides.
  - Le mécanisme est alors dit #emph[ignorable];.
  - #emph[Cela ne veut pas dire qu'on ne fait rien] pour améliorer la précision ou diminuer les biais (en particulier en cas de mécanisme MAR).

]
#slide(title: [Peut-on déterminer si les données manquantes sont ignorables ?])[
En dehors de situations particulières (par exemple des données manquantes prévues par le plan d'étude), il est en général impossible de savoir si les données sont MCAR, MAR ou MNAR.

- Montrer que la non-réponse dépend de données observées exclut l'hypothèse MCAR.
- En revanche, ne pas détecter de lien avec les données observées ne prouve pas que les données sont MCAR.
  - Les non-répondants peuvent différer des répondants selon des caractéristiques non observées.

#show: pause

- Voyons maintenant quelques méthodes de prise en compte des données manquantes.

]
== Données utilisées dans la suite
<données-utilisées-dans-la-suite>
#slide(title: [Simulations des données], allow-frame-breaks: true)[
On simule 250 observations issues d'une loi normale bivariée avec :

- Moyennes : $mu_1 = 10$, $mu_2 = 20$
- Variances : $sigma_1^2 = 9$, $sigma_2^2 = 16$
- Covariance : $sigma_12 = 8$

La corrélation entre $X_1$ et $X_2$ est : $rho_12 = 8 / sqrt(9 times 16) = 2 / 3$

#framebreak()

Pentes de régression :

- Régression de $X_1$ sur $X_2$ : $beta_12 = 8 \/ 16 = 0.5$
- Régression de $X_2$ sur $X_1$ : $beta_21 = 8 \/ 9 approx 0.889$

#block[
```r
set.seed(20260204)
n <- 250
mu <- c(10, 20)
sigma <- matrix(c(9, 8, 8, 16), 2, 2)
df <- as.data.frame(MASS::mvrnorm(n = n, mu = mu, Sigma = sigma))
names(df) <- c("X1", "X2")
```

]
La variable $X_1$ est complètement observée, tandis que $X_2$ contient des données manquantes, générées selon 3 mécanismes.

]
#slide(title: [Simulations des données manquantes], allow-frame-breaks: true)[
- #strong[MCAR] : 100 observations de $X_2$ sont rendues manquantes au hasard.

#block[
```r
df$X2_MCAR <- df$X2
df$X2_MCAR[sample(1:nrow(df), 100)] <- NA
```

]
#framebreak()

- #strong[MAR] : la probabilité que $X_2$ soit manquante dépend de $X_1$ observée.

#block[
```r
pmiss <- plogis(-0.5 - (2/3)*(df$X1 - 10)) # proba de NA ↓ quand X1 ↑
df$X2_MAR <- df$X2
df$X2_MAR[as.logical(rbinom(n = nrow(df), 1, pmiss))] <- NA
sum(is.na(df$X2_MAR)) # nombre de NA
```

#block[
```
[1] 103
```

]
]
Comme $X_1$ et $X_2$ sont corrélés positivement, les petites valeur de $X_2$ sont plus souvent manquantes.

#framebreak()

- #strong[MNAR] : la probabilité que $X_2$ soit manquante dépend de la valeur (potentiellement non observée) de $X_2$.

#block[
```r
pmiss <- plogis(-0.5 - 0.5*(df$X2 - 20)) # proba de NA ↓ quand X2 ↑
df$X2_MNAR <- df$X2
df$X2_MNAR[as.logical(rbinom(n = nrow(df), 1, pmiss))] <- NA
table(is.na(df$X2_MNAR)) # nombre de NA
```

#block[
```

FALSE  TRUE 
  145   105 
```

]
]
Les petites valeur de $X_2$ sont également plus souvent manquantes.

#framebreak()


]
#slide(title: [Questions clés pour chaque approche])[
+ Les estimateurs sont-ils sans biais ?
+ Les inférences statistiques sont-elles valides (IC, valeurs p) ?
+ Les données observées sont-elles utilisées efficacement ?

]
= Méthodes basiques
<méthodes-basiques>
== Analyses sur cas complets
<analyses-sur-cas-complets>
#slide(title: [Complete-cases analysis], allow-frame-breaks: true)[
Les observations avec au moins une valeur manquante sont exclues.

#strong[Avantages] :

- Simple à mettre en œuvre.
- Estimations sans biais si les données sont MCAR.
- (Estimations sans biais des coefficients de régression si les données manquantes ne dépendent pas de la variable à expliquer.)

#framebreak()

#strong[Inconvénients] :

- Peu efficace : peu mener à l'exclusion d'un nombre important d'observation.

#block[
#callout(
body: 
[
Même si chaque variable ne comporte qu'un faible pourcentage de données manquantes, celles-ci peuvent concerner des observations différentes d'une variable à l'autre. L'exclusion de toutes les observations présentant au moins une valeur manquante peut réduire fortement la taille de l'échantillon analysé.

]
, 
title: 
[
Exemple
]
, 
background_color: 
rgb("#ccf1e3")
, 
icon_color: 
rgb("#00A047")
, 
icon: 
fa-lightbulb()
, 
body_background_color: 
white
)
]
- Peut conduire à des biais importants si les données manquantes sont MAR ou MNAR.

]
== Imputation par la moyenne
<imputation-par-la-moyenne>
#slide(title: [Moyenne globale])[
balb

]
#slide(title: [Moyenne prédite])[
blss

]
== Best-worst case analysis
<best-worst-case-analysis>
= Pondération
<pondération>
#slide(title: [Article])[
seaman-white-2011-review-of-inverse-probability-weighting-for-dealing-with-missing-data.pdf

]
= Imputation multiple
<imputation-multiple>
#slide(title: [Article])[
Erler

]

