from flask import Flask, render_template
import os

app = Flask(__name__)

# Mock "Database" of products
products = [
    {"id": 1, "name": "DevOps T-Shirt", "price": 24.99, "image": "tshirt.jpg"},
    {"id": 2, "name": "Kubernetes Hoodie", "price": 49.99, "image": "hoodie.jpg"},
    {"id": 3, "name": "Terraform Cap", "price": 19.99, "image": "cap.jpg"},
]

@app.route('/')
def home():
    # Let's simulate some CPU load, especially under traffic
    total = 0
    for i in range(10000):
        total += i
    return render_template('index.html', products=products)

@app.route('/health')
def health():
    return "Healthy", 200

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)