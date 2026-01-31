# Sorbonne Presentation Theme

A professional, structured, and modern presentation theme for **Sorbonne University**, built on top of the [presentate](https://typst.app/universe/package/presentate) and [navigator](https://github.com/eusebe/typst-navigator) packages.

---

## Overview

The **Sorbonne Presentation Theme** provides academic and institutional slide decks that respect the visual identity of Sorbonne University while offering powerful dynamic features.

- **Faculty Presets**: Built-in colors and logos for Health, Science, Humanities, and University-wide presentations.
- **Smart Navigation**: Automatic breadcrumbs, transition slides with roadmaps, and flexible hierarchy mapping.
- **Dynamic Content**: Seamless integration of `pause`, `uncover`, and `only` for step-by-step reveals.
- **Scientific Ready**: Specialized slides for equations, figures, and algorithms.

### 🎨 Faculty Presets
Switch visual identities instantly using the `faculty` parameter:

| Univ | Sante | Sciences | Lettres |
|:---:|:---:|:---:|:---:|
| ![Univ](assets/docs/faculty-univ.png) | ![Sante](assets/docs/faculty-sante.png) | ![Sciences](assets/docs/faculty-sciences.png) | ![Lettres](assets/docs/faculty-lettres.png) |

- `univ`: Sorbonne Blue (University-wide)
- `sante`: Sorbonne Red (Faculty of Health)
- `sciences`: Sorbonne Light Blue (Faculty of Science & Engineering)
- `lettres`: Sorbonne Yellow/Ocre (Faculty of Humanities)

## Documentation

For a comprehensive visual tour of all components and features, please refer to the pre-compiled PDF documentation:

- 📄 **[Main Demo Guide](examples/demo.pdf)**: All components, boxes, and slide types.
- 🗺️ **[2-Levels Mapping Guide](examples/demo-mapping-2levels.pdf)**: Using Section/Subsection hierarchy.
- 🗺️ **[3-Levels Mapping Guide](examples/demo-mapping-3levels.pdf)**: Using Part/Section/Subsection hierarchy.

## Quick Start

```typ
#import "@preview/sorbonne-presentation:0.1.0": *

#show: template.with(
  title: [Scientific Discovery],
  author: [John Doe],
  faculty: "sciences",
  show-outline: true,
)

= Introduction
#slide[
  - High performance
  - Intuitive syntax
  #show: pause
  - *Dynamic* animations
]

#ending-slide()
```

## Configuration Reference

### The `template` function

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | content | `none` | Main presentation title |
| `subtitle` | content | `none` | Optional subtitle |
| `author` | content | `none` | Presenter's name |
| `affiliation` | content | `none` | Department or Laboratory |
| `date` | content | `datetime...` | Custom date display |
| `faculty` | string | `"sante"` | Preset: `"sante"`, `"sciences"`, `"lettres"`, `"univ"` |
| `primary-color` | color | `none` | Manual override for theme color |
| `alert-color` | color | `none` | Manual override for alert text color |
| `logo-slide` | string | `none` | Path to custom logo for content slides |
| `logo-transition` | string | `none` | Path to custom logo for transition slides |
| `text-font` | string | `"Fira Sans"` | Main font family |
| `text-size` | length | `20pt` | Base text size |
| `aspect-ratio` | string | `"16-9"` | `"16-9"` or `"4-3"` |
| `show-outline` | bool | `false` | Toggle summary slide |
| `outline-title` | content | `[Sommaire]` | Title of the summary slide |
| `outline-depth` | int | `2` | Levels shown in summary |
| `outline-columns` | int | `1` | Number of columns for summary |
| `mapping` | dict | `(sec: 1, sub: 2)` | Logic mapping for headings |
| `auto-title` | bool | `true` | Use section name as slide title if none provided |
| `show-header-numbering` | bool | `true` | Toggle all heading numbers |
| `numbering-format` | string | `"1.1"` | Format for sections and subsections |
| `part-numbering-format` | string | `"I"` | Format for parts |
| `annex-title` | content | `[Annexe]` | Prefix for single appendix |
| `annex-main-title` | content | `[Annexes]` | Focus slide text for appendix start |
| `annex-numbering-format` | string | `"I"` | Numbering style for appendices |

## Component Reference

### Slide Types
- `#slide(title: none, body)`: Standard content slide.
- `#focus-slide(body)`: Highlight slide on solid theme background.
- `#figure-slide(fig, caption: none, ..)`: Centered figure slide.
- `#equation-slide(equation, definitions: none, citation: none, ..)`: Large equation with "signature" citation.
- `#acknowledgement-slide(people: (), institutions: (), ..)`: Thank-you slide.
- `#ending-slide(contact: ())`: Closing slide with contact information.

### Text Helpers
- `#alert[text]`: Highlighted bold text.
- `#muted[text]`: Gray secondary text.
- `#subtle[text]`: Light gray tertiary text.

### Layout & Boxes
- `#two-col(left, right, columns: (1fr, 1fr), gutter: 2em)`: Balanced columns.
- `#three-col(left, center, right, ..)`: Three column layout.
- `#highlight-box(title, body, fill-mode: "outline")`: Styled informational box.
  - `fill-mode`: `"outline"`, `"fill"`, `"full"`, or `"transparent"`.
- `#algorithm-box(title, body)`: Monospace box for algorithmic logic.

## Credits

- **Underlying Packages**: Built with [presentate](https://typst.app/universe/package/presentate) and [navigator](https://github.com/eusebe/typst-navigator).
- **Inspiration**: Layout features and component designs were inspired by the [calmly-touying](https://typst.app/universe/package/calmly-touying) theme. A special thanks to its author for the high-quality design inspiration.

## License

MIT License. See [LICENSE](LICENSE) for details.
