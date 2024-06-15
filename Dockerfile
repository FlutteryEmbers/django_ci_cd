FROM python:3.11
WORKDIR /app
RUN apt-get update && apt-get install -y \
    graphviz \
    libgraphviz-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY . /app
CMD ["sh", "-c", "python manage.py migrate && python manage.py collectstatic --noinput && gunicorn mysite.wsgi:application --bind 0.0.0.0:8080"]
