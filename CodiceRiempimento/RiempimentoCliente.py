#Riempimento database
import random
import datetime
import mysql.connector
import faker
import radar
from barnum import gen_data

p_iva=[]
nome=[]
stato=[]
citta=[]
saldo=[]

saldo_app = ['+', '-']
'''countries = [
    ('US', 'United States'),
    ('AL', 'Albania'),
    ('DZ', 'Algeria'),
    ('AD', 'Andorra'),
    ('AR', 'Argentina'),
    ('AU', 'Australia'),
    ('AT', 'Austria'),
    ('BE', 'Belgium'),
    ('BR', 'Brazil'),
    ('BG', 'Bulgaria'),
    ('BI', 'Burundi'),
    ('CA', 'Canada'),
    ('TD', 'Chad'),
    ('CN', 'China'),
    ('CO', 'Colombia'),
    ('HR', 'Croatia'),
    ('CY', 'Cyprus'),
    ('CZ', 'Czech Republic'),
    ('DK', 'Denmark'),
    ('EG', 'Egypt'),
    ('EE', 'Estonia'),
    ('FI', 'Finland'),
    ('FR', 'France'),
    ('DE', 'Germany'),
    ('GR', 'Greece'),
    ('HK', 'Hong Kong'),
    ('HU', 'Hungary'),
    ('IS', 'Iceland'),
    ('IN', 'India'),
    ('ID', 'Indonesia'),
    ('IE', 'Ireland'),
    ('IL', 'Israel'),
    ('IT', 'Italy'),
    ('JP', 'Japan'),
    ('KR', 'Korea (South)'),
    ('LI', 'Liechtenstein'),
    ('LT', 'Lithuania'),
    ('LU', 'Luxembourg'),
    ('MT', 'Malta'),
    ('MX', 'Mexico'),
    ('MA', 'Morocco'),
    ('NL', 'Netherlands'),
    ('NZ', 'New Zealand'),
    ('NO', 'Norway'),
    ('PE', 'Peru'),
    ('PL', 'Poland'),
    ('PT', 'Portugal'),
    ('RO', 'Romania'),
    ('SM', 'San Marino'),
    ('SA', 'Saudi Arabia'),
    ('SG', 'Singapore'),
    ('SK', 'Slovakia'),
    ('SI', 'Slovenia'),
    ('ZA', 'South Africa'),
    ('ES', 'Spain'),
    ('SE', 'Sweden'),
    ('CH', 'Switzerland'),
    ('TW', 'Taiwan'),
    ('TR', 'Turkey'),
    ('AE', 'United Arab Emirates'),
    ('UK', 'United Kingdom'),
    ('UY', 'Uruguay'),
    ('VA', 'Vatican City State'),
] '''



mydb = mysql.connector.connect(
    host= 'localhost',
    user= 'root',
    port='3308',
    database= 'progetto_ticket'
)
   # random_country = random.choice(countries)
for i in range(50):
    citta_app = gen_data.create_city_state_zip()

    p_iva.append(str(random.randrange(10000000000, 99999999999)))
    nome.append(str(gen_data.create_company_name()))
    stato.append(str(citta_app[2]))
    citta.append(str(citta_app[1]))
    saldo.append(random.choice(saldo_app))
    #stato.append(str(random_country[1]))
    #citta.append(str(citta_app[1]))

mycursor = mydb.cursor()

for i in range(0,50):
    val = (p_iva[i], nome[i], stato[i], citta[i], saldo[i])

    #sql = "INSERT INTO cliente (PartitaIVA, Nome, Stato, Citta, Saldo) "
    #\ 'VALUES (%s, %s, %s, %s, %s)'
    sql = "INSERT INTO cliente (Partita_IVA, Nome, Stato, Città, Saldo) " \
          "VALUES (%s, %s, %s, %s, %s)"
    mycursor.execute(sql, val)

mydb.commit()
