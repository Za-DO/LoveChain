from os import lseek
import sqlite3
import requests

conn = sqlite3.connect("land.db")

cur = conn.cursor()

conn.execute('CREATE TABLE land_data(id INTEGER, token TEXT)')

conn.commit()
conn.close()