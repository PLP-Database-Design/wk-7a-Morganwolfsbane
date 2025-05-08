QUESTION 1: Achieving 1NF (First Normal Form)
  -- Create normalized tables
CREATE TABLE Orders_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    PRIMARY KEY (OrderID)
);

CREATE TABLE OrderProducts_1NF (
    OrderID INT,
    Product VARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES Orders_1NF(OrderID)
);

-- Insert data into normalized tables
INSERT INTO Orders_1NF (OrderID, CustomerName)
VALUES 
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

INSERT INTO OrderProducts_1NF (OrderID, Product)
VALUES 
    (101, 'Laptop'),
    (101, 'Mouse'),
    (102, 'Tablet'),
    (102, 'Keyboard'),
    (102, 'Mouse'),
    (103, 'Phone');

QUESTION 2: Achieving 2NF (Second Normal Form)
  -- Create normalized tables
CREATE TABLE Customers_2NF (
    CustomerID INT AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Orders_2NF (
    OrderID INT,
    CustomerID INT,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers_2NF(CustomerID)
);

CREATE TABLE OrderItems_2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders_2NF(OrderID)
);

-- Insert data into normalized tables
INSERT INTO Customers_2NF (CustomerName)
VALUES 
    ('John Doe'),
    ('Jane Smith'),
    ('Emily Clark');

INSERT INTO Orders_2NF (OrderID, CustomerID)
VALUES 
    (101, 1),
    (102, 2),
    (103, 3);

INSERT INTO OrderItems_2NF (OrderID, Product, Quantity)
VALUES 
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);
