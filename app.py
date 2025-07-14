import streamlit as st
import subprocess
import threading
import time  # ✅ thêm dòng này

st.set_page_config(page_title="SSHX Log Viewer", layout="wide")

st.title("🚀 SSHX Process Log Viewer")

log_area = st.empty()

log_lines = []

def run_command():
    global log_lines
    # Chạy lệnh curl qua shell
    process = subprocess.Popen(
        "curl -sSf https://sshx.io/get | sh -s run",
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        bufsize=1
    )

    for line in process.stdout:
        if line.startswith("R"):
            log_lines.append(line.strip())
            if len(log_lines) > 100:
                log_lines = log_lines[-100:]

threading.Thread(target=run_command, daemon=True).start()

while True:
    with log_area:
        st.code("\n".join(log_lines), language="bash")
    time.sleep(1)  # ✅ sửa dòng này
