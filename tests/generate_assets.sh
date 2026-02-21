#!/bin/bash

# Configuration
SOURCE="tests/generate_assets.typ"
SORBONNE_OUT="assets/sorbonne-docs"
IPLESP_OUT="assets/iplesp-docs"
ROOT_DIR="."
PPI=144

echo "🎨 Generating assets for Unified themes documentation..."

mkdir -p "$SORBONNE_OUT"
mkdir -p "$IPLESP_OUT"

# 1. Sorbonne Faculty Presets (Page 1: Title Slide)
FACULTIES=("univ" "sante" "sciences" "lettres")
for f in "${FACULTIES[@]}"; do
    echo "  → Sorbonne: faculty-$f"
    typst compile "$SOURCE" "$SORBONNE_OUT/faculty-$f.png" --format png --pages 1 --ppi "$PPI" --root "$ROOT_DIR" --input theme=sorbonne --input component="faculty-$f"
    typst compile "$SOURCE" "$SORBONNE_OUT/faculty-$f-dark.png" --format png --pages 1 --ppi "$PPI" --root "$ROOT_DIR" --input theme=sorbonne --input component="faculty-$f-dark"
done

# 2. IPLESP Theme Presets (Page 1: Title Slide)
THEMES=("blue" "red" "green" "purple" "yellow" "teal" "orange" "slate")
for t in "${THEMES[@]}"; do
    echo "  → IPLESP: theme-$t"
    typst compile "$SOURCE" "$IPLESP_OUT/theme-$t.png" --format png --pages 1 --ppi "$PPI" --root "$ROOT_DIR" --input theme=iplesp --input component="theme-$t"
    typst compile "$SOURCE" "$IPLESP_OUT/theme-$t-dark.png" --format png --pages 1 --ppi "$PPI" --root "$ROOT_DIR" --input theme=iplesp --input component="theme-$t-dark"
done

# 3. Components (Page 2: Content Slide)
COMPS=("slide" "focus-slide" "figure-slide" "equation-slide" "acknowledgement-slide" "ending-slide" "helper-text" "layout-2col" "layout-3col" "layout-grid2x2" "boxes" "citations")
for c in "${COMPS[@]}"; do
    echo "  → Component: $c"
    typst compile "$SOURCE" "$SORBONNE_OUT/component-$c.png" --format png --pages 2 --ppi "$PPI" --root "$ROOT_DIR" --input theme=sorbonne --input component="$c"
done

# Special case for naming consistency in README
[ -f "$SORBONNE_OUT/component-helper-text.png" ] && mv "$SORBONNE_OUT/component-helper-text.png" "$SORBONNE_OUT/helper-text.png"
[ -f "$SORBONNE_OUT/component-layout-2col.png" ] && mv "$SORBONNE_OUT/component-layout-2col.png" "$SORBONNE_OUT/layout-2col.png"
[ -f "$SORBONNE_OUT/component-layout-3col.png" ] && mv "$SORBONNE_OUT/component-layout-3col.png" "$SORBONNE_OUT/layout-3col.png"
[ -f "$SORBONNE_OUT/component-layout-grid2x2.png" ] && mv "$SORBONNE_OUT/component-layout-grid2x2.png" "$SORBONNE_OUT/layout-grid2x2.png"
[ -f "$SORBONNE_OUT/component-citations.png" ] && cp "$SORBONNE_OUT/component-citations.png" "$SORBONNE_OUT/component-citation.png"

echo "✅ All assets generated."
