
class NegativeAgeError(Exception):
    """Exception raised for negative user age."""

    def __init__(self, age, message="Age cannot be negative"):
        self.age = age
        self.message = message
        super().__init__(self.message)

    def __str__(self):
        return f"{self.message}: {self.age}"

def get_user_age():
    try:
        user_age = int(input("enter age"))
    except BaseException:
        print("balbla")
    if user_age < 0:
        raise NegativeAgeError("")
    return user_age

