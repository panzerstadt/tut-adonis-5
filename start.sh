function finish {
    echo "cleaning up docker-compose..."
    docker-compose down
    echo "stopped."
}

concurrently --kill-others --names "DOCKER,ADONIS" --prefix-colors "cyan,yellow" "docker-compose up" "node ace serve --watch"
trap finish EXIT