#!/bin/bash

# Verifica se a rede macvlan já existe
if ! docker network inspect macvlan_network >/dev/null 2>&1; then
    echo "Criando a rede macvlan_network..."
    docker network create \
      --driver=macvlan \
      --subnet=192.168.1.0/24 \
      --gateway=192.168.1.1 \
      -o parent=enxb827eb138286 \
      macvlan_network
else
    echo "Rede macvlan_network já existe."
fi

# Inicia os serviços do Docker Compose
docker-compose up -d