import os

# Define the base directory where you want to create the directories
base_dir = ".."

# Create directories
for i in range(1, 16):
    directory_name = f"lesson_{i:02d}"
    directory_path = os.path.join(base_dir, directory_name)
    os.makedirs(directory_path)
    print(f"Created directory: {directory_path}")