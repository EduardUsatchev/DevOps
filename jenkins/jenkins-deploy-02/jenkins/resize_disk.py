from os import getenv
def disk_resize(disk_name, machine_name,target_gb):
    print(f"details {disk_name} {machine_name} to {target_gb}")
    print("Connecting to vsphere")
    print("locating machine")
    print("resizing disk")
    print("SSHing to machine")

disk_name = getenv("DISK_NAME")
machine_name = getenv("MACHINE_NAME")
target_gb = getenv("TARGET_GB")

disk_resize(disk_name,machine_name,target_gb)
