# pgbadger Docker
> - ## [pgbadger github](https://github.com/darold/pgbadger)
> - ## [pgbadger Document](http://pgbadger.darold.net/)

## How to use

- ### Clone this repository
```bash
  git clone https://github.com/sdg9670/docker-pgbadger.git
```

- ### Edit docker-compose yml
```yml
version: "3"
services:
  pgbadger:
    image: sdg9670/pgbadger:latest
    container_name: pgbadger
    volumes:
      - ./logs:/pgbadger/logs
      - ./outs:/pgbadger/outs
    environment:
      # example: "PARAMETERS= --prefix '%t [%p]: user=%u,db=%d,client=%h'"
      - "PARAMETERS="
      - "FILE_NAME=postgresql-*.log"
```

- ### Put log files to ./logs

- ### Run docker-compose
```bash
docker-compose up
```

- ### Check ./out folder
