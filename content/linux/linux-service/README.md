[Unit] Section:
Description: A short description of the service.
After: Specifies that the service should start after the network is ready.
[Service] Section:
ExecStart: The command to execute your script.
Restart: This option ensures your service restarts if it crashes.
User: Specifies which user to run the service as (use a non-root user if possible for production).
StandardOutput and StandardError: Redirect logs to syslog.
SyslogIdentifier: Helps identify your service’s logs in the syslog.
[Install] Section:
WantedBy: Tells systemd which target (runlevel) this service should be started under.

Reload systemd to pick up the new service file:
sudo systemctl daemon-reload
Enable the Service at Boot: This command ensures the service starts automatically on system boot.
sudo systemctl enable hello.service
Start the Service:
sudo systemctl start hello.service
Check Service Status: To verify that the service is running properly:
sudo systemctl status hello.service

sudo journalctl -u hello.service -f

