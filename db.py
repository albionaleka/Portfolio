import mysql.connector

dataBase = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
)

cursor = dataBase.cursor()

cursor.execute("CREATE DATABASE IF NOT EXISTS portfolio_db")

print("ALL DONE!")