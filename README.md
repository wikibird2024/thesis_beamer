

```markdown
# Beamer Presentation Project

This project contains a structured **LaTeX Beamer** presentation.  
Each section of the presentation is modularized into separate `.tex` files for clarity and maintainability.

## Structure

```

slides/
├── main.tex             # Main entry point of the presentation
├── 01_introduction.tex  # Introduction section
├── 02_architecture.tex  # System architecture
├── 03_components.tex    # Components and modules
├── 04_app_flow.tex      # Application flow
├── 05_conclusion.tex    # Conclusion and future work

````

## Requirements

- LaTeX distribution with Beamer support (TeX Live, MiKTeX, etc.)
- Optional theme: [Metropolis Beamer Theme](https://github.com/matze/mtheme)

## Usage

To build the PDF presentation:

```bash
alias pvc='latexmk -pdf -pvc'
pvc slides/main.tex
````

You may need to run the command twice to resolve references.

## Notes

* Each `.tex` file represents one section of the presentation.
* Keep each section concise (typically 3–5 slides).
* Modify `main.tex` to adjust global settings (theme, title, author, date, etc.).

```
