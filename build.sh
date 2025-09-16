#!/bin/bash

# Tên file chính của dự án
MAIN_FILE="main.tex"

echo "Bắt đầu biên dịch tài liệu LaTeX với XeLaTeX..."

# Biên dịch tài liệu lần đầu tiên (bỏ -halt-on-error)
xelatex --shell-escape "$MAIN_FILE"

# Biên dịch lại lần thứ hai để cập nhật các tham chiếu chéo (nếu có)
xelatex --shell-escape "$MAIN_FILE"

echo "✅ Biên dịch hoàn tất."
echo "File PDF đã được tạo: ${MAIN_FILE%.*}.pdf"

# Dọn dẹp các file tạm không cần thiết
rm -f *.aux *.log *.out *.nav *.snm *.toc *.vrb *.fls *.synctex.gz
