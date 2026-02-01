#!/bin/bash

# Configuration
SOURCE="typst-sorbonne-presentation/tests/generate_assets.typ"
OUTPUT_DIR="typst-sorbonne-presentation/assets/docs"
ROOT_DIR="."
PPI=144

echo "🎨 Generating assets for Sorbonne theme documentation (Smart Page Selection)..."

mkdir -p "$OUTPUT_DIR"

# Liste des composants et fichiers
COMPS=("faculty-univ" "faculty-sante" "faculty-sciences" "faculty-lettres" "slide" "focus-slide" "figure-slide" "equation-slide" "acknowledgement-slide" "ending-slide" "helper-text" "layout-2col" "layout-3col" "boxes" "citations")
FILES=("faculty-univ.png" "faculty-sante.png" "faculty-sciences.png" "faculty-lettres.png" "component-slide.png" "component-focus-slide.png" "component-figure-slide.png" "component-equation-slide.png" "component-acknowledgement-slide.png" "component-ending-slide.png" "helper-text.png" "layout-2col.png" "layout-3col.png" "component-boxes.png" "component-citation.png")

for i in "${!COMPS[@]}"; do
    COMP="${COMPS[$i]}"
    FILENAME="${FILES[$i]}"
    
    # Sélection de la page : 1 pour les facultés, 2 pour les composants
    if [[ $COMP == faculty-* ]]; then
        PAGE=1
    else
        PAGE=2
    fi

    echo "  → Generating $FILENAME from component '$COMP' (page $PAGE)..."
    typst compile "$SOURCE" "$OUTPUT_DIR/$FILENAME" --format png --pages "$PAGE" --ppi "$PPI" --root "$ROOT_DIR" --input component="$COMP"
done

echo "✅ All assets generated in $OUTPUT_DIR"