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
COPY . /app

RUN ls -l /app

# Создание виртуального окружения и установка Python-зависимостей
RUN python -m venv /env
RUN /env/bin/pip install --upgrade pip
RUN /env/bin/pip install -r requirements.txt

# Открываем порты 443 и 5000
EXPOSE 443 5000

# Запуск: сначала nginx, затем Flask приложение
CMD service nginx start && /env/bin/python /app/hello_world.py