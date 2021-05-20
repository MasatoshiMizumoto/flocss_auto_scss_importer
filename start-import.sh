#!bash

# 共通パラメータ
base_dir=$1
export_file="style.scss"
command_string=$2
layer_1="foundation"
layer_2="layout"
layer_3="object/component"
layer_4="object/project"
layer_5="object/utility"


# 引数チェック
if [ $# = 0 ]; then
  echo ""
  echo "** 必須情報なし **"
  echo "各レイヤーディレクトリ（foundation, etc...）を内包するディレクトリのパス、及び@useか@importかを指定して再実行してください。"
  exit 1
fi

if [ $2 != @use ] && [ $2 != @import ]; then
  echo ""
  echo "** インポート文字列誤り **"
  echo "@useでも@importでもない文字列が渡されています。再実行してください。"
fi

# layer_1
# scss/foundation
# =========================

echo "Start import..."
echo ""
echo "========================="
echo "** ${layer_1} **"

section_text=$(
cat <<EOF
/**
* ${layer_1}
* ========================= */

${command_string} "${layer_1}/reset";
${command_string} "${layer_1}/variables";
${command_string} "${layer_1}/function";
${command_string} "${layer_1}/mixin";
${command_string} "${layer_1}/base";
EOF
)

echo "${section_text}" >${base_dir}/${export_file}
echo "" >>${base_dir}/${export_file}

# layer_2
# scss/layout
# =========================

echo "** ${layer_2} **"

section_text=$(
cat <<EOF
/**
* ${layer_2}
* ========================= */
EOF
)

echo "${section_text}" >>${base_dir}/${export_file}
echo "" >>${base_dir}/${export_file}
file_name=($(ls -1 ${base_dir}/${layer_2} | sed 's/\.[^\.]*$//' | sed -e "s/^_//g"))
for row in "${file_name[@]}" ; do echo "${command_string} \"${layer_2}/${row}\";" >>${base_dir}/${export_file} ; done;
echo "" >>${base_dir}/${export_file}

# layer_3
# scss/object/component
# =========================

echo "** ${layer_3} **"

section_text=$(
cat <<EOF
/**
* ${layer_3}
* ========================= */
EOF
)

echo "${section_text}" >>${base_dir}/${export_file}
echo "" >>${base_dir}/${export_file}
file_name=($(ls -1 ${base_dir}/${layer_3} | sed 's/\.[^\.]*$//' | sed -e "s/^_//g"))
for row in "${file_name[@]}" ; do echo "${command_string} \"${layer_3}/${row}\";" >>${base_dir}/${export_file} ; done;
echo "" >>${base_dir}/${export_file}

# layer_4
# scss/object/project
# =========================

echo "** ${layer_4} **"

section_text=$(
cat <<EOF
/**
* ${layer_4}
* ========================= */
EOF
)

echo "${section_text}" >>${base_dir}/${export_file}
echo "" >>${base_dir}/${export_file}
file_name=($(ls -1 ${base_dir}/${layer_4} | sed 's/\.[^\.]*$//' | sed -e "s/^_//g"))
for row in "${file_name[@]}" ; do echo "${command_string} \"${layer_4}/${row}\";" >>${base_dir}/${export_file} ; done;
echo "" >>${base_dir}/${export_file}

# layer_5
# scss/object/utility
# =========================

echo "** ${layer_5} **"

section_text=$(
cat <<EOF
/**
* ${layer_5}
* ========================= */
EOF
)

echo "${section_text}" >>${base_dir}/${export_file}
echo "" >>${base_dir}/${export_file}
file_name=($(ls -1 ${base_dir}/${layer_5} | sed 's/\.[^\.]*$//' | sed -e "s/^_//g"))
for row in "${file_name[@]}" ; do echo "${command_string} \"${layer_5}/${row}\";" >>${base_dir}/${export_file} ; done;

echo "========================="
echo ""
echo "Finish."
