FROM alpine:latest

RUN apk update && apk add python3 py3-pip

COPY ./src/app.py /app.py

RUN pip3 install flask && \
    apk del py3-pip && \
    rm -rf /var/cache/apk/*

WORKDIR /

EXPOSE 5000

CMD ["python3", "app.py"]