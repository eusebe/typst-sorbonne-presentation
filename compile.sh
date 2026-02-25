#!/bin/bash
# Script de compilation pour typst-sorbonne-presentation
# Doit être exécuté depuis la racine du projet ou via le script principal

echo "🎨 Compiling Sorbonne & IPLESP themes..."

# On s'assure d'être dans le bon dossier si on l'exécute directement
cd "$(dirname "$0")"

EXAMPLES_DIR="examples"
TEST_DIR="tests"

# Fonction pour générer le fichier .pdfpc si des notes sont présentes
generate_pdfpc() {
    local source=$1
    local target_pdf=$2
    local target_pdfpc="${target_pdf%.pdf}.pdfpc"
    
    # On vérifie si le fichier source contient des marqueurs pdfpc
    if typst query --root .. "$source" "<pdfpc>" 2>/dev/null | grep -q "Note"; then
        echo "    📝 Generating speaker notes: $(basename "$target_pdfpc")"
        typst query --root .. "$source" "<pdfpc>" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
except:
    sys.exit(0)
notes = {}
duration = 0
current_idx = 0
for item in data:
    v = item.get('value', {})
    if v.get('t') == 'Idx':
        current_idx = v['v'] + 1
    elif v.get('t') == 'Note':
        notes[current_idx] = notes.get(current_idx, '') + v['v'] + '\n'
    elif v.get('t') == 'Duration':
        duration = v['v']
print('[notes]')
for pg in sorted(notes.keys()):
    print(f'### {pg}')
    print(notes[pg].strip())
if duration:
    print(f'\n[duration]\n{duration}')
" > "$target_pdfpc"
    fi
}

# 1. Démos principales (en 8 variantes : Sorbonne/IPLESP x Light/Dark x Normal/Handout)
echo "--- Compiling Demos ---"
for theme in sorbonne iplesp; do
    for dark in false true; do
        for handout in false true; do
            suffix=""
            [ "$dark" == "true" ] && suffix="$suffix-dark"
            [ "$handout" == "true" ] && suffix="$suffix-handout"
            echo "  → $theme$suffix"
            
            # Demo principale
            output_pdf="$EXAMPLES_DIR/demo-$theme$suffix.pdf"
            typst compile --root .. "$EXAMPLES_DIR/demo.typ" --input theme=$theme --input dark=$dark --input handout=$handout "$output_pdf"
            generate_pdfpc "$EXAMPLES_DIR/demo.typ" "$output_pdf"
        done

        # Mappings (seulement en mode normal)
        suffix=""
        [ "$dark" == "true" ] && suffix="-dark"
        output_2l="$EXAMPLES_DIR/demo-mapping-2levels-$theme$suffix.pdf"
        typst compile --root .. "$EXAMPLES_DIR/demo-mapping-2levels.typ" --input theme=$theme --input dark=$dark "$output_2l"
        generate_pdfpc "$EXAMPLES_DIR/demo-mapping-2levels.typ" "$output_2l"

        output_3l="$EXAMPLES_DIR/demo-mapping-3levels-$theme$suffix.pdf"
        typst compile --root .. "$EXAMPLES_DIR/demo-mapping-3levels.typ" --input theme=$theme --input dark=$dark "$output_3l"
        generate_pdfpc "$EXAMPLES_DIR/demo-mapping-3levels.typ" "$output_3l"
    done
done

# 2. Tests (en Sorbonne et IPLESP)
echo "--- Compiling Tests ---"
for test_file in $TEST_DIR/*.typ; do
    base=$(basename "$test_file" .typ)
    echo "  → $base"
    
    out_sorbonne="$TEST_DIR/$base-sorbonne.pdf"
    typst compile --root .. "$test_file" --input theme=sorbonne "$out_sorbonne"
    generate_pdfpc "$test_file" "$out_sorbonne"
    
    out_iplesp="$TEST_DIR/$base-iplesp.pdf"
    typst compile --root .. "$test_file" --input theme=iplesp "$out_iplesp"
    generate_pdfpc "$test_file" "$out_iplesp"
done

echo "✅ Sorbonne/IPLESP compilation done."
