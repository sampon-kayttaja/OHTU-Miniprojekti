from flask import Flask, render_template, redirect

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/new_book")
def new_book():
    return render_template("")

@app.route("/send_book")
def send_book():
    return redirect("/")

@app.route("/all_sources")
def all_sources():
    return render_template("")