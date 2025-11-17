import psycopg2
from locust import HttpUser, task, between
import uuid
import random

def get_db_connection():
    try:
        conn = psycopg2.connect(
            host="localhost",
            database="logs",
            user="postgres",
            password="postgres"
        )
        return conn
    except Exception as e:
        print(f"DB Connection error: {e}")
        return None

def insert_order(customer_email, total_amount, status, service_name):
    conn = get_db_connection()
    if not conn:
        return
    try:
        cursor = conn.cursor()
        order_id = f"ORD-{uuid.uuid4().hex[:8].upper()}"
        cursor.execute(
            "INSERT INTO orders (order_id, customer_email, total_amount, status) VALUES (%s, %s, %s, %s)",
            (order_id, customer_email, total_amount, status)
        )
        conn.commit()
        cursor.close()
        conn.close()
        print(f"Order from {service_name}: {order_id}")
    except Exception as e:
        print(f"Error: {e}")

def log_service_call(service_name, endpoint, status_code):
    """Log service calls to metrics table"""
    conn = get_db_connection()
    if not conn:
        return
    try:
        cursor = conn.cursor()
        cursor.execute(
            "INSERT INTO metrics (metric_name, metric_value, pod_name) VALUES (%s, %s, %s)",
            (f"{service_name}_calls", "1", endpoint)
        )
        conn.commit()
        cursor.close()
        conn.close()
    except Exception as e:
        pass

class MicroservicesUser(HttpUser):
    wait_time = between(1, 3)
    
    @task(1)
    def browse_products(self):
        try:
            self.client.get("/")
            log_service_call("frontend", "browse", 200)
        except:
            pass
    
    @task(2)
    def view_product(self):
        try:
            self.client.get("/product/OLJCESPC7Z")
            log_service_call("productcatalog", "view", 200)
        except:
            pass
    
    @task(1)
    def add_to_cart(self):
        try:
            self.client.post("/cart", json={"product_id": "OLJCESPC7Z", "quantity": 1})
            log_service_call("cartservice", "add", 200)
        except:
            pass
    
    @task(1)
    def checkout(self):
        try:
            email = f"user_{uuid.uuid4().hex[:6]}@example.com"
            total = round(random.uniform(50, 300), 2)
            
            insert_order(email, total, "completed", "checkout")
            log_service_call("checkout", "process", 200)
            log_service_call("payment", "process", 200)
            
            self.client.post("/checkout", json={
                "email": email,
                "address": "123 Main St",
                "zip_code": "12345"
            })
        except:
            pass