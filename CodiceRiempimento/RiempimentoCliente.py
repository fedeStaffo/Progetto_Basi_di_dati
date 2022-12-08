# Riempimento cliente
import random
import mysql.connector
from barnum import gen_data

p_iva = []
nome = []
stato = []
saldo = []

saldo_app = ['+', '-']
countries = [
    'USA',
    'Albania',
    'Algeria',
    'Andorra',
    'Argentina',
    'Australia',
    'Austria',
    'Belgium',
    'Brazil',
    'Bulgaria',
    'Burundi',
    'Canada',
    'Chad',
    'China',
    'Colombia',
    'Croatia',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Egypt',
    'Estonia',
    'Finland',
    'France',
    'Germany',
    'Greece',
    'Hong Kong',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Ireland',
    'Israel',
    'Italy',
    'Japan',
    'South Korea',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Malta',
    'Mexico',
    'Morocco',
    'Netherlands',
    'New Zealand',
    'Norway',
    'Peru',
    'Poland',
    'Portugal',
    'Romania',
    'San Marino',
    'Saudi Arabia',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'South Africa',
    'Spain',
    'Sweden',
    'Switzerland',
    'Taiwan',
    'Turkey',
    'UAE',
    'United Kingdom',
    'Uruguay',
    'Vatican City',
]

mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    port='3308',
    database='progetto_ticket'
)

for i in range(50):
    p_iva.append(str(random.randrange(10000000000, 99999999999)))
    nome.append(str(gen_data.create_company_name()))
    stato.append(str(random.choice(countries)))
    saldo.append(random.choice(saldo_app))


mycursor = mydb.cursor()

for i in range(0, 50):
    val = (p_iva[i], nome[i], stato[i], saldo[i])

    sql = "INSERT INTO cliente (Partita_IVA, Nome, Stato, Saldo) " \
          "VALUES (%s, %s, %s, %s)"
    mycursor.execute(sql, val)

mydb.commit()
