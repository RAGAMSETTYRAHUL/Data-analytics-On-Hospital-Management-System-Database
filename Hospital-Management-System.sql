CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    ContactNumber VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Symptoms VARCHAR(255),
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Medications (
    MedicationID INT AUTO_INCREMENT PRIMARY KEY,
    MedicationName VARCHAR(100) NOT NULL,
    Dosage VARCHAR(50),
    PatientID INT,
    AppointmentID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);


INSERT INTO Departments (DepartmentName)
VALUES ('Cardiology'), ('Neurology'), ('Orthopedics'), ('Pediatrics'), ('General Medicine');

INSERT INTO Doctors (DoctorName, Specialization, DepartmentID)
VALUES 
('Dr. John Smith', 'Cardiologist', 1),
('Dr. Emily Brown', 'Neurologist', 2),
('Dr. Michael Johnson', 'Orthopedic Surgeon', 3),
('Dr. Sarah Davis', 'Pediatrician', 4),
('Dr. James Wilson', 'General Physician', 5);

INSERT INTO Patients (PatientName, DateOfBirth, Gender, ContactNumber, Address)
VALUES 
('Alice Johnson', '1985-04-12', 'Female', '1234567890', '123 Elm St'),
('Bob Martin', '1990-07-19', 'Male', '0987654321', '456 Oak St'),
('Charlie Brown', '1975-12-05', 'Male', '5678901234', '789 Pine St'),
('Diana Prince', '1988-02-23', 'Female', '6789012345', '101 Maple St'),
('Edward Norton', '2000-11-17', 'Male', '7890123456', '202 Cedar St');


INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Symptoms, Diagnosis, Treatment)
VALUES 
(1, 1, '2024-08-01', 'Chest pain', 'Angina', 'Medication'),
(2, 2, '2024-08-02', 'Headache', 'Migraine', 'Rest and medication'),
(3, 3, '2024-08-03', 'Back pain', 'Disc herniation', 'Physical therapy'),
(4, 4, '2024-08-04', 'Fever', 'Viral Infection', 'Antiviral medication'),
(5, 5, '2024-08-05', 'Cough and cold', 'Common Cold', 'Rest and hydration');

INSERT INTO Medications (MedicationName, Dosage, PatientID, AppointmentID)
VALUES 
('Aspirin', '75 mg', 1, 1),
('Ibuprofen', '200 mg', 2, 2),
('Paracetamol', '500 mg', 4, 4),
('Antiviral', '150 mg', 4, 4),
('Cough Syrup', '10 ml', 5, 5);


