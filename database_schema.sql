-- Creating the database
CREATE DATABASE university_transport_system;

-- Switching to the created database
USE university_transport_system;

-- Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(255),
    contact_email VARCHAR(255),
    contact_mobile VARCHAR(20)
);

-- Trips table
CREATE TABLE Trips (
    trip_id INT PRIMARY KEY AUTO_INCREMENT,
    place_of_visit VARCHAR(255),
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

-- Contact Information table
CREATE TABLE ContactInformation (
    contact_id INT PRIMARY KEY AUTO_INCREMENT,
    email_address VARCHAR(255),
    mobile_number VARCHAR(20)
);

-- Communication table
CREATE TABLE Communication (
    communication_id INT PRIMARY KEY AUTO_INCREMENT,
    from_department_id INT,
    to_department_id INT,
    contact_id INT,
    communication_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    communication_content TEXT,
    FOREIGN KEY (from_department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (to_department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (contact_id) REFERENCES ContactInformation(contact_id)
);

-- Insert dummy records into Departments table
INSERT INTO Departments (department_name, contact_email, contact_mobile) 
VALUES 
('Computer Science', 'cs@example.com', '123-456-7890'),
('Mathematics', 'math@example.com', '987-654-3210'),
('Physics', 'physics@example.com', '555-555-5555');

-- Insert dummy records into Trips table
INSERT INTO Trips (place_of_visit, budget, purpose, unit_involved, visit_date, overnight_stay, department_id) 
VALUES 
('Conference', 5000.00, 'Networking', 'Computer Science', '2024-02-15', 1, 1),
('Field Trip', 3000.00, 'Education', 'Physics', '2024-03-20', 0, 3),
('Seminar', 2000.00, 'Research', 'Mathematics', '2024-04-10', 1, 2);

-- Insert dummy records into TransportVehicles table
INSERT INTO TransportVehicles (vehicle_type, capacity) 
VALUES 
('Bus', 52),
('Van', 14),
('Car', 7);

-- Insert dummy records into ProvisionalTrips table
INSERT INTO ProvisionalTrips (trip_id, dvc_aa_approval_date) 
VALUES 
(1, '2024-02-14'),
(2, '2024-03-01'),
(3, '2024-03-15');

-- Insert dummy records into TripVehicles table
INSERT INTO TripVehicles (trip_id, vehicle_id) 
VALUES 
(1, 1),
(2, 2),
(3, 3);

-- Insert dummy records into FundingRequests table
INSERT INTO FundingRequests (trip_id, request_date, amount_requested) 
VALUES 
(1, '2024-01-15', 4000.00),
(2, '2024-02-01', 2500.00),
(3, '2024-03-10', 1800.00);

-- Insert dummy records into FinalTripsList table
INSERT INTO FinalTripsList (trip_id, registrar_aa_approval_date, dvc_apd_approval_date, transport_manager_notification_date) 
VALUES 
(1, '2024-02-10', '2024-02-12', '2024-02-13'),
(2, '2024-03-05', '2024-03-07', '2024-03-08'),
(3, '2024-03-20', '2024-03-22', '2024-03-24');

-- Insert dummy records into ContactInformation table
INSERT INTO ContactInformation (email_address, mobile_number) 
VALUES 
('dept1@example.com', '111-111-1111'),
('dept2@example.com', '222-222-2222'),
('dept3@example.com', '333-333-3333');

-- Insert dummy records into Communication table
INSERT INTO Communication (from_department_id, to_department_id, contact_id, communication_content) 
VALUES 
(1, 2, 1, 'Regarding trip logistics'),
(2, 1, 2, 'Confirmation of budget allocation'),
(3, 1, 3, 'Request for additional information');
