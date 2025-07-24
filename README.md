# ✈️ Airline Reservation System - SQL Project

This is a complete SQL-based **Airline Reservation System** project designed to manage flight bookings, customers, and seat allocations. It includes database schema, sample data, triggers, views, and queries using **MySQL Workbench**.

---

## 📌 Project Overview

The goal of this project is to create a backend database system that:
- Stores flight information
- Manages customer bookings
- Tracks seat availability
- Automatically handles cancellations with triggers
- Displays real-time booking reports and available flights

---

## 🛠️ Tools Used

- **MySQL Workbench** – SQL development and execution  
- **ER Diagram Tool** – Generated using Graphviz  
- **FPDF (Python)** – For generating the project report PDF  

---

## 🗃️ Database Schema (ER Diagram)

<img width="716" height="407" alt="airline_reservation_er_diagram" src="https://github.com/user-attachments/assets/314ec8cc-338f-4616-9e99-5d3ae29928b7" />


**Tables in the project:**
1. `Flights` – Flight route and schedule
2. `Customers` – Passenger details
3. `Seats` – Seat numbers linked to flights
4. `Bookings` – Reservation records with status

---

## ✨ Key Features

- ✅ Normalized database schema (3NF)
- ✅ Primary & Foreign Key Constraints
- ✅ Triggers to auto-update seat status on cancellation
- ✅ Views to show available flights
- ✅ Sample data for flights, customers, and bookings
- ✅ Ready-to-run SQL scripts

---

## 🚀 How to Run This Project

1. Clone the repo or download the files.
2. Open `MySQL Workbench` and run the `airline_reservation_system.sql` script.
3. Explore:
   - Table creation
   - Sample inserts
   - Triggers
   - Queries and views

---

## 🔍 Sample SQL Queries

-- Show all flights
SELECT * FROM Flights;

-- Search available seats on flight 1
SELECT seat_number FROM Seats WHERE flight_id = 1 AND is_booked = FALSE;

-- View booking report
SELECT B.booking_id, C.full_name, F.airline_name, S.seat_number, B.status
FROM Bookings B
JOIN Customers C ON B.customer_id = C.customer_id
JOIN Flights F ON B.flight_id = F.flight_id
JOIN Seats S ON B.seat_id = S.seat_id;
📸 Screenshots
1. ER Diagram
<img width="716" height="407" alt="airline_reservation_er_diagram" src="https://github.com/user-attachments/assets/d722640f-7de7-4620-b847-1224d3f4b148" />

2. Table Records (MySQL Workbench Example)
<img width="1085" height="635" alt="Screenshot 2025-07-24 085956" src="https://github.com/user-attachments/assets/7bb8a5b2-1dd6-4046-a731-f98ff74fc1a6" />

<img width="784" height="650" alt="Screenshot 2025-07-24 090113" src="https://github.com/user-attachments/assets/25c6d451-8456-4c95-9eb7-7dc1fc28a8e6" />

<img width="1105" height="642" alt="Screenshot 2025-07-24 090206" src="https://github.com/user-attachments/assets/c968b14a-1f9f-4e65-8b1f-415220fd32de" />

<img width="786" height="313" alt="Screenshot 2025-07-24 090731" src="https://github.com/user-attachments/assets/baa56852-6cf0-4443-ac59-528d92f2bfdd" />

<img width="794" height="295" alt="Screenshot 2025-07-24 090807" src="https://github.com/user-attachments/assets/34a293c0-9ba1-4e42-b5d4-14fbca5bc305" />

<img width="801" height="350" alt="Screenshot 2025-07-24 090915" src="https://github.com/user-attachments/assets/558a3a4e-2cd9-4f57-8a1b-be3dbcb2c7ff" />

3. Sample Output of Available Seats

You can save and upload your MySQL screenshots in a screenshots/ folder and reference them above.

📄 Project Report
The project report (PDF) is included in the repository:
📂 Airline_Reservation_System_Report.pdf

🙌 Author
Alok Kumar
Email: alokkumarkaranraj@gmail.com

📁 Folder Structure

Airline_Reservation_System/
│
├── airline_reservation_system.sql       # SQL schema and data
├── Airline_Reservation_System_Report.pdf # Project report
├── airline_reservation_er_diagram.png    # ER diagram
├── screenshots/                          # Optional screenshot folder
└── README.md                             # This file
✅ Status
🟢 Project Completed
📅 Submitted on: July 24, 2025
