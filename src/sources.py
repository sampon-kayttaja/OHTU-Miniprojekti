import db_helper

def insert_book(author, title, year, publisher):

    db_helper.execute(
        "INSERT INTO books (author, title, year, publisher) VALUES (?, ?, ?, ?)",
        (author, title, year, publisher),
    )