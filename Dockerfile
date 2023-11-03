FROM Ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip

COPY ./src/app.py /app.py

RUN pip3 install flask

WORKDIR /

EXPOSE 5000

CMD ["python3", "app.py"]
