#!/usr/bin/env python3
import subprocess
import psycopg2
import time
from datetime import datetime
import json

DB_HOST = "localhost"
DB_NAME = "logs"
DB_USER = "postgres"
DB_PASSWORD = "postgres"

def get_db_connection():
    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        )
        return conn
    except Exception as e:
        return None

def insert_metric(metric_name, metric_value, pod_name):
    """Insert metric into PostgreSQL"""
    conn = get_db_connection()
    if not conn:
        return False
    
    try:
        cursor = conn.cursor()
        cursor.execute(
            "INSERT INTO metrics (metric_name, metric_value, pod_name) VALUES (%s, %s, %s)",
            (metric_name, metric_value, pod_name)
        )
        conn.commit()
        cursor.close()
        conn.close()
        return True
    except Exception as e:
        return False

def get_pod_metrics():
    """Get pod status - count Running vs Total"""
    try:
        result = subprocess.run(
            ["kubectl", "get", "pods", "-o", "json"],
            capture_output=True,
            text=True,
            timeout=10
        )
        pods = json.loads(result.stdout)
        running = sum(1 for p in pods.get("items", []) if p["status"]["phase"] == "Running")
        total = len(pods.get("items", []))
        return running, total
    except Exception as e:
        return 0, 0

def get_node_metrics():
    """Get node status - count Ready vs Total"""
    try:
        result = subprocess.run(
            ["kubectl", "get", "nodes", "-o", "json"],
            capture_output=True,
            text=True,
            timeout=10
        )
        nodes = json.loads(result.stdout)
        ready = sum(1 for n in nodes.get("items", []) 
                   if any(c["type"] == "Ready" and c["status"] == "True" 
                         for c in n["status"]["conditions"]))
        total = len(nodes.get("items", []))
        return ready, total
    except Exception as e:
        return 0, 0

def get_services_count():
    """Get total number of services"""
    try:
        result = subprocess.run(
            ["kubectl", "get", "svc", "-o", "json"],
            capture_output=True,
            text=True,
            timeout=10
        )
        services = json.loads(result.stdout)
        return len(services.get("items", []))
    except Exception as e:
        return 0

def collect_metrics():
    """Collect business-relevant Kubernetes metrics"""
    # Cluster health metrics
    running_pods, total_pods = get_pod_metrics()
    insert_metric("pods_running", str(running_pods), "cluster")
    insert_metric("pods_total", str(total_pods), "cluster")
    
    ready_nodes, total_nodes = get_node_metrics()
    insert_metric("nodes_ready", str(ready_nodes), "cluster")
    insert_metric("nodes_total", str(total_nodes), "cluster")
    
    services = get_services_count()
    insert_metric("services_total", str(services), "cluster")
    
    # Availability metrics
    pod_availability = round((running_pods / total_pods * 100) if total_pods > 0 else 0, 2)
    insert_metric("pod_availability_percent", str(pod_availability), "cluster")
    
    node_availability = round((ready_nodes / total_nodes * 100) if total_nodes > 0 else 0, 2)
    insert_metric("node_availability_percent", str(node_availability), "cluster")
    
    print(f"[{datetime.now()}] Metrics collected - Pods: {running_pods}/{total_pods}, Nodes: {ready_nodes}/{total_nodes}, Services: {services}")

def main():
    """Collect metrics for 3 minutes"""
    print("Starting Kubernetes Metrics Collector (3 minutes)...\n")
    
    start_time = time.time()
    duration = 180  # 3 minutes
    
    while time.time() - start_time < duration:
        try:
            collect_metrics()
            time.sleep(20)  # Collect every 20 seconds
        except KeyboardInterrupt:
            print("\nStopping metrics collector...")
            break
        except Exception as e:
            time.sleep(20)
    
    print("\nMetrics collection completed")

if __name__ == "__main__":
    main()