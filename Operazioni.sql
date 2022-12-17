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
INSERT INTO `macchinario` (`IDMacchinario`, `Categoria`, `Gar`) VALUES (null, <cat>, <id_garanzia>);

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


/*OPERAZIONE 5 - DA CONTROLLARE*/
/* Nel campo IDGaranzia non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment
Il campo DataInstallazione viene settato come current_date in quanto all'installazione del macchinario coincide l'inizio della garanzia
Il campo Scadenza invece coincide con la data di installazione traslata di un anno. */
INSERT INTO `garanzia` (`IDGaranzia`, `DataInstallazione`, `LuogoInstallazione`, `Scadenza`) VALUES (null, current_date, <luogo>, current_date + 1 YEAR)

/* OPERAZIONE 6 */
/* Nel campo IDContratto non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment
Il campo DataInizio viene settato come current_date in quanto l'inserimento di un nuovo contratto coincide con l'inizio di validità del contratto
Il campo DataFine invece coincide con la data di inizio traslata di tre anni.  */
INSERT INTO `contratto` (`IDContratto`, `DataInizio`, `DataFine`, `Canone`, `Banca`, `Cliente`) VALUES (null, current_date, current_date + 3 YEAR, <canone>, <banca>, <Partita_IVA>);

/* OPERAZIONE 7 */
/* Nel campo IDConsumabile non va inserito nulla in quanto il sistema aggiunge automaticamente un valore con auto_increment */
INSERT INTO `consumabile` (`IDConsumabile`, `Categoria`, `Prezzo`) VALUES (null, <cat>, <prezzo>);

/* OPERAZIONE 8 */
/*Se si vuole cambiare il saldo  di un cliente da positivo a negativo */
UPDATE cliente set Saldo = '-' where Partita_IVA = <p_IVA>;

/*Se si vuole cambiare il saldo di un cliente da negativo a positivo */
UPDATE cliente set Saldo = '+' where Partita_IVA = <p_IVA>;

/* OPERAZIONE 9 */
/* Se un tecnico passa da resident a non resident */
UPDATE datilavorativi set Resident = 'No' where IDTecnico = <id_tecnico>;

/* Se un tecnico passa da non resident a resident */
UPDATE datilavorativi set Resident = 'Si' where IDTecnico = <id_tecnico>;

/* OPERAZIONE 10 ???*/


/* OPERAZIONE 11 DA CONTROLLARE PER CONSUMABILE */
UPDATE ticket set Causale = <causale> where IDTicket = <id_ticket>;

/* OPERAZIONE 12 */
UPDATE consumabile set Prezzo = <prezzo> where IDConsumabile = <id_consumabile>;

/* OPERAZIONE 13 */
DELETE FROM cliente WHERE Partita_IVA = <p_IVA>;

/* OPERAZIONE 14 */
DELETE FROM datilavorativi WHERE CF = <cod_fisc>;

DELETE FROM datianagrafici WHERE CodiceFiscale = <cod_fisc>;

/* OPERAZIONE 15 ???? */
DELETE FROM macchinario WHERE IDMacchinario = <id_macchina>;

/* OPERAZIONE 16 ???? */
DELETE FROM consumabile WHERE IDConsumabile = <id_consumabile>;

/* OPERAZIONE 17 */

/* OPERAZIONE 18 */
SELECT * FROM ticket WHERE Chiusura IS NULL;

/* OPERAZIONE 19 */
SELECT * FROM ticket WHERE Chiusura IS NOT NULL;

/* OPERAZIONE 20 */
SELECT * FROM ticket WHERE Priorita = 'Bloccata';

/* OPERAZIONE 21 */
SELECT ticket.IDTicket, ticket.Causale, macchinario.IDMacchinario,macchinario.Categoria 
FROM ticket 
JOIN assistenzamacc ON assistenzamacc.Ticket = ticket.IDTicket 
JOIN macchinario ON macchinario.IDMacchinario = assistenzamacc.Macchina 
WHERE assistenzamacc.Macchina = 41;

/* OPERAZIONE 22 */
SELECT Partita_IVA, Nome, Stato FROM Cliente WHERE Stato != 'Italy' ORDER BY Stato, Nome;

/* OPERAZIONE 23 */
SELECT Partita_IVA, Nome, Stato FROM Cliente WHERE Stato = 'Italy' ORDER BY Nome;

/* OPERAZIONE 24 */
SELECT cliente.Partita_IVA, cliente.Nome, contratto.IDContratto 
FROM cliente 
JOIN contratto ON contratto.Cliente = cliente.Partita_IVA 
ORDER BY Partita_IVA;

/* OPERAZIONE 25 */
SELECT * FROM macchinario JOIN garanzia ON macchinario.Gar = garanzia.IDGaranzia WHERE garanzia.Scadenza > CURRENT_DATE;

/* OPERAZIONE 26 */
SELECT Partita_IVA, Nome FROM cliente WHERE Saldo = '-';

/* OPERAZIONE 27 */
SELECT macchinario.IDMacchinario, macchinario.Categoria, garanzia.DataInstallazione, garanzia.LuogoInstallazione 
FROM macchinario 
JOIN garanzia ON macchinario.Gar = garanzia.IDGaranzia 
WHERE garanzia.DataInstallazione > '<data_scelta>';

/* OPERAZIONE 28 */
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

/* OPERAZIONE 29 */
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
