if [ ! -e .env ]; then
  echo ".envがありません"
  exit
fi

set -a
source .env
set +a

cd "$BP_DIR" || exit
yarn start
