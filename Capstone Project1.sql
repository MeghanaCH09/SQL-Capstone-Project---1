DROP TABLE IF EXISTS Salesman;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Orders;

CREATE TABLE IF NOT EXISTS Salesman(
Salesman_Id INTEGER PRIMARY KEY,
Name TEXT,
Country TEXT,
Commission REAL);

INSERT INTO Salesman(Salesman_Id, Name, Country, Commission)
VALUES
(220, 'David Fischer', 'Denmark', 0.56),
(221, 'Ben Shelton', 'USA', 0.16),
(222, 'Aryna Mairum', 'Russia', 0.15),
(223, 'Alex Hong', 'Japan', 0.55),
(224, 'Paul Maxwell', 'England', 0.66),
(225, 'Adam Zampa', 'South Africa', 0.86),
(226, 'Alexander Zverev', 'France', 0.74),
(227, 'Jannik Sinner', 'Italy', 0.65),
(228, 'James Wright', 'Australia', 0.54),
(229, 'Will Brandon', 'Canada', 0.74);

CREATE TABLE IF NOT EXISTS Customer(
Customer_Id INTEGER PRIMARY KEY,
Customer_Name TEXT,
Customer_Country TEXT,
Customer_Grade INTEGER,
Salesman_Id INTEGER,
FOREIGN KEY (Salesman_Id) REFERENCES Salesman (Salesman_Id));

INSERT INTO Customer(Customer_Id, Customer_Name, Customer_Country, Customer_Grade, Salesman_Id)
VALUES
(350, 'Brandon Maxwell', 'USA', 300, 220),
(351, 'Mariam Zinc', 'Russia', 301, 221),
(352, 'Ben Wilson', 'England', 302, 222),
(353, 'Louis Valera', 'France', 303, 223),
(354, 'Veronica Sim', 'South Korea', 304, 224),
(355, 'Suzy Boxmen', 'Japan', 305, 225),
(356, 'Benjamin Stephen', 'Japan', 306, 226),
(357, 'Mary Aimee', 'France', 307, 227),
(358, 'Stephen Jiang', 'China', 308, 228),
(359, 'Bross Maax', 'England', 309, 229);

CREATE TABLE IF NOT EXISTS Orders(
Order_No INTEGER PRIMARY KEY,
Order_City TEXT,
Salesman_Id INTEGER, 
Customer_Id INTEGER,
FOREIGN KEY (Salesman_Id) REFERENCES Salesman (Salesman_Id),
FOREIGN KEY (Customer_Id) REFERENCES Customer (Customer_Id));

INSERT INTO Orders(Order_No, Order_City, Salesman_Id, Customer_Id)
VALUES
(50, 'New York', 220, 350),
(51, 'Washington', 221, 351),
(52, 'Sydney', 222, 352),
(53, 'Melbourne', 223, 353),
(54, 'Toronto', 224, 354),
(55, 'Moscow', 225, 355),
(56, 'Tokyo', 226, 356),
(57, 'Seoul', 227, 357),
(58, 'Dheli', 228, 358),
(59, 'London', 229, 359);

SELECT Customer.Customer_Name, Salesman.Name, Salesman.Country
FROM Customer
JOIN Salesman ON Customer.Customer_Country = Salesman.Country;