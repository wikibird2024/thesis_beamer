
#!/bin/bash
# =======================================================
# buildpdf.sh - Professional XeLaTeX build script
# Uses latexmk, supports Minted, Biber, and Zathura viewer.
# =======================================================

# Dừng ngay nếu có lệnh nào thất bại
set -e

MAIN_FILE="main.tex"
LOG_FILE="build.log"

# --- Khai báo hàm cho thông báo đẹp hơn ---
EMOJI=true
info()    { [ "$EMOJI" = true ] && echo "📝 $*" || echo "$*"; }
success() { [ "$EMOJI" = true ] && echo "✅ $*" || echo "$*"; }
warn()    { [ "$EMOJI" = true ] && echo "⚠️ $*" || echo "$*"; }
error()   { [ "$EMOJI" = true ] && echo "❌ $*" || echo "$*"; }

# --- Hàm mở file PDF bằng Zathura (ưu tiên) hoặc trình xem mặc định ---
open_pdf() {
    local pdf_file="$1"
    info "Attempting to open $pdf_file..."

    if command -v zathura >/dev/null 2>&1; then
        zathura "$pdf_file" >/dev/null 2>&1 &
        success "Opened with Zathura."
    elif command -v xdg-open >/dev/null 2>&1; then
        xdg-open "$pdf_file" >/dev/null 2>&1 &
        success "Opened with xdg-open."
    elif command -v open >/dev/null 2>&1; then
        open "$pdf_file"
        success "Opened with 'open' (macOS)."
    else
        warn "Could not find Zathura or a default PDF viewer command (xdg-open/open). Please open '$pdf_file' manually."
    fi
}

# --- Xử lý các tác vụ chính ---
ACTION=${1:-build}  # default action is 'build'

case "$ACTION" in
    build)
        info "Starting XeLaTeX build for $MAIN_FILE..."

        latexmk -xelatex -interaction=nonstopmode -shell-escape -synctex=1 "$MAIN_FILE" 2>&1 | tee "$LOG_FILE"

        if [ -f main.pdf ]; then
            success "Build complete. PDF generated: main.pdf"
            info "File size: $(du -h main.pdf | cut -f1)"
            open_pdf main.pdf
        else
            error "PDF not found. Compilation failed. Check $LOG_FILE for details."
            exit 1
        fi
        ;;
    clean)
        info "Cleaning auxiliary files..."
        latexmk -C
        success "Clean complete. All temporary files removed."
        ;;
    watch)
        info "Starting continuous build (watch mode)..."
        latexmk -xelatex -pvc -interaction=nonstopmode -shell-escape -synctex=1 "$MAIN_FILE"
        ;;
    *)
        echo "Usage: $0 {build|clean|watch}"
        error "Invalid action: $ACTION"
        exit 1
        ;;
esac

# =======================================================
