#!/usr/bin/env python3
"""
Resize an input PNG to multiple sizes and output to subfolders.

Usage:
  python3 build_icons.py icon_512.png 16 32 64 128 [--out-dir OUTPUT_DIR]

This generates:
  OUTPUT_DIR/16x16/kiln-ai.png
  OUTPUT_DIR/32x32/kiln-ai.png
  ...
"""

import os
import sys
import argparse
from PIL import Image

def parse_args():
    parser = argparse.ArgumentParser(description="Generate resized icons from a source image.")
    parser.add_argument("src", help="Source image file (e.g. icon_512.png)")
    parser.add_argument("sizes", nargs="+", type=int, help="Sizes to generate (e.g. 16 32 64)")
    parser.add_argument("--out-dir", default=".", help="Output root directory (default: current dir)")
    return parser.parse_args()

def main():
    args = parse_args()

    if not os.path.exists(args.src):
        print(f"❌ Error: source image not found: {args.src}", file=sys.stderr)
        sys.exit(1)

    try:
        img = Image.open(args.src)
    except Exception as e:
        print(f"❌ Failed to open image: {e}", file=sys.stderr)
        sys.exit(1)

    for size in args.sizes:
        subdir = os.path.join(args.out_dir, f"{size}x{size}")
        os.makedirs(subdir, exist_ok=True)
        resized = img.resize((size, size), Image.Resampling.LANCZOS)
        out_path = os.path.join(subdir, "kiln-ai.png")
        resized.save(out_path)
        print(f"✔ Saved: {out_path}")

if __name__ == "__main__":
    main()
