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
