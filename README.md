# Basic Samba Image
This is a very basic setup for a Samba server.

## Docker
Run the following command:

```bash
docker run -e USER_NAME=foo -e USER_PASSWORD=admin -e SHARE_NAME=share -p 445:445/tcp -v ./data:/media/share ghcr.io/parzival-space/basic-samba:latest
```

## Docker Compose
Clone the repository and run:

```bash
docker compose up
```

## License
This project is distributed under the GNU GPL-3.0 license. See ``LICENSE`` for more information.