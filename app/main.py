from fastapi import FastAPI, Request
import sqlite3
import os
import subprocess

app = FastAPI()

# Initialize DB
conn = sqlite3.connect("test.db", check_same_thread=False)
c = conn.cursor()
c.execute("CREATE TABLE IF NOT EXISTS users (username TEXT, password TEXT)")
c.execute("INSERT OR IGNORE INTO users VALUES ('admin', 'admin123')")
conn.commit()

@app.get("/health")
def health():
    return {"status": "ok"}

# ❌ SQL Injection
@app.get("/search")
def search(q: str):
    query = f"SELECT username FROM users WHERE username LIKE '%{q}%'"
    res = c.execute(query).fetchall()
    return {"result": res}

# ❌ Command Injection
@app.get("/run")
def run(cmd: str):
    output = subprocess.getoutput(cmd)
    return {"output": output}

# ❌ Bad auth
@app.post("/login")
async def login(request: Request):
    data = await request.json()
    user = data.get("username")
    pwd = data.get("password")

    query = f"SELECT * FROM users WHERE username='{user}' AND password='{pwd}'"
    res = c.execute(query).fetchone()

    if res:
        return {"message": "login success"}
    else:
        return {"message": "login failed"}
