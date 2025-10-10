details = ["eduard", "usatchev", 34, True]
details_dict = {"fname": "eduard",
                "lname": "usatchev",
                "age": 34,
                "is_married": True}
my_class = [
    {"fname": "or", "lname": "shemesh"},
    {"fname": "maksim", "lname": "hamaksim"},
]

for student in my_class:
    print(student["fname"] + student["lname"])
print(details_dict.keys())
print(details_dict.values())
