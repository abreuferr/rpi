docker run -d --env-file noip-duc.env --name noip-duc ghcr.io/noipcom/noip-duc:latest

docker run -d --env-file noip-duc.env --name noip-duc --restart unless-stopped ghcr.io/noipcom/noip-duc:latest

docker run -d --env-file noip-duc.env --name noip-duc --restart always ghcr.io/noipcom/noip-duc:latest