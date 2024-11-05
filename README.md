# docker-arachni

[Arachni](http://www.arachni-scanner.com/) running in a docker container

## Running

- Running Arachni Web UI
```bash
docker-compose up -d web
or
docker run -dit --network=host --name arachni -p 9292:9292 docker-arachni bin/arachni_web -o 0.0.0.0
```

- Drop in to a bash shell in arachni folder
```bash
docker run -it --network=host --rm --name arachni_web arachni
```

## Access with web browser ##
https://<ip_address_server>:9292

## Log in access ##
Username : admin@admin.admin
Password : administrator

See the [Arachni Wiki](https://github.com/Arachni/arachni/wiki) and [Arachni Web Wiki](https://github.com/Arachni/arachni-ui-web/wiki) for more information.

There are also systemd/fleet service files under units/.

## Building

Override default Framework and WebUI version in Dockerfile:
```bash
docker build --build-arg VERSION=1.6.1.3 --build-arg WEB_VERSION=0.6.1.1 -t arachni .
```

Default version set in Dockerfile:
```bash
docker-compose build
```
