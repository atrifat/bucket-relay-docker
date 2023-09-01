# bucket-relay-docker
A simple nostr relay docker image for development, based on [coracle-social/bucket](https://github.com/coracle-social/bucket).

## Getting Started
To build docker image in local environment, clone repository:
```
git clone https://github.com/atrifat/bucket-relay-docker

cd bucket-relay-docker

docker build -t bucket-relay-docker .
```

and then run it as one-off command (automatically disposed)
```
docker run --rm -p 4736:4736 -it bucket-relay-docker
```

or run it as daemon (with custom environment variable)
```
docker run -p 4735:4735 -e PORT=4735 -e PURGE_INTERVAL=86400  --name bucket-relay-docker -it -d bucket-relay-docker
```

Published docker image is also available in [ghcr.io](https://github.com/users/atrifat/packages/container/package/bucket-relay-docker). 
```
docker pull ghcr.io/atrifat/bucket-relay-docker:main
```

## License
MIT

## Author
Rif'at Ahdi Ramadhani (atrifat)


