/*OPERAZIONE 1 */
INSERT INTO `cliente` (`Partita_IVA`, `Nome`, `Stato`, `Saldo`) VALUES (...);
/* Per ogni telefono posseduto dal cliente */
INSERT INTO `telcliente` (`NumCliente`, `Telefono`) VALUES (...);
/*Per ogni email posseduta dal cliente */
INSERT INTO `emailcliente` (`NumCliente`, `Email`) VALUES (...);


/*OPERAZIONE 2 */
/* Nel campo IDTecnico non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment */
INSERT INTO `datilavorativi` (`IDTecnico`, `Resident`, `CF`) VALUES (null, <resident>, <cod_fisc>);
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
INSERT INTO `macchinario` (`IDMacchinario`, `Categoria`) VALUES (null, <cat>);

/* OPERAZIONE 4 */
/* Nel campo IDTicket non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment 
Inoltre anche gli attributi costo, chiusura e oreImpiegate verranno inizializzati a null in quanto si inseriranno alla chiusura del ticket.
Invece per quanto riguarda il campo Apertura, si inserisce current_date in quanto l'inserimento di un ticket coincide col momento dell'apertura.*/
INSERT INTO `ticket` (`IDTicket`, `Causale`, `Priorita`, `Lingua`, `Costo`, `Apertura`, `Chiusura`, `OreImpiegate`, `Cliente`) VALUES (null, <causale>, <priorita>, <lingua>, null, current_date, null, null, <Partita_IVA>);
/*Quando la causale del Ticket si riferisce ai consumabili, si andranno ad associare il ticket con il consumabile richiesto */
INSERT INTO `assistenzacons` (`Ticket`, `Cons`) VALUES (...);
/*Quando la causale del Ticket si riferisce ai macchinari, si andranno ad associare il ticket con il macchinario specifico e il tecnico specializzato
Il campo NumOre verrà utilizzato per indicare il numero di ore del singolo tecnico e verrà inizialmente impostato come valore nullo. */
INSERT INTO `assistenzamacc` (`Ticket`, `Macchina`, `Tecnico`, `NumOre`) VALUES (<id_ticket>, <id_macchina>, <id_tecnico>, null);


/* OPERAZIONE 5 */
/* Nel campo IDGaranzia non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment
Il campo DataInstallazione viene settato come current_date in quanto all'installazione del macchinario coincide l'inizio della garanzia
Il campo Scadenza invece coincide con la data di installazione traslata di un anno. */
INSERT INTO `garanzia` (`IDGaranzia`, `DataInstallazione`, `LuogoInstallazione`, `Scadenza`, `Macc`) VALUES (null, current_date, <luogo>, current_date + 1 YEAR, <id_macchina>)

/* OPERAZIONE 6 */
INSERT INTO `acquistomacc` (`Cliente`, `Macchinario`) VALUES (...);

/* OPERAZIONE 7 */
/* Nel campo IDContratto non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment
Il campo DataInizio viene settato come current_date in quanto l'inserimento di un nuovo contratto coincide con l'inizio di validità del contratto
Il campo DataFine invece coincide con la data di inizio traslata di tre anni.  */
INSERT INTO `contratto` (`IDContratto`, `DataInizio`, `DataFine`, `Canone`, `Banca`, `Cliente`) VALUES (null, current_date, current_date + 3 YEAR, <canone>, <banca>, <Partita_IVA>);

/* OPERAZIONE 8 */
/* Nel campo IDConsumabile non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment */
INSERT INTO `consumabile` (`IDConsumabile`, `Categoria`, `Prezzo`) VALUES (null, <cat>, <prezzo>);

/* OPERAZIONE 9 */
/*Se si vuole cambiare il saldo  di un cliente da positivo a negativo */
UPDATE cliente set Saldo = '-' where Partita_IVA = <p_IVA>;
/*Se si vuole cambiare il saldo di un cliente da negativo a positivo */
UPDATE cliente set Saldo = '+' where Partita_IVA = <p_IVA>;

/* OPERAZIONE 10 */
/* Se un tecnico passa da resident a non resident */
UPDATE datilavorativi set Resident = 'No' where IDTecnico = <id_tecnico>;
/* Se un tecnico passa da non resident a resident */
UPDATE datilavorativi set Resident = 'Si' where IDTecnico = <id_tecnico>;

/* OPERAZIONE 11 */
/* Se un tecnico sbaglia a mettere la categoria di un macchinario*/
UPDATE macchinario set Categoria = <cat> where IDMacchinario = <id_macchina>;

/* OPERAZIONE 12 DA CONTROLLARE PER CONSUMABILE */
UPDATE ticket set Causale = <causale> where IDTicket = <id_ticket>;

/* OPERAZIONE 13 */
UPDATE consumabile set Prezzo = <prezzo> where IDConsumabile = <id_consumabile>;

/* OPERAZIONE 14 */
DELETE FROM telcliente WHERE NumCliente = <p_IVA>;

DELETE FROM emailcliente WHERE NumCliente = <p_IVA>;

DELETE FROM cliente WHERE Partita_IVA = <p_IVA>;

/* OPERAZIONE 15 */
DELETE FROM numtecnico WHERE NumTecnico = <id_tecnico>;
DELETE FROM emailtecnico WHERE NumTecnico = <id_tecnico>;

DELETE FROM datilavorativi WHERE CF = <cod_fisc>;
DELETE FROM datianagrafici WHERE CodiceFiscale = <cod_fisc>;

/* OPERAZIONE 16 ???? */
DELETE FROM macchinario WHERE IDMacchinario = <id_macchina>;

/* OPERAZIONE 17 */
DELETE FROM consumabile WHERE IDConsumabile = <id_consumabile>;

/* OPERAZIONE 18 */
UPDATE ticket set Chiusura = CURRENT_DATE, OreImpiegate = (SELECT SUM(NumOre) 
FROM assistenzamacc 
JOIN datilavorativi ON assistenzamacc.Tecnico = datilavorativi.IDTecnico
WHERE assistenzamacc.Ticket = <id_ticket>), Costo = 15*(
SELECT SUM(NumOre) 
FROM assistenzamacc 
JOIN datilavorativi ON assistenzamacc.Tecnico = datilavorativi.IDTecnico
WHERE assistenzamacc.Ticket = <id_ticket> AND datilavorativi.resident = 'si')
where IDTicket = <id_ticket>;

/* OPERAZIONE 19 */
SELECT * FROM ticket WHERE Chiusura IS NULL;

/* OPERAZIONE 20 */
SELECT * FROM ticket WHERE Chiusura IS NOT NULL;

/* OPERAZIONE 21 */
SELECT * FROM ticket WHERE Priorita = 'Bloccata';

/* OPERAZIONE 22 */
SELECT ticket.IDTicket, ticket.Causale, macchinario.IDMacchinario,macchinario.Categoria 
FROM ticket 
JOIN assistenzamacc ON assistenzamacc.Ticket = ticket.IDTicket 
JOIN macchinario ON macchinario.IDMacchinario = assistenzamacc.Macchina 
WHERE assistenzamacc.Macchina = <id_macchina>;

/* OPERAZIONE 23 */
SELECT Partita_IVA, Nome, Stato FROM Cliente WHERE Stato != 'Italy' ORDER BY Stato, Nome;

/* OPERAZIONE 24 */
SELECT Partita_IVA, Nome, Stato FROM Cliente WHERE Stato = 'Italy' ORDER BY Nome;

/* OPERAZIONE 25 */
SELECT cliente.Partita_IVA, cliente.Nome, contratto.IDContratto 
FROM cliente 
JOIN contratto ON contratto.Cliente = cliente.Partita_IVA 
ORDER BY Partita_IVA;

/* OPERAZIONE 26 */
SELECT * FROM macchinario JOIN garanzia ON macchinario.Gar = garanzia.IDGaranzia WHERE garanzia.Scadenza > CURRENT_DATE;

/* OPERAZIONE 27 */
SELECT Partita_IVA, Nome FROM cliente WHERE Saldo = '-';

/* OPERAZIONE 28 */
SELECT macchinario.IDMacchinario, macchinario.Categoria, garanzia.DataInstallazione, garanzia.LuogoInstallazione 
FROM macchinario 
JOIN garanzia ON macchinario.Gar = garanzia.IDGaranzia 
WHERE garanzia.DataInstallazione > '<data_scelta>';

/* OPERAZIONE 29 */
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

/* OPERAZIONE 30 */
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

/* OPERAZIONE 31 */
SELECT IDTicket, Causale, DATEDIFF(Chiusura, Apertura) as Durata FROM ticket WHERE Chiusura IS NOT null;

/* OPERAZIONE 32 */
SELECT Causale, COUNT(Causale) AS Frequenza FROM ticket GROUP BY Causale;

/* OPERAZIONE 33 da controllare se funziona correttamente*/
SELECT DISTINCT (SELECT COUNT(*) FROM ticket WHERE Chiusura IS null)/(SELECT COUNT(*) FROM ticket WHERE Chiusura IS NOT null) as Rapporto FROM ticket;

/* OPERAZIONE 34 */
SELECT Macchinario.Categoria, COUNT(acquistomacc.Macchinario) AS TotaleAcquisti 
FROM Macchinario 
JOIN acquistomacc 
ON Macchinario.IDMacchinario = acquistomacc.Macchinario 
GROUP BY Macchinario.Categoria;

/* OPERAZIONE 35 */
SELECT consumabile.Categoria, COUNT(assistenzacons.Cons) as TotaleConsumabili
FROM consumabile JOIN assistenzacons
ON consumabile.IDConsumabile = assistenzacons.Cons
GROUP BY consumabile.Categoria;

/* OPERAZIONE 36 */
SELECT macchinario.*, COUNT(assistenzamacc.Macchina) as Guasti
FROM macchinario JOIN assistenzamacc
ON macchinario.IDMacchinario = assistenzamacc.Macchina
GROUP BY IDMacchinario;

/* OPERAZIONE 37 */
SELECT AVG(ticket.Costo) AS Costo_Medio FROM ticket;

/* OPERAZIONE 38 */
SELECT AVG(contratto.Canone) AS Canone_Medio FROM contratto;

/* OPERAZIONE 39 */
SELECT MAX(Canone) AS Canone_Massimo, MIN(Canone) AS Canone_Minimo FROM contratto;

/* OPERAZIONE 40 */
SELECT Stato, COUNT(Partita_IVA) FROM Cliente GROUP BY Stato;

/* OPERAZIONE 41 */
SELECT ticket.Cliente, COUNT(ticket.IDTicket) FROM ticket GROUP BY ticket.Cliente;

/* OPERAZIONE 42 */
SELECT SUM(CASE WHEN cliente.Saldo = '+' THEN 1 ELSE 0 END) AS Clienti_Solventi, 
SUM(CASE WHEN cliente.Saldo = '-' THEN 1 ELSE 0 END) AS Clienti_Insolventi 
FROM cliente;

/* OPERAZIONE 43 */
SELECT Priorita, COUNT(IDTicket) AS Numero_Ticket FROM ticket GROUP BY Priorita;

