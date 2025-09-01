#!/bin/bash
# signal_demo.sh
# This script demonstrates handling of signals:
# SIGINT (2), SIGTERM (15), SIGKILL (9), SIGSTOP (19), and SIGCONT (18).
#
# Note:
# - SIGINT and SIGTERM are caught by the script.
# - SIGKILL cannot be caught or handled.
# - SIGSTOP and SIGCONT cannot be caught; they are used to pause and resume the process.

# Trap SIGINT (Ctrl+C)
#Trap for SIGINT:
#The trap command sets up a handler for the SIGINT signal (usually sent by pressing Ctrl+C).
#When SIGINT is received, it runs the command inside the quotes:
#it prints a message and then exits with status 0 (indicating a clean exit).
trap "echo 'Received SIGINT (Ctrl+C). Exiting gracefully...'; exit 0" SIGINT

# Trap SIGTERM (polite termination request)
trap "echo 'Received SIGTERM. Exiting gracefully...'; exit 0" SIGTERM

echo "Signal Demo Script"
echo "Process PID: $$"
echo "------------------------------------------------------"
echo "Try the following from another terminal or using Ctrl+C:"
echo "  - SIGINT: Press Ctrl+C"
echo "  - SIGTERM: run 'kill -15 $$'"
echo "  - SIGKILL: run 'kill -9 $$' (cannot be caught, script will exit immediately)"
echo "  - SIGSTOP: run 'kill -19 $$' (process will pause)"
echo "  - SIGCONT: run 'kill -18 $$' (process will resume if stopped)"
echo "------------------------------------------------------"

# Main loop to keep the process running.
while true; do
    echo "Script is running. Current time: $(date)"
    sleep 5
done
