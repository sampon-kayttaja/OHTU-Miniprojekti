from flask import Flask, render_template, redirect, request

from . import sources

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/new_book")
def new_book():
    return render_template("new_book.html")

@app.route("/send_book", methods=["POST"])
def send_book():
    author = request.form.get("author")
    title = request.form.get("title")
    year = request.form.get("year")
    publisher = request.form.get("publisher")

    sources.insert_book(author, title, year, publisher)

    return redirect("/")

@app.route("/all_sources")
def all_sources():
    return

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5001)