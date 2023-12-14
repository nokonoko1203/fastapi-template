from fastapi.testclient import TestClient
from sample.app import app

client = TestClient(app)


def test_sample():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello World"}
