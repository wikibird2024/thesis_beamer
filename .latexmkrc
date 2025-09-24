
# ===============================
# Latexmk config (XeLaTeX + Biber + Minted)
# ===============================

# Engine: dùng XeLaTeX với minted (cần -shell-escape)
$pdflatex = 'xelatex -shell-escape -interaction=nonstopmode %O %S';

# Bibliography: dùng biber thay cho bibtex
$biber = 'biber %O %B';
$bibtex_use = 2;

# File gốc để latexmk theo dõi
@default_files = ('main.tex');

# Phần mở rộng file tạm để clean khi chạy 'latexmk -c'
$clean_ext = 'aux log out toc bbl bcf blg run.xml nav snm synctex.gz fdb_latexmk fls';

# PDF viewer: ưu tiên zathura, fallback sang xdg-open
if (system("command -v zathura >/dev/null 2>&1") == 0) {
    $pdf_previewer = 'zathura %O %S';
} else {
    $pdf_previewer = 'xdg-open %S';
}

# Tùy chọn khác
$preview_continuous_mode = 1;         # Giữ viewer khi rebuild (-pvc)
$cleanup_includes_cusdep_generated = 1; # Clean cả file phụ từ biber/minted
