#!/bin/bash

mongo_container_name="mongo-4-4-5"
mongo_version="mongo:4.4.5-bionic"
user_name="test"
user_pass="PlayMongoIsGood123"


function create_mongo(){
    docker run -d --name ${mongo_container_name} \
        -p 27017:27017 \
        -e MONGO_INITDB_ROOT_USERNAME=admin \
        -e MONGO_INITDB_ROOT_PASSWORD=pass \
        ${mongo_version}
}

function stop_mongo(){
    docker stop ${mongo_container_name}
}

function delete_mongo(){
    docker container rm ${mongo_container_name}
}

function import_example_data(){
    mongorestore --archive=sampledata.archive -u ${user_name} -p ${user_pass} --authenticationDatabase admin
}

function connect_mongo(){
    mongo -u ${user_name} -p ${user_pass} --authenticationDatabase admin
}

function help_msg(){
    echo "Usage:"
    echo "create-mongo, stop-mongo, delete-mongo"
}

function main(){
    case $1 in
        test)
            echo "Hello"
            ;;
        create-mongo)
            create_mongo
            ;;
        stop-mongo)
            stop_mongo
            ;;

        delete-mongo)
            delete_mongo
            ;;

        *)
            help_msg
            ;;
    esac
}

main "$@"