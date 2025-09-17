
#!/bin/bash
# ========================================
# Script khởi tạo cấu trúc slides/ Beamer
# với mỗi file có sẵn \begin{frame}...\end{frame}
# ========================================

BASE_DIR="slides"

# Danh sách thư mục con
DIRS=(
  "00_title"
  "01_introduction"
  "02_background"
  "03_methodology"
  "04_results"
  "05_conclusion"
  "06_thankyou"
)

# Danh sách file trong từng thư mục
FILES_00=("00_title.tex" "01_outline.tex")
FILES_01=("01_motivation.tex" "02_status.tex" "03_objectives.tex" "04_scope.tex" "05_intro_summary.tex")
FILES_02=("01_fall_overview.tex" "02_protocols.tex" "03_cv_intro.tex" "04_pose_estimation.tex" "05_sensors.tex" "06_background_summary.tex")
FILES_03=("01_architecture.tex" "02_hardware.tex" "03_software_overview.tex" "04_module_ast.tex" "05_module_i.tex" "06_module_ii.tex" "07_server.tex" "08_method_summary.tex")
FILES_04=("01_setup.tex" "02_results_detection.tex" "03_latency.tex" "04_stability.tex" "05_results_summary.tex")
FILES_05=("01_summary.tex" "02_contribution.tex" "03_limitations.tex" "04_futurework.tex" "05_overall.tex")
FILES_06=("01_thankyou.tex")

# Hàm sinh file frame
create_frame_file() {
  local filepath=$1
  local frametitle=${filepath##*/}   # lấy tên file
  frametitle=${frametitle%.tex}      # bỏ đuôi .tex

  cat > "$filepath" <<EOF
\begin{frame}{$frametitle}
  % TODO: Add content for $frametitle
\end{frame}
EOF
}

# Xóa thư mục cũ nếu có
if [ -d "$BASE_DIR" ]; then
  echo "⚠️  Thư mục $BASE_DIR đã tồn tại. Xóa trước khi tạo mới..."
  rm -rf "$BASE_DIR"
fi

# Tạo thư mục gốc
mkdir -p "$BASE_DIR"

# Hàm tạo thư mục + file
create_dir_with_files() {
  local dir=$1
  shift
  local files=("$@")

  mkdir -p "$BASE_DIR/$dir"
  for f in "${files[@]}"; do
    FILE_PATH="$BASE_DIR/$dir/$f"
    create_frame_file "$FILE_PATH"
  done
}

# Tạo tất cả thư mục + file
create_dir_with_files "00_title" "${FILES_00[@]}"
create_dir_with_files "01_introduction" "${FILES_01[@]}"
create_dir_with_files "02_background" "${FILES_02[@]}"
create_dir_with_files "03_methodology" "${FILES_03[@]}"
create_dir_with_files "04_results" "${FILES_04[@]}"
create_dir_with_files "05_conclusion" "${FILES_05[@]}"
create_dir_with_files "06_thankyou" "${FILES_06[@]}"

echo "✅ Đã khởi tạo cấu trúc slides/ với frame mẫu thành công."
