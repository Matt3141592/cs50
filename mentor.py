import csv
from cs50 import SQL

open("mentor.db", "w").close()
db = SQL("sqlite:///mentor.db")
db.execute("CREATE TABLE mentor (all TEXT, reacted TEXT)")

with open("Mentors - Sheet1-3.csv", "r") as file:
    reader = csv.DictReader(file)
    for row in reader:
        all = row["all"]
        db.execute("INSERT into mentor (all) VALUES(?)", all)