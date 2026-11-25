import os
import sqlite3
from contextlib import closing
from pathlib import Path

from flask import current_app, g, has_app_context

def get_connection():
    database_url = os.environ.get("DATABASE_URL", "sqlite:///data/database.db")
    if has_app_context():
        database_url = current_app.config.get("DATABASE_URL", database_url)

    path = Path(database_url.removeprefix("sqlite:///"))
    path.parent.mkdir(parents=True, exist_ok=True)
    con = sqlite3.connect(path)
    con.execute("PRAGMA foreign_keys = ON")
    con.row_factory = sqlite3.Row
    return con

def init_database():
    schema_path = Path(__file__).with_name("schema.sql")
    with closing(get_connection()) as con:
        con.execute("PRAGMA foreign_keys = OFF")
        tables = con.execute(
            "SELECT name FROM sqlite_master "
            "WHERE type = 'table' AND name NOT LIKE 'sqlite_%'"
        ).fetchall()
        for table in tables:
            table_name = table["name"].replace('"', '""')
            con.execute(f'DROP TABLE "{table_name}"')
        con.executescript(schema_path.read_text(encoding="utf-8"))
        con.commit()

def execute(sql, params=()):
    with closing(get_connection()) as con:
        result = con.execute(sql, params)
        con.commit()
        g.last_insert_id = result.lastrowid

def query(sql, params=()):
    with closing(get_connection()) as con:
        return con.execute(sql, params).fetchall()

if __name__ == "__main__":
    init_database()
