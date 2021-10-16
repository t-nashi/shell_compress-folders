#!/bin/bash

# 変数定義 ##########
# --
# カレントディレクトリ（.commandファイル実行時）
CURRENT=$(cd $(dirname $0);pwd)
  # echo "・カレントディレクトリ： ${CURRENT}"
# 最終ディレクトリ名
LAST_DIR_NAME=`echo "$CURRENT" | sed -e 's/.*\/\([^\/]*\)$/\1/'`
  # echo $LAST_DIR_NAME

# メイン処理 start ##########
# --
echo -e "\n--コマンドstart--\n"

# カレントディレクトリへ移動
cd $CURRENT

# ディレクトリ名を全て表示
# ls -d */

# ディレクトリ名を配列へ代入
FILE_LIST=(`ls -d */`)
# 配列データ分処理を回す
for FILE in ${FILE_LIST[@]}
do
  # 末尾1文字削除・表示（後方一致除去）
  DIR_NAME=${FILE/%?/}
  # フルパス定義
  FULL_PATH="${CURRENT}/${DIR_NAME}"
  # 圧縮コマンド実行
  zip -r "${DIR_NAME}.zip" "${DIR_NAME}" -x "*.DS_Store" "*__MACOSX*"
done

echo -e "\n--コマンドend--\n"
# --
# メイン処理 end ##########

# プロセスを終了
# osascript -e 'tell application "Terminal" to close first window'
