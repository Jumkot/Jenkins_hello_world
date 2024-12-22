FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

RUN ls -l /app

RUN python -m venv /env
RUN /env/bin/pip install --upgrade pip
RUN /env/bin/pip install -r requirements.txt

CMD /env/bin/python /app/hello_world.py