# ใช้ base image ของ Python 3.9
FROM python:3.9

# กำหนด working directory
WORKDIR /app

# คัดลอกไฟล์ requirements.txt และติดตั้ง dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# คัดลอกซอร์สโค้ดของโปรเจคไปยัง Docker image
COPY . .

# ระบุคำสั่งเพื่อรันแอปพลิเคชัน
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
