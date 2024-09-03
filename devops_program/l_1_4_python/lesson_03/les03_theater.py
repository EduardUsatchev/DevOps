import json


def load_database(filename):
    try:
        with open(filename, 'r') as file:
            return json.load(file)
    except FileNotFoundError:
        return []


def save_database(database, filename):
    with open(filename, 'w') as file:
        json.dump(database, file, indent=4)


def add_movie(database):
    title = input("Enter movie title: ")
    director = input("Enter movie director: ")
    year = input("Enter release year: ")
    genre = input("Enter movie genre: ")
    movie = {"title": title, "director": director, "year": year, "genre": genre}
    database.append(movie)
    print("Movie added successfully.")


def list_movies(database):
    if not database:
        print("No movies in the database.")
    else:
        for idx, movie in enumerate(database, start=1):
            print(f"{idx}. {movie['title']} ({movie['year']}) - Directed by {movie['director']}")


def search_movie(database, title):
    found = False
    for movie in database:
        if movie["title"].lower() == title.lower():
            print("Movie found:")
            print(f"Title: {movie['title']}")
            print(f"Director: {movie['director']}")
            print(f"Year: {movie['year']}")
            print(f"Genre: {movie['genre']}")
            found = True
            break
    if not found:
        print("Movie not found.")


def update_movie(database, title):
    for movie in database:
        if movie["title"].lower() == title.lower():
            print("Enter new details (leave blank to keep existing):")
            movie["title"] = input(f"Enter new title ({movie['title']}): ") or movie["title"]
            movie["director"] = input(f"Enter new director ({movie['director']}): ") or movie["director"]
            movie["year"] = input(f"Enter new release year ({movie['year']}): ") or movie["year"]
            movie["genre"] = input(f"Enter new genre ({movie['genre']}): ") or movie["genre"]
            print("Movie details updated successfully.")
            break
    else:
        print("Movie not found.")


def delete_movie(database, title):
    for movie in database:
        if movie["title"].lower() == title.lower():
            database.remove(movie)
            print("Movie deleted successfully.")
            break
    else:
        print("Movie not found.")


def main():
    filename = "../../working_files/movies.json"
    database = load_database(filename)

    while True:
        print("\nMovie Database Management System")
        print("1. Add a movie")
        print("2. List all movies")
        print("3. Search for a movie")
        print("4. Update a movie")
        print("5. Delete a movie")
        print("6. Save database to file")
        print("7. Load database from file")
        print("8. Quit")

        choice = input("Enter your choice: ")

        if choice == "1":
            add_movie(database)
        elif choice == "2":
            list_movies(database)
        elif choice == "3":
            title = input("Enter movie title to search: ")
            search_movie(database, title)
        elif choice == "4":
            title = input("Enter movie title to update: ")
            update_movie(database, title)
        elif choice == "5":
            title = input("Enter movie title to delete: ")
            delete_movie(database, title)
        elif choice == "6":
            save_database(database, filename)
            print("Database saved to file:", filename)
        elif choice == "7":
            database = load_database(filename)
            print("Database loaded from file:", filename)
        elif choice == "8":
            print("Exiting...")
            break
        else:
            print("Invalid choice. Please try again.")


if __name__ == "__main__":
    main()
