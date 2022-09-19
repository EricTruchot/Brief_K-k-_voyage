# Kéké voyage


## Contexte du projet

Votre client, une agence de voyages, souhaite proposer la possibilité de réserver en ligne des billets d'avion à leurs clients.
Votre mission est de concevoir à l'aide du standard UML la modélisation de la plateforme.
La plateforme devra permettre que :

- Un vol est ouvert à la réservation et refermé sur ordre de la compagnie.
- Un vol peut être annulé par la compagnie
- Un client peut réserver un ou plusieurs vols, pour des passagers différents.
- Une réservation concerne un seul vol et un seul passager.
- Une réservation peut être annulée ou confirmée.
- Un vol a un aéroport de départ et un aéroport d’arrivée.
- Un vol a un jour et une heure de départ, et un jour et une heure d’arrivée.
- Un vol peut comporter des escales dans des aéroports.
- Une escale a une heure d’arrivée et une heure de départ.
- Chaque aéroport dessert une ou plusieurs villes.
- Des compagnies aériennes proposent différents vols.

## Livrable:

- Un MCD,
- Un MLD,
- Un MPD.
- Dictionnaire de données,
- Règles de gestion,
- Un diagramme de cas d'utilisation,
- Un diagramme de classe,
- Un diagramme de séquence.

## Règles de gestion:

### Client

- Peut réserver pour un ou plusieurs passagers.

### Réservation

- Concerne qu'un seul vol et un seul passager,
- Peut être annulée ou confirmée,
- Contient un numéro de réservation,
- Contient un nom, prénom et numéro de téléphone.

### Vol

- Contient un numéro de vol,
- Contient un aéroport de départ, une date et une heure,
- Contient un aéroport d'arrivée, une date et une heure,
- Contient un ou plusieurs passagers,
- Peut être ouvert à la réservation ou non par la compagnie,
- Peut être annulé par la compagnie,
- Peut faire des escales dans un aéroport,
- Est un trajet d'un aéroport de départ à un aéroport d'arrivé.

### Aéroport

- Se trouve dans une ville.

### Escale

- Se fait dans un aéroport,
- Contient une date et une heure d'arrivée,
- Contient une date et une heure de départ.

### Compagnie

- Propose différents vols,
- Contient un nom.

### Ville

- Contient un nom.

### Pays

- Contient un nom.

## Dictionnaire de données:
| NOM                     | DESIGNATION                            | Type |
| ----------------------- | -------------------------------------- | ---- |
| booking_number          | Numéro de réservation                  | AN   |
| passeport_booking       | Passeport                              | AN   |
| last_name_booking       | Nom passager                           | A    |
| first_name_booking      | Prénom passager                        | A    |
| age_booking             | Âge du passager                        | DATE |
| email_booking           | Mail de la réservation                 | AN   |
| price_booking           | Prix                                   | N    |
| state_booking           | Etat de la réservation                 | N    |
| date_booking            | Date de la réservation                 | DATE |
| date_departure_flight   | Date et l'heure du départ du vol       | DATE |
| date_arrival_flight     | Date et l'heure du arrivée du vol      | DATE |
| flight_number           | Numéro du vol                          | AN   |
| state_flight            | Etat du vol                            | N    |
| date_departure_stopover | Date et l'heure du départ de l'escale  | DATE |
| date_arrival_stopover   | Date et l'heure du arrivée de l'escale | DATE |
| name_company            | Nom de la compagnie                    | AN   |
| name_airport            | Nom de l'aéroport                      | A    |
| name_city               | Nom de la ville                        | A    |
| name_country            | Nom du pays                            | A    |                            |


## Modèle Logique des Données

**Modèle Logique des Données textuel:**

Company = (Id_company COUNTER, name VARCHAR(50));
Country = (Id_Pays COUNTER, name VARCHAR(50));
City = (Id_Ville COUNTER, name VARCHAR(50), #Id_Pays);
Airport = (Id_airport COUNTER, name VARCHAR(50), #Id_Ville);
Flight = (Id_flight COUNTER, state VARCHAR(50), date_departure VARCHAR(50), date_arrival VARCHAR(50), flight_number VARCHAR(50), #Id_company, #Id_airport_departure, #Id_airport_arrival);
Booking = (Id_booking COUNTER, state VARCHAR(50), price VARCHAR(50), email VARCHAR(50), date_booking VARCHAR(50), first_name VARCHAR(50), last_name VARCHAR(50), age VARCHAR(50), passeport VARCHAR(50), booking_number VARCHAR(50), #Id_flight);
stopover = (#Id_flight, #Id_airport, date_departure VARCHAR(50), date_arrival VARCHAR(50));  



**Script SQL**

```sql
CREATE TABLE Company(
   Id_company COUNTER,
   name VARCHAR(50),
   PRIMARY KEY(Id_company)
);

CREATE TABLE Country(
   Id_Pays COUNTER,
   name VARCHAR(50),
   PRIMARY KEY(Id_Pays)
);

CREATE TABLE City(
   Id_Ville COUNTER,
   name VARCHAR(50),
   Id_Pays INT NOT NULL,
   PRIMARY KEY(Id_Ville),
   FOREIGN KEY(Id_Pays) REFERENCES Country(Id_Pays)
);

CREATE TABLE Airport(
   Id_airport COUNTER,
   name VARCHAR(50),
   Id_Ville INT NOT NULL,
   PRIMARY KEY(Id_airport),
   FOREIGN KEY(Id_Ville) REFERENCES City(Id_Ville)
);

CREATE TABLE Flight(
   Id_flight COUNTER,
   state VARCHAR(50),
   date_departure VARCHAR(50),
   date_arrival VARCHAR(50),
   flight_number VARCHAR(50),
   Id_company INT NOT NULL,
   Id_airport_departure INT NOT NULL,
   Id_airport_arrival INT NOT NULL,
   PRIMARY KEY(Id_flight),
   FOREIGN KEY(Id_company) REFERENCES Company(Id_company),
   FOREIGN KEY(Id_airport_departure) REFERENCES Airport(Id_airport),
   FOREIGN KEY(Id_airport_arrival) REFERENCES Airport(Id_airport)
);

CREATE TABLE Booking(
   Id_booking COUNTER,
   state VARCHAR(50),
   price VARCHAR(50),
   email VARCHAR(50),
   date_booking VARCHAR(50),
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   age VARCHAR(50),
   passeport VARCHAR(50),
   booking_number VARCHAR(50),
   Id_flight INT NOT NULL,
   PRIMARY KEY(Id_booking),
   FOREIGN KEY(Id_flight) REFERENCES Flight(Id_flight)
);

CREATE TABLE stopover(
   Id_flight INT,
   Id_airport INT,
   date_departure VARCHAR(50),
   date_arrival VARCHAR(50),
   PRIMARY KEY(Id_flight, Id_airport),
   FOREIGN KEY(Id_flight) REFERENCES Flight(Id_flight),
   FOREIGN KEY(Id_airport) REFERENCES Airport(Id_airport)
);

```

