# docker-redis-windows
A redis image for Windows containers

### Usage

`redis-server` is set as the entry point. Redis can be configured by supplying `redis-server` arguments to `docker run`, e.g. `docker run cmeeren/redis-windows --protected-mode no`.

#### Persistence

The folder `C:\data` can be used for persistence. Pass `--dir C:/data` and create a volume for `C:/data`.

#### docker-compose.yml example with persistence

```yaml
version: '3.6'

services:
  redis:
    image: cmeeren/redis-windows
    command: --protected-mode no --appendonly yes --dir C:/data
    volumes:
      - redis-data:C:/data

volumes:
  redis-data:
```

### Deployment checklist

Until Docker Hub starts to support automatic Windows builds, use the following procedure:

* `docker build . -t cmeeren/redis-windows:TAGNAME`
* `docker push cmeeren/redis-windows:TAGNAME`