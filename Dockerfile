FROM python:3.7-alpine3.8

RUN pip install pudb

WORKDIR /app
COPY ./app /app

EXPOSE 6900

CMD ["python", "example.py"]
