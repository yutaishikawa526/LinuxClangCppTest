#!/bin/bash

# コンパイル実行

## clangコマンドが存在するか
if [ ! -e "`which clang`" ]; then
    echo "clangコマンドが存在しません"
    exit
fi

## 実行ファイルのパス
EXEC_DIR=$(cd $(dirname $0); pwd)

## cppファイルの一覧
CPP_LIST=" "

## cppファイルを全取得
while read FILE_PATH ; do
    if [[ $FILE_PATH =~ ^.*\.cpp$ ]]; then
        # エスケープしてないけど大丈夫か？？？
        CPP_LIST="$CPP_LIST \"$FILE_PATH\""
    fi
done << END
`find "$EXEC_DIR" -type f `
END

## コンパイル
eval "clang -o $EXEC_DIR/out/result.out -std=c++17 -lstdc++ $CPP_LIST -I $EXEC_DIR "