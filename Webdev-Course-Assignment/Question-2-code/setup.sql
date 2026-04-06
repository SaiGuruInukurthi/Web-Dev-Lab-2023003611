CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;

CREATE TABLE IF NOT EXISTS enrollments (
    enroll_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    contact_email VARCHAR(100),
    program_name VARCHAR(100)
);
