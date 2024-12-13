FROM jenkins/jenkins:lts

# Устанавливаем Python, pip и Docker Compose
USER root
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    && curl -L "https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Устанавливаем Docker CLI (если его нет)
RUN apt-get install -y docker.io

# Переключаемся обратно на пользователя Jenkins
USER jenkins