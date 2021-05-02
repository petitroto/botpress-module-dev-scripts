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

# Botpressに配置しているモジュールを退避させて、Githubから新たにデプロイ
mkdir -p backup
mv "$BP_DIR/modules/$MODULE_NAME" "backup/$MODULE_NAME-$UNIX_TIME"
git clone "git@github.com:$GITHUB_REPO.git" "$BP_DIR/modules/$MODULE_NAME"
