import sys
import os
from fastapi.testclient import TestClient

# เพิ่มไดเรกทอรีของโปรเจคลงใน sys.path เพื่อให้สามารถ import main ได้
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))

from main import app

client = TestClient(app)

def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"status": 200, "message": "hello world"}

def test_read_item():
    response = client.get("/items/1?q=somequery")
    assert response.status_code == 200
    assert response.json() == {"item_id": 1, "q": "somequery"}

def test_read_item_no_query():
    response = client.get("/items/1")
    assert response.status_code == 200
    assert response.json() == {"item_id": 1, "q": None}
