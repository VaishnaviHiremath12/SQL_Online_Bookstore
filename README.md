# SLQ_Online_Bookstore

# Project overview
The **Online Bookstore SQL Project** aims to design and implement a **relational database** for managing an e-commerce bookstore using **pure SQL**.
Key Goals:
- Demonstrate **database design** with normalized tables, primary/foreign keys, and data integrity.
- Implement **real-world business logic** using SQL queries, aggregations, joins, and subqueries.
- Simulate **core e-commerce operations** such as:
  - Book catalog management
  - Customer order tracking
  - Inventory control
  - Sales analytics and reporting
  
# Database Tables
| Table Name | Purpose |
|-----------|--------|
| `MIRAJ`   | Stores book details (`BOOK_ID`, `TITLE`, `GENRE`, `PRICE`, `STOCK`, `PUBLISHED_YEAR`, `AUTHOR`) |
| `SAPNA`   | Stores customer info (`CUSTOMER_ID`, `NAME`, `COUNTRY`, `CITY`) |
| `ORD`     | Stores order details (`ORDER_ID`, `CUSTOMER_ID`, `BOOK_ID`, `QUANTITY`, `ORDER_DATE`, `TOTAL_AMOUNT`) |

# 20 Business Questions & SQL Queries
| 1 | Retrieve all books in the "Fiction" genre |
| 2 | Find books published after the year 1950 | 
| 3 | List all customers from Canada | 
| 4 | Show orders placed in November 2023 | 
| 5 | Retrieve the total stock of all books | 
| 6 | Find the most expensive book | 
| 7 | Show orders where quantity > 1 | 
| 8 | Retrieve orders with total amount > 20 | 
| 9 | List all unique genres | 
| 10 | Find the book with the lowest stock | 
| 11 | Calculate total revenue from all orders | 
| 12 | Total books sold per genre | 
| 13 | Average price of "Fantasy" books | 
| 14 | Customers who placed at least 2 orders | 
| 15 | Most frequently ordered book | 
| 16 | Top 3 most expensive "Fantasy" books | 
| 17 | Total books sold by each author | 
| 18 | Cities of customers who spent over $30 | 
| 19 | Customer who spent the most | 
| 20 | Remaining stock after all orders |

# Conclusion
This **SQL Online Bookstore Project** successfully demonstrates:
- **Effective database design** with proper relationships and normalization.
- **Proficiency in SQL** through:
  - Filtering & sorting
  - Aggregation (`SUM`, `COUNT`, `AVG`)
  - Joins (`INNER`, `LEFT`)
  - Grouping & filtering with `HAVING`
  - Handling nulls with `IFNULL`
- **Real-world applicability** — queries mirror actual business intelligence needs like:
  - Inventory tracking
  - Sales performance
  - Customer behavior analysis
