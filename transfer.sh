#!/bin/bash

# 루트 경로 지정
ROOT="/home/kimsooyeon/GAN/UNIT-RGBtoIR"

INPUT_FOLDER="$ROOT/TRAIN_data/amod2visdrone/trainA"
OUTPUT_FOLDER="$ROOT/RESULT_data/amod2visdrone/train"
CONFIG="$ROOT/configs/unit_dior2visdrone.yaml"
CHECKPOINT="$ROOT/work_dir/dior2visdroneIR/outputs/unit_dior2visdrone/checkpoints/gen_00020000.pt"

for img in "$INPUT_FOLDER"/*.{png,jpg,jpeg}; do
  if [ -f "$img" ]; then
    echo "▶️ Processing $img"

    python test.py \
      --trainer UNIT \
      --config "$CONFIG" \
      --input "$img" \
      --output_folder "$OUTPUT_FOLDER" \
      --checkpoint "$CHECKPOINT" \
      --a2b 1 \
      --output_only
  fi
done
