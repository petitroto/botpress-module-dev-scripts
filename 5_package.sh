if [ ! -e .env ]; then
  echo ".envがありません"
  exit
fi

# .envからBP_DIRを読み込み
set -a
source .env
set +a

# 変数定義
BASE_DIR=$PWD
UNIX_TIME=$(date +%s)

# ビルドしてパッケージ化する
cd "$BP_DIR/modules/$MODULE_NAME" || exit
yarn build
yarn package

# パッケージに含まれる余計なものを取り除いたらoutディレクトリに入れる
mkdir -p "$BASE_DIR/out/tmp"
tar xzf "$MODULE_NAME.tgz" -C "$BASE_DIR/out/tmp" -X exclude.txt
tar czf "$BASE_DIR/out/$MODULE_NAME-$UNIX_TIME.tgz" -C "$BASE_DIR/out/tmp" .
rm -Rf "$BASE_DIR/out/tmp"
