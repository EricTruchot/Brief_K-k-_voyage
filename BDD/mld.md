Company = (Id_company COUNTER, name VARCHAR(50));
Country = (Id_Pays COUNTER, name VARCHAR(50));
City = (Id_Ville COUNTER, name VARCHAR(50), #Id_Pays);
Airport = (Id_airport COUNTER, name VARCHAR(50), #Id_Ville);
Flight = (Id_flight COUNTER, state VARCHAR(50), date_departure VARCHAR(50), date_arrival VARCHAR(50), flight_number VARCHAR(50), #Id_company, #Id_airport_departure, #Id_airport_arrival);
Booking = (Id_booking COUNTER, state VARCHAR(50), price VARCHAR(50), email VARCHAR(50), date_booking VARCHAR(50), first_name VARCHAR(50), last_name VARCHAR(50), age VARCHAR(50), passeport VARCHAR(50), booking_number VARCHAR(50), #Id_flight);
stopover = (#Id_flight, #Id_airport, date_departure VARCHAR(50), date_arrival VARCHAR(50));
