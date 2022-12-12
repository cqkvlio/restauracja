DROP DATABASE IF EXISTS baza_rezerwacje;

CREATE DATABASE baza_rezerwacje;

USE baza_rezerwacje;

CREATE TABLE Reservation(
    id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    restaurant_table_id int FOREIGN KEY REFERENCES Restaurant_Table(id),
    phone_number VARCHAR(12),
    date DATETIME,
    number_of_guests INT
);

CREATE TABLE Restaurant_Table(
    id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    number_of_guests INT,
    restaurant_id int FOREIGN KEY REFERENCES Restaurant(id)
);

CREATE TABLE Restaurant(
    id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    adress VARCHAR(255) NOT NULL,
    postcode VARCHAR(10) NOT NULL
);

CREATE TABLE Meal(
    id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    meal_type_id int FOREIGN KEY REFERENCES MealType(id),
    restaurant_id int FOREIGN KEY REFERENCES Restaurant(id),
    price INT,
    meal_name VARCHAR(100)
);

CREATE TABLE MealType(
    id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Employee(
    id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(225),
    personal_id_number VARCHAR(11)
);

CREATE TABLE Employment(
    employee_id int FOREIGN KEY REFERENCES Employee(id),
    employee_position_id int FOREIGN KEY REFERENCES Employee_Position(id),
    restaurant_id int FOREIGN KEY REFERENCES Restaurant(id)
);

CREATE TABLE Employee_Position(
    id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

SELECT *
FROM Reservation
JOIN Restaurant_Table ON Reservation.restaurant_table_id = Restaurant_Table.id;

SELECT *
FROM Restaurant_Table
LEFT JOIN Reservation ON Restaurant_Table.id = Reservation.restaurant_table_id
WHERE Reservation.id IS NULL;

SELECT Employee.*, Employee_Position.name AS position_name, Restaurant.name AS restaurant_name
FROM Employee
JOIN Employment ON Employee.id = Employment.employee_id
JOIN Employee_Position ON Employment.employee_position_id = Employee_Position.id
JOIN Restaurant ON Employment.restaurant_id = Restaurant.id;

SELECT Employee.*
FROM Employee
JOIN Employment ON Employee.id = Employment.employee_id
GROUP BY Employee.id
HAVING COUNT(Employment.restaurant_id) >= 2;

SELECT Employee.first_name, Employee.last_name, Restaurant.name
FROM Employee
CROSS JOIN Restaurant;
