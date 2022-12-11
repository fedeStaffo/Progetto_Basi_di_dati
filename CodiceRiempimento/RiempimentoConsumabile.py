# Riempimento consumabile
import random
import mysql.connector

mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    port='3308',
    database='progetto_ticket'
)

lista = ["Lampade", "Lame di taglio", "Feltri", "Frese", "Penne", "Fustelle", "Punzoni", "PC"]
prezzo = 0
mycursor = mydb.cursor()

for i in range(0, 20):
    categoria = str(random.choice(lista))
    if categoria == "Lampade": prezzo = 25
    if categoria == "Lame di taglio": prezzo = 100
    if categoria == "Feltri": prezzo = 15
    if categoria == "Frese": prezzo = 18
    if categoria == "Penne": prezzo = 20
    if categoria == "Fustelle": prezzo = 30
    if categoria == "Punzioni": prezzo = 40
    if categoria == "PC": prezzo = 300
    val = (categoria, prezzo)

    sql = "INSERT INTO consumabile (Categoria, Prezzo) " \
          "VALUES (%s, %s)"
    mycursor.execute(sql, val)

mydb.commit()
