from flask import Flask
from datetime import datetime

app = Flask(__name__)

@app.route('/date')
def date():
    now = datetime.now()
    seconds = now.second
    odd_or_even = "EVEN" if seconds % 2 == 0 else "ODD"
    return f"{now.strftime('%H:%M:%S')} {odd_or_even}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
