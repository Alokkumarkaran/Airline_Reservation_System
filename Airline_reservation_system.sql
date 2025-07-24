CREATE DATABASE AirlineReservationDB;
USE AirlineReservationDB;

-- Flights Table
CREATE TABLE Flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    airline_name VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50),
    departure_time DATETIME,
    arrival_time DATETIME,
    total_seats INT
);

-- Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- Seats Table
CREATE TABLE Seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_id INT,
    seat_number VARCHAR(10),
    is_booked BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Bookings Table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    flight_id INT,
    seat_id INT,
    booking_date DATETIME DEFAULT NOW(),
    status VARCHAR(20) CHECK (status IN ('CONFIRMED', 'CANCELLED')),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);

INSERT INTO Flights (airline_name, source, destination, departure_time, arrival_time, total_seats) VALUES
('Air India', 'Delhi', 'Mumbai', '2025-08-10 09:00:00', '2025-08-10 11:00:00', 180),
('IndiGo', 'Kolkata', 'Chennai', '2025-08-11 14:30:00', '2025-08-11 17:00:00', 160),
('SpiceJet', 'Bangalore', 'Delhi', '2025-08-12 06:00:00', '2025-08-12 08:30:00', 150),
('GoAir', 'Mumbai', 'Hyderabad', '2025-08-13 15:00:00', '2025-08-13 17:00:00', 140),
('Vistara', 'Delhi', 'Bangalore', '2025-08-14 08:00:00', '2025-08-14 10:30:00', 200),
('AirAsia', 'Pune', 'Kolkata', '2025-08-15 12:00:00', '2025-08-15 16:00:00', 120),
('Akasa Air', 'Lucknow', 'Mumbai', '2025-08-16 18:00:00', '2025-08-16 20:00:00', 160),
('Air India', 'Hyderabad', 'Chennai', '2025-08-17 07:00:00', '2025-08-17 08:30:00', 180),
('IndiGo', 'Chandigarh', 'Delhi', '2025-08-18 09:30:00', '2025-08-18 10:45:00', 170),
('SpiceJet', 'Jaipur', 'Goa', '2025-08-19 10:00:00', '2025-08-19 13:00:00', 150);

SELECT * FROM Flights;


INSERT INTO Customers (full_name, email, phone) VALUES
('Alok Kumar', 'alok@example.com', '9876543210'),
('Neha Sharma', 'neha@example.com', '9876500000'),
('Ravi Verma', 'ravi@example.com', '9876511111'),
('Pooja Yadav', 'pooja@example.com', '9876522222'),
('Rajesh Singh', 'rajesh@example.com', '9876533333'),
('Simran Kaur', 'simran@example.com', '9876544444'),
('Amit Jain', 'amit@example.com', '9876555555'),
('Nisha Roy', 'nisha@example.com', '9876566666'),
('Sandeep Mehta', 'sandeep@example.com', '9876577777'),
('Kavita Joshi', 'kavita@example.com', '9876588888');

select *from Customers;

-- Flight ID 1
INSERT INTO Seats (flight_id, seat_number) VALUES
(1, '1A'), (1, '1B'), (1, '1C'), (1, '1D'), (1, '2A'), (1, '2B'), (1, '2C'), (1, '2D'), (1, '3A'), (1, '3B');

-- Flight ID 2
INSERT INTO Seats (flight_id, seat_number) VALUES
(2, '1A'), (2, '1B'), (2, '1C'), (2, '1D'), (2, '2A'), (2, '2B'), (2, '2C'), (2, '2D'), (2, '3A'), (2, '3B');

-- Flight ID 3
INSERT INTO Seats (flight_id, seat_number) VALUES
(3, '1A'), (3, '1B'), (3, '1C'), (3, '1D'), (3, '2A'), (3, '2B'), (3, '2C'), (3, '2D'), (3, '3A'), (3, '3B');

SELECT * FROM Seats;

-- Book seat '1A' for Alok Kumar on Flight 1
INSERT INTO Bookings (customer_id, flight_id, seat_id, status)
VALUES (1, 1, 1, 'CONFIRMED');

-- Update seat as booked
UPDATE Seats SET is_booked = TRUE WHERE seat_id = 1;

DELIMITER //
CREATE TRIGGER cancel_booking_trigger
AFTER UPDATE ON Bookings
FOR EACH ROW
BEGIN
  IF NEW.status = 'CANCELLED' THEN
    UPDATE Seats SET is_booked = FALSE WHERE seat_id = NEW.seat_id;
  END IF;
END;
//
DELIMITER ;

-- 1. View all flights
SELECT * FROM Flights;

-- 2. Find available seats for Flight 1
SELECT seat_number FROM Seats WHERE flight_id = 1 AND is_booked = FALSE;

-- 3. View bookings with customer and flight details
SELECT B.booking_id, C.full_name, F.airline_name, S.seat_number, B.status
FROM Bookings B
JOIN Customers C ON B.customer_id = C.customer_id
JOIN Flights F ON B.flight_id = F.flight_id
JOIN Seats S ON B.seat_id = S.seat_id;

-- 4. Cancel a booking
UPDATE Bookings SET status = 'CANCELLED' WHERE booking_id = 1;
-- Trigger will auto-update seat availability

CREATE VIEW AvailableFlights AS
SELECT flight_id, airline_name, source, destination, departure_time
FROM Flights
WHERE departure_time > NOW();

