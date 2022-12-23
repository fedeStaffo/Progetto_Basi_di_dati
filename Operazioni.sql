/*OPERAZIONE 1 */
INSERT INTO `cliente` (`Partita_IVA`, `Nome`, `Stato`, `Saldo`) VALUES (...);
/* Per ogni telefono posseduto dal cliente */
INSERT INTO `telcliente` (`NumCliente`, `Telefono`) VALUES (...);
/*Per ogni email posseduta dal cliente */
INSERT INTO `emailcliente` (`NumCliente`, `Email`) VALUES (...);


/*OPERAZIONE 2 */
/* Nel campo IDTecnico non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment */
INSERT INTO `datilavorativi` (`Resident`, `CF`) VALUES (<resident>, <cod_fisc>);
/* Inserimento dei dati anagrafici del tecnico */
INSERT INTO `datianagrafici` (`CodiceFiscale`, `Nome`, `Cognome`, `Sesso`, `DataNascita`) VALUES (...);
/* Per ogni telefono posseduto dal tecnico */
INSERT INTO `teltecnico` (`NumTecnico`, `Telefono`) VALUES (...);
/*Per ogni email posseduta dal tecnico */
INSERT INTO `emailtecnico` (`NumTecnico`, `Email`) VALUES (...);
/* Per ogni tecnico si inseriscono i macchinari a cui è specializzato */
INSERT INTO `specializzazione` (`Macchina`, `Tecnico`) VALUES (...);


/* OPERAZIONE 3 */
/* Nel campo IDMacchinario non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment */
INSERT INTO `macchinario` (`Categoria`) VALUES (<cat>);

/* OPERAZIONE 4 */
/* Nel campo IDTicket non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment 
Inoltre anche gli attributi costo, chiusura, lingua, priorità e oreImpiegate verranno inizializzati a null in quanto si inseriranno in seguito a dei controlli o alla chiusura.
Invece per quanto riguarda il campo Apertura, si inserisce current_date in quanto l'inserimento di un ticket coincide col momento dell'apertura.
Verrà mostrato inoltre il relativo numero di ticket per poter richiedere assistenza per uno specifico macchinario o consumabile*/
INSERT INTO `ticket` (`Causale`, `Priorita`, `Lingua`, `Costo`, `Apertura`, `Chiusura`, `OreImpiegate`, `Cliente`) VALUES ('Consumabili', null, null, null, current_date, null, null, 10128395405);

Select IDTicket
FROM ticket 
WHERE IDTicket >= all ( SELECT IDTicket
                       FROM ticket);
         /**/              
UPDATE ticket, cliente
SET ticket.Lingua = 'Italiano'
WHERE ticket.Cliente = cliente.Partita_IVA 
      AND cliente.Stato = 'Italy' 
      AND ticket.IDTicket >= all ( SELECT IDTicket FROM ticket); 
      
UPDATE ticket, cliente
SET ticket.Lingua = 'Inglese'
WHERE ticket.Cliente = cliente.Partita_IVA 
      AND cliente.Stato <> 'Italy' 
      AND ticket.IDTicket >= all ( SELECT IDTicket FROM ticket);

/* OPERAZIONE 5 */
/* Il cliente ha a disposizione il sito per vedere quali consumabili sono disponibii. si limiterà pertanto ad inserire l'id del consumabile scelto */
INSERT INTO `assistenzacons` (`Ticket`, `Cons`) VALUES (<id_ticket>, <id_consumabile>);

UPDATE ticket, cliente
SET Priorita = 'Alta'
WHERE ticket.IDTicket = <id_ticket> and ticket.Cliente = cliente.Partita_IVA and cliente.Saldo = '+';

UPDATE ticket, cliente
SET Priorita = 'Bloccata'
WHERE ticket.IDTicket = <id_ticket> and ticket.Cliente = cliente.Partita_IVA and cliente.Saldo = '-';

UPDATE ticket
SET Chiusura = ticket.Apertura, OreImpiegate = 0
WHERE ticket.Priorita = 'Alta' and ticket.IDTicket = <id_ticket>;

UPDATE ticket
SET Costo = 0
WHERE ticket.Priorita = 'Alta' and ticket.IDTicket = <id_ticket>;

UPDATE ticket
SET Costo = (select sum(consumabile.Prezzo)
             from assistenzacons join consumabile on assistenzacons.Cons = consumabile.IDConsumabile
             where assistenzacons.Ticket = <id_ticket>)
WHERE ticket.Priorita = 'Alta' and ticket.IDTicket = <id_ticket>;

DELETE P FROM assistenzacons as P, ticket WHERE ticket.Priorita = 'Bloccata' and P.Ticket = <id_ticket>;

/* OPERAZIONE 5.1 */
/* Il campo NumOre verrà utilizzato per indicare il numero di ore del singolo tecnico e verrà inizialmente impostato come valore nullo.
Il campo Tecnico verrà inizialmente inpostato a null perchè dipenderà dal tipo di macchina su cui i tecnici andranno a lavorare */
INSERT INTO `assistenzamacc` (`Ticket`, `Macchina`, `Tecnico`, `NumOre`) VALUES (17, 55, 0, null);

UPDATE ticket
SET Priorita = 'Bassa'
WHERE ticket.IDTicket = 17;

UPDATE ticket, contratto
set Priorita = 'Media'
Where ticket.IDTicket = 17 AND
      ticket.Cliente = contratto.Cliente;
      
UPDATE ticket, assistenzamacc, garanzia
set Priorita = 'Alta'
Where ticket.IDTicket = assistenzamacc.Ticket AND
      assistenzamacc.Macchina = garanzia.Macc AND
      ticket.IDTicket = 17 AND
      garanzia.Scadenza >= CURRENT_DATE;
      
UPDATE ticket, cliente
SET Priorita = 'Bloccata'
WHERE ticket.IDTicket = 17 and ticket.Cliente = cliente.Partita_IVA and cliente.Saldo = '-';

UPDATE assistenzamacc
SET assistenzamacc.Tecnico = (SELECT datilavorativi.IDTecnico
                              FROM datilavorativi JOIN assistenzamacc 
                                   on datilavorativi.IDTecnico = assistenzamacc.Tecnico 
                                   JOIN specializzazione 
                                   on datilavorativi.IDTecnico =  specializzazione.Tecnico 
                                   JOIN macchinario 
                                   on assistenzamacc.Macchina = macchinario.IDMacchinario 
                                   WHERE specializzazione.Macchina = ass
                              WHERE specializzazione.Macchina = macchinario.Categoria AND min(SELECT Count(assistenzamacc.Tecnico)
                                                                                              FROM assistenzamacc, datilavorativi
                                                                                              WHERE assistenzamacc.Tecnico = datilavorativi.tecnico and datilavorativi.Resident = 'si'))
WHERE ticket.IDTicket = 17;
      
      
/* OPERAZIONE 6 */
/* Nel campo IDGaranzia non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment
Il campo DataInstallazione viene settato come current_date in quanto all'installazione del macchinario coincide l'inizio della garanzia
Il campo Scadenza invece coincide con la data di installazione traslata di un anno. */
INSERT INTO `garanzia` (`IDGaranzia`, `DataInstallazione`, `LuogoInstallazione`, `Scadenza`, `Macc`) VALUES (null, current_date, <luogo>, null, <id_macchina>)
UPDATE garanzia SET Scadenza = (SELECT DATE(DATE_ADD(DataInstallazione, INTERVAL 1 YEAR)) FROM garanzia WHERE Macc = <id_macchina>) WHERE Macc = <id_macchina>;

/* OPERAZIONE 7 */
INSERT INTO `acquistomacc` (`Cliente`, `Macchinario`) VALUES (...);

/* OPERAZIONE 8 */
/* Nel campo IDContratto non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment
Il campo DataInizio viene settato come current_date in quanto l'inserimento di un nuovo contratto coincide con l'inizio di validità del contratto
Il campo DataFine invece coincide con la data di inizio traslata di tre anni.  */
INSERT INTO `contratto` (`IDContratto`, `DataInizio`, `DataFine`, `Canone`, `Banca`, `Cliente`) VALUES (null, current_date, null, <canone>, <banca>, <Partita_IVA>);
UPDATE contratto SET DataFine = (SELECT DATE(DATE_ADD(DataInizio, INTERVAL 3 YEAR)) FROM contratto WHERE Cliente = <Partita_IVA>) WHERE Cliente = <Partita_IVA>;

/* OPERAZIONE 9 */
/* Nel campo IDConsumabile non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment */
INSERT INTO `consumabile` (`IDConsumabile`, `Categoria`, `Prezzo`) VALUES (null, <cat>, <prezzo>);

/* OPERAZIONE 10 */
INSERT INTO `assistenzamacc` (`Ticket`, `Macchina`, `Tecnico`, `NumOre`) VALUES (<id_ticket>, <id_macchina>, <id_tecnico>, null);

/* OPERAZIONE 11 */
/*Se si vuole cambiare il saldo  di un cliente da positivo a negativo */
UPDATE cliente 
set Saldo = '-' 
where Partita_IVA = <p_IVA>;
/*Se si vuole cambiare il saldo di un cliente da negativo a positivo */
UPDATE cliente 
set Saldo = '+' 
where Partita_IVA = <p_IVA>;

/* OPERAZIONE 12 */
/* Se un tecnico passa da resident a non resident */
UPDATE datilavorativi 
set Resident = 'No' 
where IDTecnico = <id_tecnico>;
/* Se un tecnico passa da non resident a resident */
UPDATE datilavorativi 
set Resident = 'Si' 
where IDTecnico = <id_tecnico>;

/* OPERAZIONE 13 */
/* Se un tecnicO sbaglia a mettere la categoria di un macchinario*/
UPDATE macchinario 
set Categoria = <cat> 
where IDMacchinario = <id_macchina>;

/* OPERAZIONE 14 */
/* La causale dei ticket riguardante i consumabili non può essere cambiata. */
UPDATE ticket 
set Causale = <causale> 
where IDTicket = <id_ticket> and Causale <> 'Consumabili' AND <causale> <> 'Consumabili';

/* OPERAZIONE 15 */
UPDATE consumabile 
set Prezzo = <prezzo> 
where consumabile.categoria = 'categoria';

/* OPERAZIONE 16 */
UPDATE assistenzamacc
SET NumOre = <num_ore>
WHERE Ticket = <id_ticket> and Tecnico = <id_tecnico>;
/* Mostra tutti i tecnici del ticket per vedere a quali serve aggiungere l'orario prima di fare la chiusura */
SELECT Ticket, Tecnico, NumOre
FROM assistenzamacc
WHERE Ticket = <id_ticket>;

/* OPERAZIONE 17 */
DELETE FROM telcliente WHERE NumCliente = <p_IVA>;
DELETE FROM emailcliente WHERE NumCliente = <p_IVA>;
DELETE FROM cliente WHERE Partita_IVA = <p_IVA>;

/* OPERAZIONE 18 */
DELETE FROM numtecnico WHERE NumTecnico = <id_tecnico>;
DELETE FROM emailtecnico WHERE NumTecnico = <id_tecnico>;
DELETE FROM datilavorativi WHERE CF = <cod_fisc>;
DELETE FROM datianagrafici WHERE CodiceFiscale = <cod_fisc>;

/* OPERAZIONE 19 */
/* Cancella un macchinario che non è stato ancora venduto */
DELETE macc 
FROM macchinario macc LEFT JOIN acquistomacc a ON macc.IDMacchinario = a.Macchinario 
WHERE macc.IDMacchinario = <id_macchinario> AND a.Macchinario IS NULL;

/* OPERAZIONE 20 */
/* Cancella un consumabile che non è stato ancora venduto */
DELETE C
FROM consumabile C LEFT JOIN assistenzacons A on C.IDConsumabile = A.Cons
WHERE C.IDConsumabile = 10 and A.Cons is null;

/* OPERAZIONE 21 */
CREATE VIEW Ore_Ticket_Resident (ID_Ticket, Ore) AS
SELECT Ticket, SUM(NumOre) FROM assistenzamacc
JOIN datilavorativi ON assistenzamacc.Tecnico = datilavorativi.IDTecnico
WHERE datilavorativi.Resident = 'si'
GROUP BY Ticket;

CREATE VIEW Ore_Ticket_Non_Resident (ID_Ticket, Ore) AS
SELECT Ticket, SUM(NumOre) FROM assistenzamacc
JOIN datilavorativi ON assistenzamacc.Tecnico = datilavorativi.IDTecnico
WHERE datilavorativi.Resident = 'no'
GROUP BY Ticket;

UPDATE ticket set Chiusura = CURRENT_DATE WHERE IDTicket = <id_tecnico>;

UPDATE ticket set Costo = 
CASE 
WHEN (SELECT ID_Ticket FROM ore_ticket_non_resident WHERE ID_Ticket = <id_tecnico>) IS NULL
THEN (SELECT SUM(Ore) FROM ore_ticket_resident WHERE ID_Ticket = <id_tecnico>) *15
ELSE
(SELECT SUM(Ore) FROM ore_ticket_resident WHERE ID_Ticket = <id_tecnico>) *15 + (SELECT SUM(Ore) FROM ore_ticket_non_resident WHERE ID_Ticket = <id_tecnico>) * 20
END
WHERE IDTicket = <id_tecnico>;

UPDATE ticket set OreImpiegate = 
CASE 
WHEN (SELECT ID_Ticket FROM ore_ticket_non_resident WHERE ID_Ticket = <id_tecnico>) IS NULL
THEN (SELECT SUM(Ore) FROM ore_ticket_resident WHERE ID_Ticket = <id_tecnico>)
ELSE
(SELECT SUM(Ore) FROM ore_ticket_resident WHERE ID_Ticket = <id_tecnico>) + (SELECT SUM(Ore) FROM ore_ticket_non_resident WHERE ID_Ticket = <id_tecnico>)
END
WHERE IDTicket = <id_tecnico>;

UPDATE ticket SET Costo = CASE WHEN (Priorita = 'Alta' OR Priorita = 'Media') THEN Costo = 0 END WHERE IDTicket = <id_tecnico>;

/* OPERAZIONE 22 */
SELECT * 
FROM ticket 
WHERE Chiusura IS NULL;

/* OPERAZIONE 23 */
SELECT * 
FROM ticket 
WHERE Chiusura IS NOT NULL;

/* OPERAZIONE 24 */
SELECT * 
FROM ticket 
WHERE Priorita = 'Bloccata';

/* OPERAZIONE 25 */
SELECT ticket.IDTicket, ticket.Causale, macchinario.IDMacchinario,macchinario.Categoria 
FROM ticket 
JOIN assistenzamacc ON assistenzamacc.Ticket = ticket.IDTicket 
JOIN macchinario ON macchinario.IDMacchinario = assistenzamacc.Macchina 
WHERE assistenzamacc.Macchina = <id_macchina>;

/* OPERAZIONE 26 */
SELECT Partita_IVA, Nome, Stato 
FROM Cliente 
WHERE Stato != 'Italy' 
ORDER BY Stato, Nome;

/* OPERAZIONE 27 */
SELECT Partita_IVA, Nome, Stato 
FROM Cliente 
WHERE Stato = 'Italy' 
ORDER BY Nome;

/* OPERAZIONE 28 */
SELECT cliente.Partita_IVA, cliente.Nome, contratto.IDContratto 
FROM cliente 
JOIN contratto ON contratto.Cliente = cliente.Partita_IVA 
ORDER BY Partita_IVA;

/* OPERAZIONE 29 */
SELECT * 
FROM macchinario JOIN garanzia ON macchinario.Gar = garanzia.IDGaranzia 
WHERE garanzia.Scadenza > CURRENT_DATE;

/* OPERAZIONE 30 */
SELECT Partita_IVA, Nome 
FROM cliente 
WHERE Saldo = '-';

/* OPERAZIONE 31 */
SELECT macchinario.IDMacchinario, macchinario.Categoria, garanzia.DataInstallazione, garanzia.LuogoInstallazione 
FROM macchinario 
JOIN garanzia ON macchinario.Gar = garanzia.IDGaranzia 
WHERE garanzia.DataInstallazione > '<data_scelta>';

/* OPERAZIONE 32 */
/*Se si vogliono ricercare le macchine di un cliente utilizzando la partita iva come chiave di ricerca */
SELECT cliente.Partita_IVA, cliente.Nome, macchinario.IDMacchinario, macchinario.Categoria 
FROM cliente 
JOIN acquistomacc ON acquistomacc.Cliente = cliente.Partita_IVA 
JOIN macchinario ON acquistomacc.Macchinario = macchinario.IDMacchinario 
WHERE cliente.Partita_IVA = '<partita_iva>';
/*Se si vogliono ricercare le macchine di un cliente utilizzando il nome del cliente come chiave di ricerca */
SELECT cliente.Partita_IVA, cliente.Nome, macchinario.IDMacchinario, macchinario.Categoria 
FROM cliente 
JOIN acquistomacc ON acquistomacc.Cliente = cliente.Partita_IVA 
JOIN macchinario ON acquistomacc.Macchinario = macchinario.IDMacchinario 
WHERE cliente.Nome = '<nome_cliente>';

/* OPERAZIONE 33 */
/*Se si vogliono ricercare i ticket di un cliente utilizzando la partita iva come chiave di ricerca */
SELECT ticket.*, cliente.Nome 
FROM ticket 
JOIN cliente ON ticket.Cliente = cliente.Partita_IVA 
WHERE cliente.Partita_IVA = '<partita_iva>';
/*Se si vogliono ricercare i ticket di un cliente utilizzando il nome del cliente come chiave di ricerca */
SELECT ticket.*, cliente.Nome 
FROM ticket 
JOIN cliente ON ticket.Cliente = cliente.Partita_IVA 
WHERE cliente.Partita_IVA = '<nome_cliente>';

/* OPERAZIONE 34 */
SELECT IDTicket, Causale, DATEDIFF(Chiusura, Apertura) as Durata 
FROM ticket 
WHERE Chiusura IS NOT null;

/* OPERAZIONE 35 */
SELECT Causale, COUNT(Causale) AS Frequenza 
FROM ticket 
GROUP BY Causale;

/* OPERAZIONE 36 */
SELECT DISTINCT (SELECT COUNT(*) FROM ticket WHERE Chiusura IS null) as 'Ticket aperti', (SELECT COUNT(*) FROM ticket WHERE Chiusura IS NOT null) as 'Ticket chiusi', (SELECT COUNT(*) FROM ticket WHERE Chiusura IS null)/(SELECT COUNT(*) FROM ticket WHERE Chiusura IS NOT null) as 'Rapporto' 
FROM ticket;

/* OPERAZIONE 37 */
SELECT Macchinario.Categoria, COUNT(acquistomacc.Macchinario) AS TotaleAcquisti 
FROM Macchinario 
JOIN acquistomacc 
ON Macchinario.IDMacchinario = acquistomacc.Macchinario 
GROUP BY Macchinario.Categoria;

/* OPERAZIONE 38 */
SELECT consumabile.Categoria, COUNT(assistenzacons.Cons) as TotaleConsumabili
FROM consumabile JOIN assistenzacons
ON consumabile.IDConsumabile = assistenzacons.Cons
GROUP BY consumabile.Categoria;

/* OPERAZIONE 39 */
SELECT macchinario.*, COUNT(assistenzamacc.Macchina) as Guasti
FROM macchinario JOIN assistenzamacc
ON macchinario.IDMacchinario = assistenzamacc.Macchina
GROUP BY IDMacchinario;

/* OPERAZIONE 40 */
SELECT AVG(ticket.Costo) AS Costo_Medio 
FROM ticket;

/* OPERAZIONE 41 */
SELECT AVG(contratto.Canone) AS Canone_Medio 
FROM contratto;

/* OPERAZIONE 42 */
SELECT MAX(Canone) AS Canone_Massimo, MIN(Canone) AS Canone_Minimo 
FROM contratto;

/* OPERAZIONE 43 */
SELECT Stato, COUNT(Partita_IVA) 
FROM Cliente 
GROUP BY Stato;

/* OPERAZIONE 44 */
SELECT ticket.Cliente, COUNT(ticket.IDTicket) 
FROM ticket 
GROUP BY ticket.Cliente;

/* OPERAZIONE 45 */
SELECT SUM(CASE WHEN cliente.Saldo = '+' THEN 1 ELSE 0 END) AS Clienti_Solventi, 
SUM(CASE WHEN cliente.Saldo = '-' THEN 1 ELSE 0 END) AS Clienti_Insolventi 
FROM cliente;

/* OPERAZIONE 46 */
SELECT Priorita, COUNT(IDTicket) AS Numero_Ticket FROM ticket GROUP BY Priorita;

/* OPERAZIONE 47 */
SELECT DISTINCT A1.Ticket, A1.Macchina, A1.Tecnico, A2.Tecnico
FROM assistenzamacc as A1, assistenzamacc as A2 
WHERE A1.Ticket = A2.Ticket and A1.Tecnico <> A2.Tecnico

/* OPERAZIONE 48 */
SELECT DISTINCT Tecnico, Stato, assistenzamacc.Ticket
FROM datilavorativi JOIN assistenzamacc on datilavorativi.IDTecnico = assistenzamacc.Tecnico
     JOIN acquistomacc on assistenzamacc.Macchina = acquistomacc.Macchinario
     JOIN cliente on acquistomacc.Cliente = cliente.Partita_IVA
WHERE Resident = 'no' and
	  cliente.Stato <> 'Italy' 
Order by assistenzamacc.Tecnico

/* OPERAZIONE 49 */
SELECT Nome, Cognome, IDTecnico, NumOre
FROM assistenzamacc JOIN datilavorativi on assistenzamacc.Tecnico = datilavorativi.IDTecnico
     JOIN datianagrafici on datilavorativi.CF = datianagrafici.CodiceFiscale
WHERE NumOre >= all (SELECT NumOre
                     FROM assistenzamacc)

/* OPERAZIONE 50 */
SELECT * 
FROM `garanzia` 
WHERE Scadenza >= '<data_scadenza>'

/* OPERAZIONE 51 */
/* Se si vogliono ricercare le email di un cliente utilizzando la partita iva come chiave di ricerca */
SELECT Partita_IVA, Nome, Email
FROM cliente JOIN emailcliente on cliente.Partita_IVA = emailcliente.NumCliente
WHERE cliente.Partita_IVA = '<partita_iva>'
ORDER BY Partita_IVA
/* Se si vogliono ricercare le email di un cliente utilizzando il nome del cliente come chiave di ricerca */
SELECT Partita_IVA, Nome, Email
FROM cliente JOIN emailcliente on cliente.Partita_IVA = emailcliente.NumCliente
WHERE cliente.Partita_IVA = '<nome_cliente>'
ORDER BY Partita_IVA

/* OPERAZIONE 52 */
/* Se si vogliono ricercare i numeri di telefono di un cliente utilizzando la partita iva come chiave di ricerca */
SELECT Partita_IVA, Nome, Telefono 
FROM cliente JOIN telcliente on cliente.Partita_IVA = telcliente.NumCliente
WHERE cliente.Partita_IVA = '<partita_iva>'
ORDER BY Partita_IVA
/* Se si vogliono ricercare i numeri di telefono di un cliente utilizzando il nome del cliente come chiave di ricerca */
SELECT Partita_IVA, Nome, Telefono 
FROM cliente JOIN telcliente on cliente.Partita_IVA = telcliente.NumCliente
WHERE cliente.Partita_IVA = '<nome_cliente>'
ORDER BY Partita_IVA

/* OPERAZIONE 53 */
/* Se si vogliono ricercare le email di un tecnico utilizzando il codice id del tecnico come chiave di ricerca */
SELECT IDTecnico, Nome, Cognome, Email
FROM datilavorativi JOIN emailtecnico on datilavorativi.IDTecnico = emailtecnico.NumTecnico 
     JOIN datianagrafici on datilavorativi.CF = datianagrafici.CodiceFiscale
WHERE IDTecnico = '<id_tecnico>';
ORDER BY IDTecnico

/* OPERAZIONE 54 */
/* Se si vogliono ricercare i numeri di telefono di un tecnico utilizzando il codice id del tecnico come chiave di ricerca */
SELECT IDTecnico, Nome, Cognome, Telefono
FROM datilavorativi JOIN teltecnico on datilavorativi.IDTecnico = teltecnico.NumTecnico
     JOIN datianagrafici on datilavorativi.CF = datianagrafici.CodiceFiscale
WHERE IDTecnico = '<id_tecnico>'
ORDER BY IDTecnico

/* OPERAZIONE 55 */
SELECT IDTecnico, Nome, Cognome, DataNascita, Sesso, CF, Resident  
FROM datilavorativi, datianagrafici
WHERE datilavorativi.CF = datianagrafici.CodiceFiscale
GROUP BY IDTecnico

/* OPERAZIONE 56 */
SELECT *
FROM `specializzazione` 
WHERE Tecnico = <id_tecnico>;