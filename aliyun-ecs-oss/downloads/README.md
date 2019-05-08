
Put installation packages to `/downloads/packages` folder.

Manual copy example:

```bash
mkdir -p /downloads/packages

# Docker and Docker Compose packages
scp -r docker root@192.168.87.121:/downloads/packages/

# Harbor offline installer
scp -r harbor root@192.168.87.121:/downloads/packages/
```