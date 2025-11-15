docker-compose exec deck deck gateway sync \
    --kong-addr http://dataverse_gateway:8086 \
    ./configs/kong.yml
