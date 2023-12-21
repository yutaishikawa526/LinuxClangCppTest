#!/bin/bash

# フォーマット処理

## 未実装

## clang-formatコマンドが存在するか
if [ ! -e "`which clang-format`" ]; then
    echo "clang-formatコマンドが存在しません"
    exit
fi

## 実行ファイルのパス
EXEC_DIR=$(cd $(dirname $0); pwd)

## cppファイルの一覧
FILE_LIST=" "

## cpp,c,hpp,hファイルを全取得
while read FILE_PATH ; do
    if [[ $FILE_PATH =~ ^.*\.(cpp|c|hpp|h)$ ]]; then
        # エスケープしてないけど大丈夫か？？？
        FILE_LIST="$FILE_LIST \"$FILE_PATH\""
    fi
done << END
`find "$EXEC_DIR" -type f `
END

STYLE_TYPE="--style=file:"\""$EXEC_DIR/.clang-format"\"

echo "clang-format $STYLE_TYPE -i $FILE_LIST"