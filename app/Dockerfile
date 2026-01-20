FROM python:3.10-slim

WORKDIR /APP

COPY requirements.txt .

RUN pip install --nocache-dir -r requiremnts.txt

COPY app/main.py

EXPOSE 8000

CMD ["uvicorn","main:app","--host","0.0.0.0","--port","8000"]
