def get_student_grades(num_students):
    student_grades = {}
    for i in range(num_students):
        name = input("Enter student's name: ")
        math_grade = float(input(f"Enter math grade for {name}: "))
        science_grade = float(input(f"Enter science grade for {name}: "))
        english_grade = float(input(f"Enter english grade for {name}: "))

        # Store grades in a dictionary
        student_grades[name] = [math_grade, science_grade, english_grade]
    return student_grades


def calculate_average_grades(student_grades):
    averages = {}
    for name, grades in student_grades.items():
        average = sum(grades) / len(grades)
        averages[name] = average
    return averages


def save_student_grades(student_grades):
    with open("../../working_files/student_grades.txt", "w") as file:
        for name, grades in student_grades.items():
            file.write("{}: {}\n".format(name, grades))


try:
    num_students = int(input("Enter the number of students: "))
    if num_students <= 0:
        raise ValueError("Number of students must be greater than 0.")

    student_grades = get_student_grades(num_students)

    print("\nAverage Grades:")
    average_grades = calculate_average_grades(student_grades)
    for name, avg_grade in average_grades.items():
        print("{}: {:.2f}".format(name, avg_grade))

    save_student_grades(student_grades)
    print("Student grades saved to 'student_grades.txt'")

except ValueError as ve:
    print("Error:", ve)
except Exception as e:
    print("An error occurred:", e)
