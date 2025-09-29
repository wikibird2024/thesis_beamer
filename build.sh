
#!/bin/bash
# ===============================
# buildpdf.sh - Professional XeLaTeX build script
# Supports Minted, Biber, continuous build
# ===============================

set -e

MAIN_FILE="main.tex"
LOG_FILE="build.log"

# Optional: enable emojis in output
EMOJI=true
info()    { [ "$EMOJI" = true ] && echo "📝 $*" || echo "$*"; }
success() { [ "$EMOJI" = true ] && echo "✅ $*" || echo "$*"; }
warn()    { [ "$EMOJI" = true ] && echo "⚠️  $*" || echo "$*"; }

# Check command argument
ACTION=${1:-build}  # default action is 'build'

case "$ACTION" in
    build)
        info "Starting XeLaTeX build for $MAIN_FILE..."
        latexmk -xelatex -interaction=nonstopmode -shell-escape -synctex=1 "$MAIN_FILE" 2>&1 | tee "$LOG_FILE"
        if [ -f main.pdf ]; then
            success "Build complete. PDF generated: main.pdf"
            info "File size: $(du -h main.pdf | cut -f1)"
            xdg-open main.pdf >/dev/null 2>&1 || true
        else
            warn "PDF not found. Check $LOG_FILE"
        fi
        ;;
    clean)
        info "Cleaning auxiliary files..."
        latexmk -C
        success "Clean complete."
        ;;
    watch)
        info "Starting continuous build (watch mode)..."
        latexmk -xelatex -pvc -interaction=nonstopmode -shell-escape -synctex=1 "$MAIN_FILE"
        ;;
    *)
        echo "Usage: $0 {build|clean|watch}"
        exit 1
        ;;
esac
