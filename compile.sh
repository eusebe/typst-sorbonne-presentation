#!/bin/bash
# Script de compilation pour typst-sorbonne-presentation
# Doit être exécuté depuis la racine du projet ou via le script principal

echo "🎨 Compiling Sorbonne & IPLESP themes..."

# On s'assure d'être dans le bon dossier si on l'exécute directement
cd "$(dirname "$0")"

EXAMPLES_DIR="examples"
TEST_DIR="tests"

# 1. Démos principales (en 4 variantes : Sorbonne/IPLESP x Light/Dark)
echo "--- Compiling Demos ---"
for theme in sorbonne iplesp; do
    for dark in false true; do
        suffix=""
        [ "$dark" == "true" ] && suffix="-dark"
        echo "  → $theme$suffix"
        
        # Demo principale
        typst compile --root .. "$EXAMPLES_DIR/demo.typ" --input theme=$theme --input dark=$dark "$EXAMPLES_DIR/demo-$theme$suffix.pdf"
        
        # Mappings
        typst compile --root .. "$EXAMPLES_DIR/demo-mapping-2levels.typ" --input theme=$theme --input dark=$dark "$EXAMPLES_DIR/demo-mapping-2levels-$theme$suffix.pdf"
        typst compile --root .. "$EXAMPLES_DIR/demo-mapping-3levels.typ" --input theme=$theme --input dark=$dark "$EXAMPLES_DIR/demo-mapping-3levels-$theme$suffix.pdf"
    done
done

# 2. Tests (en Sorbonne et IPLESP)
echo "--- Compiling Tests ---"
for test_file in $TEST_DIR/*.typ; do
    base=$(basename "$test_file" .typ)
    echo "  → $base"
    typst compile --root .. "$test_file" --input theme=sorbonne "$TEST_DIR/$base-sorbonne.pdf"
    typst compile --root .. "$test_file" --input theme=iplesp "$TEST_DIR/$base-iplesp.pdf"
done

echo "✅ Sorbonne/IPLESP compilation done."
