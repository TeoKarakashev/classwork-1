FROM python:3.9-alpine AS alpine-builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

FROM python:3.9-alpine
WORKDIR /app
COPY --from=alpine-builder /app /app
CMD ["python", "app.py"]