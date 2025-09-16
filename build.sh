
#!/bin/bash

# ===============================
# Cấu hình
# ===============================
MAIN_FILE="main.tex"
PDF_FILE="${MAIN_FILE%.*}.pdf"

# Các file tạm cần xóa
TMP_FILES=("*.aux" "*.log" "*.out" "*.toc" "*.bbl" "*.bcf" "*.blg" "*.run.xml" "*.nav" "*.snm" "*.synctex.gz")

# ===============================
# Dọn file tạm trước build
# ===============================
echo "🧹 Xóa các file tạm..."
for f in "${TMP_FILES[@]}"; do
    rm -f $f
done

# ===============================
# Build XeLaTeX + Biber
# ===============================
echo "🚀 Bắt đầu build LaTeX với XeLaTeX..."

# Build lần đầu bằng XeLaTeX
xelatex -shell-escape -interaction=nonstopmode "$MAIN_FILE" &
pid1=$!

# Chạy Biber song song nếu file .bcf tồn tại (có bib)
if [ -f "${MAIN_FILE%.*}.bcf" ]; then
    biber "${MAIN_FILE%.*}" &
    pid2=$!
    wait $pid2
fi

wait $pid1

# Build lại 2 lần để cập nhật cross-reference
xelatex -shell-escape -interaction=nonstopmode "$MAIN_FILE"
xelatex -shell-escape -interaction=nonstopmode "$MAIN_FILE"

# ===============================
# Kiểm tra PDF
# ===============================
if [ -f "$PDF_FILE" ]; then
    echo "✅ Biên dịch hoàn tất: $PDF_FILE"
else
    echo "❌ Biên dịch thất bại! Kiểm tra main.log"
    exit 1
fi

# ===============================
# Dọn file tạm sau build
# ===============================
for f in "${TMP_FILES[@]}"; do
    rm -f $f
done

# ===============================
# Mở PDF
# ===============================
if command -v zathura >/dev/null 2>&1; then
    zathura "$PDF_FILE" &>/dev/null &
    echo "📖 Mở PDF bằng Zathura..."
else
    echo "⚠️ Zathura không có trong PATH. Mở $PDF_FILE thủ công."
fi
