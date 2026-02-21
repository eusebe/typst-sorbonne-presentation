#!/bin/bash

ROOT=$(pwd)
TEST_DIR="tests"
EXAMPLES_DIR="examples"

echo "Running tests for Sorbonne and IPLESP themes..."

# Compile demos
echo "Compiling demos..."
for theme in sorbonne iplesp; do
    echo "  → theme: $theme"
    typst compile --root . examples/demo.typ --input theme=$theme examples/demo-$theme.pdf
    typst compile --root . examples/demo.typ --input theme=$theme --input dark=true examples/demo-$theme-dark.pdf
    typst compile --root . examples/demo-mapping-2levels.typ --input theme=$theme examples/demo-mapping-2levels-$theme.pdf
    typst compile --root . examples/demo-mapping-2levels.typ --input theme=$theme --input dark=true examples/demo-mapping-2levels-$theme-dark.pdf
    typst compile --root . examples/demo-mapping-3levels.typ --input theme=$theme examples/demo-mapping-3levels-$theme.pdf
    typst compile --root . examples/demo-mapping-3levels.typ --input theme=$theme --input dark=true examples/demo-mapping-3levels-$theme-dark.pdf
done

# Compile tests
for test_file in $TEST_DIR/*.typ; do
    base=$(basename "$test_file" .typ)
    echo "Testing $base..."
    typst compile --root . "$test_file" --input theme=sorbonne "$TEST_DIR/$base-sorbonne.pdf"
    typst compile --root . "$test_file" --input theme=iplesp "$TEST_DIR/$base-iplesp.pdf"
done

echo "Done."
