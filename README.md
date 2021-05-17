# mongodb-tools
[![Release](https://github.com/mmontes11/mongodb-backup/workflows/Release/badge.svg)](https://github.com/mmontes11/mongodb-backup/actions?query=workflow%3ARelease)

MongoDB backup tools for `amd64`, `arm64` and `armhf`


### Backup 

Dumps a database in a volume.

```yml
version: "3"

services:
  mongo:
    image: mongo:4.2.3
    ports:
      - "27017:27017"
    volumes:
      - ./data:/data/db
    restart: unless-stopped
  mongo-dump:
      image: mmontes11/mongodb-backup:v0.0.1
      environment: 
        - MONGO_URL=mongodb://mongo:27017/db
      volumes:
        - ./backup:/backup
```

### Restore

Restores a database using the dump provided in a volume.

```yml
version: "3"

services:
  mongo:
    image: mongo:4.2.3
    ports:
      - "27017:27017"
    volumes:
      - ./data:/data/db
    restart: unless-stopped
  mongo-dump:
      image: mmontes11/mongodb-backup:v0.0.1
      command: ["./entrypoint.sh", "restore"]
      environment: 
        - MONGO_URL=mongodb://mongo:27017/db
      volumes:
        - ./backup:/backup
```
