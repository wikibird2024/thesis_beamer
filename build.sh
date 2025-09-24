
#!/bin/bash
set -euo pipefail

# ===============================
# Cấu hình
# ===============================
MAIN_FILE="main.tex"
PDF_FILE="${MAIN_FILE%.*}.pdf"
ENGINE="xelatex"
TMP_FILES=("*.aux" "*.log" "*.out" "*.toc" "*.bbl" "*.bcf" "*.blg" "*.run.xml" "*.nav" "*.snm" "*.synctex.gz")

# ===============================
# Hàm tiện ích
# ===============================
clean_temp() {
    echo "🧹 Xóa các file tạm..."
    for f in "${TMP_FILES[@]}"; do rm -f $f; done
}

compile() {
    $ENGINE -shell-escape -interaction=nonstopmode "$MAIN_FILE"
}

# ===============================
# Build
# ===============================
clean_temp
echo "🚀 Biên dịch với $ENGINE..."

compile

if [ -f "${MAIN_FILE%.*}.bcf" ]; then
    echo "📚 Chạy biber..."
    biber "${MAIN_FILE%.*}"
    compile
fi

# chạy thêm 1 lần để ổn định cross-ref
compile

# ===============================
# Kiểm tra kết quả
# ===============================
if [ -f "$PDF_FILE" ]; then
    echo "✅ Biên dịch hoàn tất: $PDF_FILE"
else
    echo "❌ Biên dịch thất bại!"
    exit 1
fi

clean_temp

# ===============================
# Mở PDF
# ===============================
for viewer in zathura okular evince xdg-open; do
    if command -v $viewer >/dev/null 2>&1; then
        $viewer "$PDF_FILE" &>/dev/null &
        echo "📖 Mở PDF bằng $viewer..."
        exit 0
    fi
done

echo "⚠️ Không tìm thấy trình đọc PDF phù hợp."
