
# ===============================
# .latexmkrc - XeLaTeX + Biber + Minted + Zathura
# ===============================

# XeLaTeX command
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -shell-escape %O %S';

# Max rerun if needed
$max_repeat = 5;

# Biber for bibliography
$bibtex_use = 2;        # use Biber if .bcf exists
$biber      = 'biber %O %S';
$bibtex     = 'bibtex %O %S'; # fallback

# Automatically clean auxiliary files including Minted output
@clean_ext = qw(aux log out toc bbl blg bcf run.xml nav snm synctex.gz fdb_latexmk fls _minted-*);

# Clean _minted-* folders on -c
sub clean_minted_dirs {
    use File::Path qw(remove_tree);
    for my $f (glob('_minted-*')) {
        remove_tree($f);
    }
}
add_cus_dep('','clean','',0,'clean_minted_dirs');

# Suppress missing file warnings (0 = off, 1 = on)
$warn_missing_files = 1;

# Always rerun if "Rerun" appears in log
$recorder = 1;

# Default file to build
$default_files = ['main.tex'];

# ===============================
# Use Zathura as the PDF viewer
# Applies to -pv, -pvc, and normal build
# ===============================
$pdf_previewer     = 'zathura';
$pdf_update_method = 2; # 2 = reopen Zathura only if PDF updated
