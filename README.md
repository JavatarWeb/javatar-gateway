# Gateway Javatar

Main forwarding service.

## Installation

Install SSL certificates via:

```bash
chmod +x cert.sh
./cert.sh
```

Swap domains on yours:

```bash
domain="yourmaindomain.com"
alldomains="yourmaindomain.com,sub.yourmaindomain.com"
```

## Run
Run:
```bash
docker compose -d up
```
Stop:
```bash
docker compose down
```
## Development mode

To run containers without establishing SSL connection run

```bash
docker compose -f docker-compose.yml -f docker-compose.dev.yml up
```