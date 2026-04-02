CREATE DATABASE IF NOT EXISTS professional_db;
USE professional_db;

CREATE TABLE IF NOT EXISTS H1B_Visa (
    passport_number VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    mobile_number VARCHAR(15) NOT NULL,
    country VARCHAR(50) NOT NULL
);
