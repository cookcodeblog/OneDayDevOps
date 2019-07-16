
# Install DevOps tools with Docker and Docker Compose

## Install Docker and use Aliyun Docker Registry

```bash
cd components/docker
./install_docker_ce.sh
./use_aliyun_docker_registry.sh
```

## Install Docker Compose

```bash
cd components/docker-compose
./install_docker_compose.sh
```

## Install GitLab with Docker Compose

Replace values in `gitlab/http/docker-compose.yml`, and then run:
```bash
cd gitlab/http
./install_gitlab_http.sh
```