# Saman Ray Typst Action

A GitHub Action to compile Typst documents to PDF.

## Usage

```yaml
- name: Compile Typst
  uses: samanray/typst-action@v1
  with:
    source_file: main.typ
    output_file: main.pdf  # optional
```