if [ ! -e .env ]; then
  echo ".envがありません"
  exit
fi

# .envからBP_DIRを読み込み
set -a
source .env
set +a

$EDITOR_FOR_BP "$BP_DIR"
