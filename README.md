
```markdown
# Beamer Presentation Project

This project contains a structured **LaTeX Beamer** presentation.  
Each section of the presentation is modularized into separate `.tex` files for clarity and maintainability.

## Structure

```

slides/
├── main.tex             # Main entry point of the presentation
├── 01\_introduction.tex  # Introduction section
├── 02\_architecture.tex  # System architecture
├── 03\_components.tex    # Components and modules
├── 04\_app\_flow\.tex      # Application flow
├── 05\_conclusion.tex    # Conclusion and future work

````

## Requirements

- LaTeX distribution with Beamer support (TeX Live, MiKTeX, etc.)
- Optional theme: [Metropolis Beamer Theme](https://github.com/matze/mtheme)

## Usage

To build the PDF presentation:

```bash
pdflatex main.tex
````

You may need to run the command twice to resolve references.

## Notes

* Each `.tex` file represents one section of the presentation.
* Keep each section concise (typically 3–5 slides).
* Modify `main.tex` to adjust global settings (theme, title, author, date, etc.).

```
```
