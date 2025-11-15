docker-compose exec deck deck gateway dump \
    --kong-addr http://dataverse_gateway:8001 \
    -o ./configs/kong.yml
