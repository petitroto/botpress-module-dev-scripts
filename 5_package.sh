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

# ビルドしてパッケージ化したらoutディレクトリに入れる
cd "$BP_DIR/modules/$MODULE_NAME" || exit
yarn build
yarn package
mkdir -p "$BASE_DIR/out"
mv "$MODULE_NAME.tgz" "$BASE_DIR/out/$MODULE_NAME-$UNIX_TIME.tgz"
