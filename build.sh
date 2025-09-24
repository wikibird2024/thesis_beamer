
#!/bin/bash
set -euo pipefail

# ===============================
# Cấu hình
# ===============================
MAIN_FILE="main.tex"
PDF_FILE="${MAIN_FILE%.*}.pdf"
ENGINE="xelatex"
TMP_FILES=("*.aux" "*.log" "*.out" "*.toc" "*.bbl" "*.bcf" "*.blg" "*.run.xml" "*.nav" "*.snm" "*.fdb_latexmk" "*.fls")
VIEWERS=("zathura" "okular" "evince" "xdg-open")

# ===============================
# Hàm tiện ích
# ===============================
clean_temp() {
    echo "🧹 Xóa các file tạm (trừ .synctex.gz)..."
    for f in "${TMP_FILES[@]}"; do
        rm -f $f
    done
}

check_viewer() {
    for v in "${VIEWERS[@]}"; do
        if command -v "$v" >/dev/null 2>&1; then
            echo "$v"
            return
        fi
    done
    echo ""
}

# ===============================
# Build + Watch (latexmk -pvc)
# ===============================
build_and_watch() {
    local viewer="$1"
    if [ -z "$viewer" ]; then
        echo "⚠️ Không tìm thấy PDF viewer hợp lệ! Build sẽ chạy nhưng PDF không mở được."
    else
        echo "🚀 Build với $ENGINE và mở PDF bằng $viewer..."
    fi

    # latexmk chuẩn
    latexmk -xelatex -pdf -pvc -shell-escape -interaction=nonstopmode "$MAIN_FILE"
}

# ===============================
# Main
# ===============================
clean_temp

VIEWER=$(check_viewer)

# Kiểm tra DISPLAY cho GUI
if [ -z "$DISPLAY" ]; then
    echo "⚠️ Không có DISPLAY, PDF sẽ không mở được GUI."
    build_and_watch ""
else
    build_and_watch "$VIEWER"
fi
