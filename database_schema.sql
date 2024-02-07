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
    vehicle_type VARCHAR(50)
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
