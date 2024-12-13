FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    nginx \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY app.conf /etc/nginx/conf.d/default.conf

WORKDIR /app
COPY . /app

RUN ls -l /app

RUN python -m venv /env
RUN /env/bin/pip install --upgrade pip
RUN /env/bin/pip install -r requirements.txt

EXPOSE 443 5000

CMD service nginx start && /env/bin/python /app/hello_world.py