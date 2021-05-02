if [ ! -e .env ]; then
  echo ".envがありません"
  exit
fi

# .envからBP_DIRを読み込み
set -a
source .env
set +a

# 変数定義
UNIX_TIME=$(date +%s)

# リモートリポジトリからBotpressディレクトリへモジュールを配置（既にあればbackupへ退避）
mkdir -p backup
mv "$BP_DIR/modules/$MODULE_NAME" "backup/$MODULE_NAME-$UNIX_TIME"
git clone "$GIT_REPO" "$BP_DIR/modules/$MODULE_NAME"
