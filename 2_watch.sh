if [ ! -e .env ]; then
  echo ".envがありません"
  exit
fi

# .envからBP_DIRを読み込み
set -a
source .env
set +a

# 変更したら自動ビルドするwatchプロセスをスタート
cd "$BP_DIR/modules/$MODULE_NAME" || exit
yarn
yarn watch
