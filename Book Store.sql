CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

select * from books;
select * from customers;
select * from orders;

-- 1) Retrieve all books in the "Fiction" genre:
SELECT 
    *
FROM
    books
WHERE
    genre = 'Fiction';

-- 2) Find books published after the year 1950:
SELECT 
    *
FROM
    books
WHERE
    Published_Year = 1950;

-- 3) List all customers from the Canada:
SELECT 
    *
FROM
    customers
WHERE
    Country = 'Canada';

-- 4) Show orders placed in November 2023:
SELECT 
    *
FROM
    orders
WHERE
    order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:
SELECT 
    SUM(stock) AS total_stock
FROM
    books;

-- 6) Find the details of the most expensive book:
SELECT 
    *
FROM
    books
ORDER BY price DESC
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT 
    *
FROM
    orders
WHERE
    Quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT 
    *
FROM
    orders
WHERE
    Total_Amount > 20;

-- 9) List all genres available in the Books table:
SELECT DISTINCT
    Genre
FROM
    books;

-- 10) Find the book with the lowest stock:
SELECT 
    *
FROM
    books
ORDER BY stock
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:
SELECT 
    SUM(Total_Amount) AS revenue
FROM
    orders;

-- 1) Retrieve the total number of books sold for each genre:
SELECT 
    b.Genre, SUM(a.Quantity) AS total_book_sold
FROM
    orders a
        JOIN
    books b ON a.Book_ID = b.Book_ID
GROUP BY b.Genre;

-- 2) Find the average price of books in the "Fantasy" genre:
SELECT 
    Genre, AVG(Price) AS avg_price
FROM
    books
WHERE
    Genre = 'Fantasy';

-- 3) List customers who have placed at least 2 orders:
SELECT 
    o.Customer_ID, c.name, COUNT(o.Order_ID) AS order_count
FROM
    orders o
        JOIN
    customers c ON o.Customer_ID = c.Customer_ID
GROUP BY o.Customer_ID , c.name
HAVING COUNT(Order_ID) >= 2;

-- 4) Find the most frequently ordered book:
SELECT 
    o.Book_ID, b.Title, COUNT(Order_ID) AS order_count
FROM
    orders o
        JOIN
    books b ON o.Book_ID = b.Book_ID
GROUP BY o.Book_ID , b.Title
ORDER BY order_count DESC
LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT 
    *
FROM
    books
WHERE
    Genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:
SELECT 
    b.Author, SUM(o.Quantity) Total_Quantity
FROM
    orders o
        JOIN
    books b ON o.Book_ID = b.Book_ID
GROUP BY b.Author;

-- 7) List the cities where customers who spent over $30 are located:
SELECT 
    c.City, o.Total_Amount
FROM
    orders o
        JOIN
    customers c ON o.Customer_ID = c.Customer_ID
WHERE
    o.Total_Amount > 30;

-- 8) Find the customer who spent the most on orders:
SELECT 
    c.Customer_ID, c.Name, SUM(o.Total_Amount) AS Total_Spent
FROM
    orders o
        JOIN
    customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID , c.Name
ORDER BY Total_Spent DESC
LIMIT 1;

-- 9) Calculate the stock remaining after fulfilling all orders:

SELECT 
    b.Book_ID,
    b.Title,
    b.Stock,
    COALESCE(SUM(o.Quantity), 0) AS Order_Quantity,
    b.Stock - COALESCE(SUM(o.Quantity), 0) AS Reamining_Quanity
FROM
    books b
        LEFT JOIN
    orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID
ORDER BY b.Book_ID;	