FROM python:3.10-slim

WORKDIR /app

# Копируем зависимости и устанавливаем их
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем код приложения
COPY . .

# Открываем порт (Serverless Containers по умолчанию ожидает порт 8080)
EXPOSE 8080

# Запускаем Streamlit с флагами для работы в контейнере
CMD ["streamlit", "run", "app.py", "--server.port=8080", "--server.address=0.0.0.0"]
