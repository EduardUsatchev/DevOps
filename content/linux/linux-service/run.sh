sudo chmod +x /usr/local/bin/hello_service.sh
vim /etc/systemd/system/hello.service
#Reload systemd to pick up the new service file:
sudo systemctl daemon-reload
#Enable the Service at Boot: This command ensures the service starts automatically on system boot.

sudo systemctl enable hello.service
#Start the Service:
sudo systemctl start hello.service
#Check Service Status: To verify that the service is running properly:

sudo systemctl status hello.service