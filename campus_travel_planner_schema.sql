-- Creating the database
CREATE DATABASE campus_travel_planner;

-- Switching to the created database
USE campus_travel_planner;

-- Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(255),
    contact_email VARCHAR(255),
    contact_mobile VARCHAR(15) 
);

-- Trips table
CREATE TABLE Trips (
    trip_id INT PRIMARY KEY AUTO_INCREMENT,
    visit_location VARCHAR(255),
    budget DECIMAL(10, 2),
    purpose VARCHAR(255),
    unit_involved VARCHAR(255),
    visit_date DATE,
    overnight_stay BOOLEAN,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Provisional Trips table
CREATE TABLE ProvisionalTrips (
    provisional_trip_id INT PRIMARY KEY AUTO_INCREMENT,
    trip_id INT,
    dvc_aa_approval_date DATE,
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id)
);

-- Transport Vehicles table
CREATE TABLE TransportVehicles (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_type VARCHAR(50),
    capacity INT
);

-- Trip Vehicles table
CREATE TABLE TripVehicles (
    trip_vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    trip_id INT,
    vehicle_id INT,
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id),
    FOREIGN KEY (vehicle_id) REFERENCES TransportVehicles(vehicle_id)
);

-- Funding Requests table
CREATE TABLE FundingRequests (
    request_id INT PRIMARY KEY AUTO_INCREMENT,
    trip_id INT,
    request_date DATE,
    amount_requested DECIMAL(10, 2),
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id)
);

-- Final Trips List table
CREATE TABLE FinalTripsList (
    final_trip_id INT PRIMARY KEY AUTO_INCREMENT,
    trip_id INT,
    registrar_aa_approval_date DATE,
    dvc_apd_approval_date DATE,
    transport_manager_notification_date DATE,
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id)
);

-- Communication table
CREATE TABLE Communication (
    communication_id INT PRIMARY KEY AUTO_INCREMENT,
    from_department_id INT,
    to_department_id INT,
    communication_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    communication_content TEXT,
    FOREIGN KEY (from_department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (to_department_id) REFERENCES Departments(department_id)
);

-- Insert dummy records into Departments table
INSERT INTO Departments (department_name, contact_email, contact_mobile)
VALUES 
    ('Department of Computer Science', 'compsci@example.com', '+1234567890'),
    ('Department of Physics', 'physicsdept@example.com', '+1987654321'),
    ('Department of Mathematics', 'mathdept@example.com', '+1555555555'),
    ('Department of Biology', 'biologydept@example.com', '+1777777777'),
    ('Department of Chemistry', 'chemistrydept@example.com', '+1888888888');

-- Insert dummy records into Trips table
INSERT INTO Trips (visit_location, budget, purpose, unit_involved, visit_date, overnight_stay, department_id)
VALUES 
    ('Conference in New York', 5000.00, 'Professional Development', 'Faculty', '2024-03-15', true, 1),
    ('Field trip to Yellowstone', 8000.00, 'Educational', 'Undergraduate Students', '2024-04-20', true, 4),
    ('Research visit to MIT', 3000.00, 'Research Collaboration', 'Graduate Students', '2024-05-10', false, 2),
    ('Workshop in Chicago', 4000.00, 'Training', 'Staff', '2024-06-05', false, 3),
    ('Seminar at Stanford', 6000.00, 'Academic Presentation', 'Faculty', '2024-07-12', true, 5);

-- Insert dummy records into ProvisionalTrips table
INSERT INTO ProvisionalTrips (trip_id, dvc_aa_approval_date)
VALUES 
    (1, '2024-02-28'),
    (2, '2024-03-01'),
    (3, '2024-03-02'),
    (4, '2024-03-03'),
    (5, '2024-03-04');

-- Insert dummy records into TransportVehicles table
INSERT INTO TransportVehicles (vehicle_type, capacity)
VALUES 
    ('Bus', 50),
    ('Van', 10),
    ('Minibus', 20),
    ('Car', 5),
    ('SUV', 7);

-- Insert dummy records into TripVehicles table
INSERT INTO TripVehicles (trip_id, vehicle_id)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Insert dummy records into FundingRequests table
INSERT INTO FundingRequests (trip_id, request_date, amount_requested)
VALUES 
    (1, '2024-02-25', 4000.00),
    (2, '2024-02-26', 6000.00),
    (3, '2024-02-27', 2500.00),
    (4, '2024-02-28', 3500.00),
    (5, '2024-02-29', 5000.00);

-- Insert dummy records into FinalTripsList table
INSERT INTO FinalTripsList (trip_id, registrar_aa_approval_date, dvc_apd_approval_date, transport_manager_notification_date)
VALUES 
    (1, '2024-03-01', '2024-03-02', '2024-03-03'),
    (2, '2024-03-02', '2024-03-03', '2024-03-04'),
    (3, '2024-03-03', '2024-03-04', '2024-03-05'),
    (4, '2024-03-04', '2024-03-05', '2024-03-06'),
    (5, '2024-03-05', '2024-03-06', '2024-03-07');

-- Insert dummy records into Communication table
INSERT INTO Communication (from_department_id, to_department_id, communication_content)
VALUES 
    (1, 2, 'Regarding upcoming conference'),
    (2, 3, 'Arrangements for the field trip'),
    (3, 4, 'Details about the research visit'),
    (4, 5, 'Workshop logistics'),
    (5, 1, 'Seminar schedule');
