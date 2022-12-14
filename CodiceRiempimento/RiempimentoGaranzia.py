import random
from barnum import gen_data
import faker
import datetime
import mysql.connector

data_installazione = []
luogo_installazione = []

mydb = mysql.connector.connect(
    host= 'localhost',
    user= 'root',
    port='3308',
    database= 'progetto_ticket'
)

for i in range(25):
    data_appoggio = gen_data.create_date(past=True)
    citta_app = gen_data.create_city_state_zip()

    data_installazione.append(data_appoggio)
    luogo_installazione.append(str(citta_app[1]))

mycursor = mydb.cursor()

for i in range (0, 25):
    val = (data_installazione[i], luogo_installazione[i])

    sql = "INSERT INTO garanzia (DataInstallazione, LuogoInstallazione) " \
          "VALUES (%s, %s)"
    mycursor.execute(sql, val)

mydb.commit()
