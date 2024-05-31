# ใช้ official Python image
FROM python:3.9

# ตั้ง working directory
WORKDIR /app

# คัดลอก requirements.txt ไปยัง working directory
COPY requirements.txt .

# ติดตั้ง dependencies
RUN pip install --no-cache-dir -r requirements.txt

# คัดลอก source code ไปยัง working directory
COPY . .

# เปิด port ที่จะใช้ในการสื่อสารกับ container
EXPOSE 8000

# คำสั่งเพื่อรัน FastAPI application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
