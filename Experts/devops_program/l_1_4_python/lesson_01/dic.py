# 1. Creating a dictionary
employee_data = {
    "employee_id": 101,
    "name": "Alice Smith",
    "age": 30,
    "department": "HR",
    "salary": 60000
}

# 2. Accessing values
print(f"Name: {employee_data['name']}")  # Output: Name: Alice Smith
print(f"Department: {employee_data['department']}")  # Output: Department: HR

# 3. Adding a new key-value pair
employee_data["position"] = "Manager"
print(employee_data)
# Output: {'employee_id': 101, 'name': 'Alice Smith', 'age': 30, 'department': 'HR', 'salary': 60000, 'position': 'Manager'}

# 4. Updating an existing key-value pair
employee_data["salary"] = 65000
print(f"Updated Salary: {employee_data['salary']}")  # Output: Updated Salary: 65000

# 5. Deleting a key-value pair
del employee_data["age"]
print(employee_data)
# Output: {'employee_id': 101, 'name': 'Alice Smith', 'department': 'HR', 'salary': 65000, 'position': 'Manager'}

# 6. Iterating through a dictionary
for key, value in employee_data.items():
    print(f"{key}: {value}")
# Output:
# employee_id: 101
# name: Alice Smith
# department: HR
# salary: 65000
# position: Manager

# 7. Checking if a key exists
if "department" in employee_data:
    print("Department exists in the dictionary.")  # Output: Department exists in the dictionary.

# 8. Getting the value with a default if key is missing
location = employee_data.get("location", "Not Provided")
print(f"Location: {location}")  # Output: Location: Not Provided

# 9. Merging two dictionaries
additional_data = {
    "hire_date": "2020-05-01",
    "benefits": ["Health Insurance", "401K"]
}
employee_data.update(additional_data)
print(employee_data)
# Output: {'employee_id': 101, 'name': 'Alice Smith', 'department': 'HR', 'salary': 65000, 'position': 'Manager', 'hire_date': '2020-05-01', 'benefits': ['Health Insurance', '401K']}

# 10. Removing and returning an item
removed_item = employee_data.pop("department")
print(f"Removed Department: {removed_item}")  # Output: Removed Department: HR
print(employee_data)
# Output: {'employee_id': 101, 'name': 'Alice Smith', 'salary': 65000, 'position': 'Manager', 'hire_date': '2020-05-01', 'benefits': ['Health Insurance', '401K']}
