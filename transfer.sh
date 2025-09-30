#!/bin/bash
INPUT_FOLDER="/home/kimsooyeon/GAN/UNIT/TRAIN_data/amod2visdrone/trainA"
OUTPUT_FOLDER="/home/kimsooyeon/GAN/UNIT/RESULT_data/amod2visdrone/train"
CONFIG="/home/kimsooyeon/GAN/UNIT/configs/unit_dior2visdrone.yaml"
CHECKPOINT="/home/kimsooyeon/GAN/UNIT/work_dir/dior2visdroneIR/outputs/unit_dior2visdrone/checkpoints/gen_00020000.pt"

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


