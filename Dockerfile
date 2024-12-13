# Базовый образ Jenkins LTS
FROM jenkins/jenkins:lts

# Переключаемся на root для установки пакетов
USER root

# Устанавливаем Nginx и Docker
RUN apt-get update && apt-get install -y \
    nginx \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Копируем конфигурацию Nginx для Jenkins
COPY app.conf /etc/nginx/conf.d/default.conf

# Создаём папку для Nginx и запускаем его вместе с Jenkins
RUN mkdir -p /var/run/nginx

# Открываем порты для Nginx и Jenkins
EXPOSE 443 8080

# Возвращаемся к стандартному пользователю Jenkins
USER jenkins

# Задаём рабочую директорию Jenkins
WORKDIR /var/jenkins_home