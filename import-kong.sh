docker-compose exec deck deck gateway sync \
    --kong-addr http://dataverse_gateway:8001 \
    ./configs/kong.yml
