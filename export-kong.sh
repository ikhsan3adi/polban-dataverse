docker compose exec deck deck gateway dump \
    --kong-addr http://dataverse_gateway:8086 \
    -o ./configs/kong.yml
