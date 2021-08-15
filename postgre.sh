DEFAULT_PROJECT_NAME="hermes"
DEFAULT_PORT=5432

# config----------------------------------
POSTGRES_USER=root
POSTGRES_PASSWORD=1234
POSTGRES_DATA_DIR=/var/lib/postgresql/data
# END / config----------------------------------


PROJECT_NAME=${1:-$DEFAULT_PROJECT_NAME}
PORT=${2:-$DEFAULT_PORT}


echo "-----------------------------------------"
echo "PROJECT_NAME : $PROJECT_NAME && PORT : $PORT"
echo " "
echo "Looking for a container on port: $PORT"

ID=$(
  docker container ls --format="{{.ID}}\t{{.Ports}}" |
    grep ${PORT} |
    awk '{print $1}'
)


echo " "
echo "Found Container ID: ${ID}"
echo " "
echo "Stopping and removing it"


docker container stop ${ID}
docker container rm ${ID}

echo " "
echo "-----------------------------------------"
echo " "

#
docker volume create $PROJECT_NAME
# 이미지
docker pull postgres
# 실행
docker run \
  -d \
  --rm \
  -p $PORT:5432 \
  --name $PROJECT_NAME \
  -e POSTGRES_USER=$POSTGRES_USER \
  -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
  -v $PROJECT_NAME:$POSTGRES_DATA_DIR \
  postgres

echo " "
echo " "
echo "-----------------------------------------"