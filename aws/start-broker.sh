KAFKA_ADVERTISED_HOST_NAME=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
KAFKA_BROKER_ID=$(echo $KAFKA_ADVERTISED_HOST_NAME | cut -d'.' -f2- | sed 's/\.//g')
# Elastic IP
KAFKA_ZOOKEEPER_CONNECT="$ZK_STATIC_IP:2181"

cat >broker-fig.yml <<EOL
kafka:
  image: wurstmeister/kafka:0.8.1.1-1
  ports:
    - "9092:9092"
  environment:
    KAFKA_ADVERTISED_HOST_NAME: $KAFKA_ADVERTISED_HOST_NAME
    KAFKA_BROKER_ID: $KAFKA_BROKER_ID
    KAFKA_ZOOKEEPER_CONNECT: $KAFKA_ZOOKEEPER_CONNECT

  volumes:
    - /var/run/docker.sock:/var/run/docker.sock
EOL

fig -f broker-fig.yml up --no-recreate -d
