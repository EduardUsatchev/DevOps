from fastapi import FastAPI, Query

app = FastAPI()

def is_prime(n):
    if n <= 1:
        return False
    if n <= 3:
        return True
    if n % 2 == 0 or n % 3 == 0:
        return False
    i = 5
    while i * i <= n:
        if n % i == 0 or n % (i + 2) == 0:
            return False
        i += 6
    return True

@app.get('/')
def read_root():
    return {"message": "Welcome to the FastAPI Prime Checker Service!"}

@app.get('/check')
def check_prime(number: int = Query(...)):
    prime = is_prime(number)
    return {"number": number, "is_prime": prime}

if __name__ == '__main__':
    import uvicorn
    uvicorn.run(app, host='0.0.0.0', port=8000)
