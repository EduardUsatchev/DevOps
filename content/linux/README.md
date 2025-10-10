# 🐧 Linux Fundamentals Labs

This directory provides a set of **practical Linux exercises and scripts** that teach essential system administration, shell scripting, and OS-level automation skills — all foundational for DevOps engineers.

Each file or subfolder demonstrates a core Linux concept, from managing processes and signals to creating custom systemd services and automating server setup.

---

## 📁 Directory Overview

| Folder / File | Description |
|----------------|-------------|
| **alias.sh** | Demonstrates how to create, persist, and manage shell command aliases to speed up workflow. |
| **apt.sh** | Automates package installation and updates using `apt` — a quick intro to package management scripting. |
| **commands.sh** | Collection of common and advanced Linux commands for daily DevOps use. Serves as a command reference. |
| **compress.sh** | Shows how to compress and decompress files using tools like `tar`, `gzip`, and `zip`. |
| **linux-service/** | Demonstrates how to build and register a custom systemd service (`hello.service`). |
| **signals/** | Demonstrates process signal handling (`SIGINT`, `SIGTERM`, `SIGHUP`) through shell scripting. |
| **ubuntu/** | Contains a Dockerfile and setup script for creating a lightweight Ubuntu environment for testing. |

---

## 🧩 Module Breakdown

### ⚙️ 1. Shell Utilities
| File | Purpose |
|------|----------|
| **alias.sh** | Create and persist aliases, e.g., `alias ll='ls -la'`. Shows how to store them in `.bashrc` or `.zshrc`. |
| **apt.sh** | Automates system package updates and installations — includes safety flags like `apt-get -y`. |
| **commands.sh** | Cheat-sheet of frequently used Linux commands grouped by category (networking, permissions, processes, etc.). |
| **compress.sh** | Demonstrates file archiving and compression for backups or artifact packaging. |

🧠 *Concept:* Learn how to automate system-level operations via shell scripting.

---

### 🧱 2. Custom Linux Service (`linux-service/`)
| File | Description |
|------|--------------|
| **hello_service.sh** | Simple bash script that logs messages — acts as the application being managed. |
| **hello.service** | systemd service unit file that controls the startup/shutdown behavior of the script. |
| **run.sh** | Installs and enables the custom service automatically. |
| **README.md** | Explains the service flow and manual steps to register it with systemd. |

🧠 *Concept:* Learn how **systemd** manages background services (`systemctl start`, `enable`, `status`, etc.).

---

### 🪧 3. Linux Signals (`signals/`)
| File | Description |
|------|--------------|
| **signals.sh** | Script demonstrating how to trap and handle OS signals in Bash. |
| **signal_demo.sh** | Demo showing process control and graceful shutdowns using signal traps. |

🧠 *Concept:* Understand process lifecycle and graceful termination — a key skill for writing robust container entrypoints and CI jobs.

---

### 🐋 4. Ubuntu Environment (`ubuntu/`)
| File | Description |
|------|--------------|
| **Dockerfile** | Defines a minimal Ubuntu container for practicing Linux scripting safely. |
| **ubuntu-setup.sh** | Bootstraps essential packages and user setup — ideal for testing on a clean system. |

🧠 *Concept:* Learn to containerize and reproduce Linux environments consistently using Docker.

---

## ⚙️ Quick Start

```bash
# 1. Run the Ubuntu sandbox
cd ubuntu
docker build -t linux-lab .
docker run -it linux-lab bash

# 2. Create and enable your custom systemd service
cd ../linux-service
bash run.sh

# 3. Observe logs
sudo systemctl status hello
sudo journalctl -u hello
