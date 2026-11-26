import db_helper

def insert_book(author, title, year, publisher):

    db_helper.execute(
        "INSERT INTO books (author, title, year, publisher) VALUES (?, ?, ?, ?)",
        (author, title, year, publisher),
    )

def get_all_books():
    book_list = []
    books = db_helper.query("SELECT * FROM books")
    for book in books:
        book_list.append(
            {
                "author": book[1],
                "title": book[2],
                "year": book[3],
                "publisher": book[4],
            }
        )
    return book_list