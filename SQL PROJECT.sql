create database BOOK;
USE BOOK;

SELECT * FROM BOOKS;
SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

create table Miraj (
Book_ID SERIAL primary key,
Title varchar(50),
Author varchar(50),
Genre varchar(50),
Published_year int,
Price float,
stock int
);

CREATE TABLE SAPNA (
Customer_ID INT PRIMARY KEY,
Name VARCHAR(50),
Email VARCHAR(50),
Phone INT,books
City VARCHAR(50),
Country VARCHAR(50)
);

CREATE TABLE ORD (
Order_ID INT PRIMARY KEY,
Customer_ID	INT REFERENCES SAPNA(CUSTOMER_ID),
Book_ID	INT REFERENCES MIRAJ(BOOK_ID),
Order_Date DATE,
Quantity INT,
Total_Amount FLOAT
);

SELECT * FROM MIRAJ;
SELECT * FROM SAPNA;
SELECT * FROM ORD;

-- 1) Retrieve all books in the "Fiction" genre --
SELECT * FROM MIRAJ WHERE GENRE="FICTION";

-- 2) Find books published after the year 1950 --
SELECT * FROM MIRAJ WHERE PUBLISHED_YEAR>=1950;

-- 3)List all customers from the Canada --
SELECT * FROM SAPNA WHERE COUNTRY="CANADA";

-- 4)Show orders placed in November 2023 --
SELECT * FROM ORD WHERE ORDER_DATE BETWEEN "2023-11-01" AND "2023-11-30";

-- 5)Retrieve the total stock of books available --
SELECT SUM(STOCK) FROM MIRAJ;

-- 6)Find the details of the most expensive book --
SELECT * FROM MIRAJ ORDER BY PRICE DESC LIMIT 1;

-- 7)Show all customers who ordered more than 1 quantity of a book --
SELECT * FROM ORD WHERE QUANTITY>1;

-- 8)Retrieve all orders where the total amount exceeds 20 --
SELECT * FROM ORD WHERE TOTAL_AMOUNT>20;

-- 9)List all genres available in the Books table --
SELECT genre FROM MIRAJ;

-- 10)Find the book with the lowest stock --
select min(stock) from miraj;

-- 11)Calculate the total revenue generated from all orders --
SELECT SUM(TOTAL_AMOUNT) FROM ORD;

--  12)Retrieve the total number of books sold for each genre --
SELECT GENRE,SUM(QUANTITY) AS "TOTAL NO OF BOOKS SOLD"
FROM ORD AS O
INNER JOIN MIRAJ AS B
ON O.BOOK_ID=B.BOOK_ID
GROUP BY GENRE;

-- 13)Find the average price of books in the "Fantasy" genre --
SELECT AVG(PRICE)
FROM MIRAJ
WHERE GENRE="FANTASY";

-- 14)List customers who have placed at least 2 orders -- 
SELECT CUSTOMER_ID FROM ORD
WHERE QUANTITY>=2;

-- 15)Find the most frequently ordered book --
SELECT 
    B.TITLE,
    COUNT(O.ORDER_ID) AS ORDER_COUNT
FROM 
    MIRAJ AS B
INNER JOIN 
    ORD AS O
ON 
    B.BOOK_ID = O.BOOK_ID
GROUP BY 
    B.BOOK_ID, B.TITLE
ORDER BY 
    ORDER_COUNT DESC
LIMIT 1;

-- 16)Show the top 3 most expensive books of 'Fantasy' Genre --
SELECT TITLE
FROM MIRAJ
WHERE GENRE ="FANTASY"
ORDER BY PRICE DESC LIMIT 3;

-- 17)Retrieve the total quantity of books sold by each author --
SELECT SUM(QUANTITY)
FROM ORD AS O
INNER JOIN MIRAJ AS B
ON O.BOOK_ID=B.BOOK_ID
group by AUTHOR;

-- 18)List the cities where customers who spent over $30 are located --
SELECT DISTINCT CITY,TOTAL_AMOUNT
FROM SAPNA AS C
INNER JOIN ORD AS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE TOTAL_AMOUNT>=30;

-- 19)Find the customer who spent the most on orders --
SELECT 
    C.CUSTOMER_ID,
    C.NAME,
    SUM(O.TOTAL_AMOUNT) AS TOTAL_SPENT
FROM 
    ORD AS O
INNER JOIN 
    SAPNA AS C
ON 
    O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY 
    C.CUSTOMER_ID, C.NAME
ORDER BY 
    TOTAL_SPENT DESC
LIMIT 1;

-- 20)Calculate the stock remaining after fulfilling all orders --
SELECT 
    B.BOOK_ID,
    B.STOCK,
    IFNULL(SUM(O.QUANTITY), 0) AS TOTAL_ORDERED,
    (B.STOCK - IFNULL(SUM(O.QUANTITY), 0)) AS STOCK_REMAINING
FROM 
    MIRAJ AS B
LEFT JOIN 
    ORD AS O
ON 
    B.BOOK_ID = O.BOOK_ID
GROUP BY 
    B.BOOK_ID, B.STOCK;

