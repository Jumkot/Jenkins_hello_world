# Используем официальный образ Python
FROM python:3.10-slim

# Установка зависимостей
RUN apt-get update && apt-get install -y \
    nginx \
    git \
    && rm -rf /var/lib/apt/lists/*

# Копируем конфигурацию Nginx из app.conf
COPY app.conf /etc/nginx/conf.d/default.conf

# Рабочая директория для приложения
WORKDIR /app

# Клонируем репозиторий
ARG REPO_URL=https://github.com/Jumkot/Jenkins_hello_world.git
RUN git clone $REPO_URL .

# Устанавливаем зависимости Python
RUN pip install -r /app/requirements.txt

# Открываем порты 443 (для Nginx) и 5000 (для Flask)
EXPOSE 443 5000

# Запуск: сначала nginx, затем Flask приложение
CMD service nginx start && python /app/hello_world.py