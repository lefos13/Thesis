docker run --network="thesis_playground-net" --log-driver=fluentd --log-opt tag="mongo.node3" -p 3003:3001 dummyservice