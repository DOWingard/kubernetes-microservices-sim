#!/usr/bin/env python3
import subprocess
import threading
import time
import signal
import os

FRONTEND_HOST = "10.97.214.150"
FRONTEND_PORT = 80

# Keep track of all subprocesses
processes = []

def clear_database():
    """Clear all tables before starting simulation"""
    print("[Database] Clearing tables...")
    subprocess.run([
        "kubectl", "exec", "-it", "statefulset/postgres", "--",
        "psql", "-U", "postgres", "-d", "logs", "-c",
        "TRUNCATE TABLE orders RESTART IDENTITY; TRUNCATE TABLE metrics RESTART IDENTITY;"
    ])
    print("[Database] Tables cleared")

def run_locust():
    print("[Locust] Starting traffic generation for 3 minutes...")
    proc = subprocess.Popen([
        "locust",
        "-f", "locustfile.py",
        f"--host=http://{FRONTEND_HOST}:{FRONTEND_PORT}",
        "--users", "10",
        "--spawn-rate", "2",
        "--run-time", "3m",
        "--headless"
    ])
    processes.append(proc)
    proc.wait()
    print("[Locust] Completed")

def run_log_collector():
    print("[Log Collector] Starting metrics collection for 3 minutes...")
    proc = subprocess.Popen(["python", "cluster_metrics.py"])
    processes.append(proc)
    proc.wait()
    print("[Log Collector] Completed")

def terminate_subprocesses():
    print("[Simulation] Terminating all subprocesses...")
    for p in processes:
        if p.poll() is None:  # If still running
            try:
                p.terminate()  # send SIGTERM
            except Exception as e:
                print(f"Error terminating process: {e}")
    # Give them a moment, then force kill if still alive
    time.sleep(2)
    for p in processes:
        if p.poll() is None:
            try:
                p.kill()  # send SIGKILL
            except Exception as e:
                print(f"Error killing process: {e}")

if __name__ == "__main__":
    try:
        print("="*60)
        print("Starting Simulation (3 minutes)")
        print("="*60)
        
        # Clear database first
        clear_database()
        
        time.sleep(2)
        
        # Run both in parallel
        t1 = threading.Thread(target=run_locust, daemon=True)
        t2 = threading.Thread(target=run_log_collector, daemon=True)
        
        t1.start()
        t2.start()
        
        # Wait maximum 200 seconds (3min simulation + buffer)
        t1.join(timeout=200)
        t2.join(timeout=200)
        
    finally:
        terminate_subprocesses()
        print("="*60)
        print("Simulation Complete!")
        print("="*60)
