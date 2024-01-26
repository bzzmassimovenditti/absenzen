create database absenzen;


use absenzen;

-- Lehrperson Table
CREATE TABLE Lehrperson (
 UniqueID INT,
 LehrpersonID INT PRIMARY KEY,
 Benutzername VARCHAR(255),
 Passwort VARCHAR(255),
 Fachgebiet VARCHAR(255)
);


-- Klasse Table
CREATE TABLE Klasse (
 KlassenID INT PRIMARY KEY,
 Klassenname VARCHAR(255)
);


-- Lernende Table
CREATE TABLE Lernende (
 UniqueID INT,
 LernendeID INT PRIMARY KEY,
 Vorname VARCHAR(255),
 Nachname VARCHAR(255),
 KlassenID INT,
 FOREIGN KEY (KlassenID) REFERENCES Klasse(KlassenID)
);


-- AbsenzStatus Table
CREATE TABLE AbsenzStatus (
 StatusID INT PRIMARY KEY,
 Bezeichnung VARCHAR(255)
);


-- Absenz Table
CREATE TABLE Absenz (
 UniqueID INT,
 AbsenzID INT PRIMARY KEY,
 LehrpersonID INT,
 LernendeID INT,
 Datum DATE,
 StatusID INT,
 Kommentar TEXT,
 FOREIGN KEY (LehrpersonID) REFERENCES Lehrperson(LehrpersonID),
 FOREIGN KEY (LernendeID) REFERENCES Lernende(LernendeID),
 FOREIGN KEY (StatusID) REFERENCES AbsenzStatus(StatusID)
);


-- AbsenzenHistorie Table
CREATE TABLE AbsenzenHistorie (
 UniqueID INT PRIMARY KEY,
 HistorieID INT,
 LernendeID INT,
 LehrpersonID INT,
 AbsenzID INT,
 FOREIGN KEY (LernendeID) REFERENCES Lernende(LernendeID),
 FOREIGN KEY (LehrpersonID) REFERENCES Lehrperson(LehrpersonID),
 FOREIGN KEY (AbsenzID) REFERENCES Absenz(AbsenzID)
 );

-- DispensStatus Table
CREATE TABLE DispensStatus (
 DispensStatusID INT PRIMARY KEY,
 Bezeichnung VARCHAR(255)
);

-- Fach Table
CREATE TABLE Fach (
 FachID INT PRIMARY KEY,
 Fachname VARCHAR(255)
);


-- Dispens Table
CREATE TABLE Dispens (
 UniqueID INT PRIMARY KEY,
 DispensID INT,
 LernendeID INT,
 LehrpersonID INT,
 DispensStatusID INT,
 Datum DATE,
 FachID INT,
 Kommentar TEXT,
 FOREIGN KEY (LernendeID) REFERENCES Lernende(LernendeID),
 FOREIGN KEY (LehrpersonID) REFERENCES Lehrperson(LehrpersonID),
 FOREIGN KEY (DispensStatusID) REFERENCES DispensStatus(DispensStatusID),
 FOREIGN KEY (FachID) REFERENCES Fach(FachID)
 );


-- KlassenAbsenzen Table
CREATE TABLE KlassenAbsenzen (
 UniqueID INT PRIMARY KEY,
 KlassenAbsenzID INT,
 KlassenID INT,
 AbsenzID INT,
 FOREIGN KEY (KlassenID) REFERENCES Klasse(KlassenID),
 FOREIGN KEY (AbsenzID) REFERENCES Absenz(AbsenzID)
 );




-- Insert into Lehrperson
INSERT INTO Lehrperson (UniqueID, LehrpersonID, Benutzername, Passwort, Fachgebiet) VALUES
 (1, 1, 'jsmith', 'password123', 'Mathematik'),
 (2, 2, 'mjohnson', 'password123', 'Biologie'),
 (3, 3, 'lwagner', 'securepass', 'Chemie'),
 (4, 4, 'rbrown', 'mypassword', 'Physik'),
 (5, 5, 'emiller', 'pass1234', 'Englisch'),
 (6, 6, 'tanderson', 'password1', 'Sport'),
 (7, 7, 'hjackson', '123password', 'Geschichte'),
 (8, 8, 'sschultz', 'passwort123', 'Informatik'),
 (9, 9, 'gwhite', 'password321', 'Kunst'),
 (10, 10, 'mjones', 'secure1234', 'Musik');

-- Insert into Klasse
INSERT INTO Klasse (KlassenID, Klassenname) VALUES
 (1, '10A'),
 (2, '10B'),
 (3, '10C'),
 (4, '10D'),
 (5, '11A'),
 (6, '11B'),
 (7, '11C'),
 (8, '11D'),
 (9, '12A'),
 (10,'12B');

-- Insert into AbsenzStatus
INSERT INTO AbsenzStatus (StatusID, Bezeichnung) VALUES
 (1, 'Krank'),
 (2, 'Entschuldigt'),
 (3, 'Unentschuldigt'),
 (4, 'Verspätet'),
 (5, 'Krank'),
 (6, 'Entschuldigt'),
 (7, 'Unentschuldigt'),
 (8, 'Verspätet'),
 (9, 'Krank'),
 (10,'Entschuldigt');

-- Insert into DispensStatus
INSERT INTO DispensStatus (DispensStatusID, Bezeichnung) VALUES
 (1, 'Genehmigt'),
 (2, 'Nicht genehmigt'),
 (3, 'Genehmigt'),
 (4, 'Nicht genehmigt'),
 (5, 'Genehmigt'),
 (6, 'Nicht genehmigt'),
 (7, 'Genehmigt'),
 (8, 'Nicht genehmigt'),
 (9, 'Genehmigt'),
 (10, 'Nicht genehmigt');

-- Insert into Fach
INSERT INTO Fach (FachID, Fachname) VALUES
 (1, 'Mathematik'),
 (2, 'Biologie'),
 (3, 'Chemie'),
 (4, 'Physik'),
 (5, 'Geschichte'),
 (6, 'Geografie'),
 (7, 'Englisch'),
 (8, 'Deutsch'),
 (9, 'Informatik'),
 (10,'Kunst');

-- Insert into Lernende
INSERT INTO Lernende (UniqueID, LernendeID, Vorname, Nachname, KlassenID) VALUES
 (1, 1, 'Emily', 'Clark', 1),
 (2, 2, 'Alexander', 'Schmidt', 2),
 (3, 3, 'Olivia', 'Johnson', 2),
 (4, 4, 'Liam', 'Williams', 1),
 (5, 5, 'Emma', 'Jones', 1),
 (6, 6, 'Noah', 'Brown', 2),
 (7, 7, 'Ava', 'Davis', 1),
 (8, 8, 'Sophia', 'Martinez', 2),
 (9, 9, 'James', 'Wilson', 1),
 (10, 10, 'Isabella', 'Anderson', 2);

-- Insert into Absenz
INSERT INTO Absenz (UniqueID, AbsenzID, LehrpersonID, LernendeID, Datum, StatusID, Kommentar) VALUES
 (1, 1, 1, 1, '2023-01-10', 1, 'Krank'),
 (2, 2, 2, 2, '2023-01-11', 2, 'Arzttermin'),
 (3, 3, 3, 3, '2023-01-12', 3, 'Urlaub'),
 (4, 4, 4, 4, '2023-01-13', 4, 'Fortbildung'),
 (5, 5, 5, 5, '2023-01-14', 5, 'Persönlich'),
 (6, 6, 6, 6, '2023-01-15', 6, 'Krank'),
 (7, 7, 7, 7, '2023-01-16', 7, 'Arzttermin'),
 (8, 8, 8, 8, '2023-01-17', 8, 'Urlaub'),
 (9, 9, 9, 9, '2023-01-18', 9, 'Fortbildung'),
 (10, 10, 10, 10, '2023-01-19', 10, 'Persönlich');

-- Insert into Dispens
INSERT INTO Dispens (UniqueID, DispensID, LernendeID, LehrpersonID, DispensStatusID, Datum, FachID, Kommentar) VALUES
 (1, 1, 1, 1, 1, '2023-02-15', 1, 'Ausflug'),
 (2, 2, 2, 2, 2, '2023-02-16', 2, 'Wettkampf'),
 (3, 3, 3, 3, 3, '2023-02-17', 3, 'Seminar'),
 (4, 4, 4, 4, 4, '2023-02-18', 4, 'Familienereignis'),
 (5, 5, 5, 5, 5, '2023-02-19', 5, 'Kulturelle Veranstaltung'),
 (6, 6, 6, 6, 6, '2023-02-20', 6, 'Bildungsreise'),
 (7, 7, 7, 7, 7, '2023-02-21', 7, 'Sportevent'),
 (8, 8, 8, 8, 8, '2023-02-22', 8, 'Workshop'),
 (9, 9, 9, 9, 9, '2023-02-23', 9, 'Konferenz'),
 (10, 10, 10, 10, 10, '2023-02-24', 10, 'Freiwilligenarbeit');

-- Insert into AbsenzenHistorie
INSERT INTO AbsenzenHistorie (UniqueID, HistorieID, LernendeID, LehrpersonID, AbsenzID) VALUES
 (1, 1, 1, 1, 1),
 (2, 2, 2, 2, 2),
 (3, 3, 3, 3, 3),
 (4, 4, 4, 4, 4),
 (5, 5, 5, 5, 5),
 (6, 6, 6, 6, 6),
 (7, 7, 7, 7, 7),
 (8, 8, 8, 8, 8),
 (9, 9, 9, 9, 9),
 (10, 10, 10, 10, 10);

-- Insert into KlassenAbsenzen
INSERT INTO KlassenAbsenzen (UniqueID, KlassenAbsenzID, KlassenID, AbsenzID) VALUES
 (1, 1, 1, 1),
 (2, 2, 2, 2),
 (3, 3, 3, 3),
 (4, 4, 4, 4),
 (5, 5, 5, 5),
 (6, 6, 6, 6),
 (7, 7, 7, 7),
 (8, 8, 8, 8),
 (9, 9, 9, 9),
 (10, 10, 10, 10);











