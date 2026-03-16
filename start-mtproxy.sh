CONTAINER_NAME="mtproto-proxy"
SECRET="874dfb0cb61ca03d4fc126e4deb3a327"
PORT="443"

docker stop ${CONTAINER_NAME} >/dev/null 2>&1
docker rm ${CONTAINER_NAME} >/dev/null 2>&1

docker run -d \
  --name ${CONTAINER_NAME} \
  --restart unless-stopped \
  -p ${PORT}:${PORT} \
  nineseconds/mtg:2 \
  simple-run -n 1.1.1.1 -i prefer-ipv4 0.0.0.0:${PORT} ${SECRET}
