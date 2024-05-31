FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# เพิ่มคำสั่งนี้เพื่อให้สามารถรัน pytest ได้ใน container
RUN pip install pytest

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]