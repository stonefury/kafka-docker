description "Start the kafka broker container"
author      "Brian Fleming, Calix Inc. Jan-2015"
start on (local-filesystems and net-device-up IFACE!=lo and started docker)

script

exec >/var/log/kafka-docker.log 2>&1

id=$(docker inspect -f {{.Id}} default_kafka_1)

if [ ! -z $id ]; then
    echo "Kafka container already exists. [$id]"
    running=$(docker inspect -f {{.State.Running}} $id)
    echo $running
    if [ $running = "false" ]; then
        docker start $id
        echo "Restarting existing kafka container [$id]"
    fi
else
    echo "First time creation of kafka container."
    sh /home/ubuntu/dev/kafka-docker/aws/start-broker.sh
fi
end script

