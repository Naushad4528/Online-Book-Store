# 📚 Book Store Database Project (SQL)

This repository contains SQL queries designed to manage and analyze data for a **Book Store Management System**. 
The queries help simulate common operations such as managing inventory, sales, customers, and authors.

## 🗂️ What's Inside

- ✅ Table creation statements
- ✅ Data insertion scripts
- ✅ Querying for book sales, customer info, and inventory
- ✅ Joins, aggregations, and conditional logic
- ✅ Basic reporting queries

> All SQL scripts are included in the file: `Book Store.sql`

## 🔧 Features Covered

- 📘 **Books Management**
- 🧑‍💼 **Customers and Orders**
- 🧾 **Sales Reports**
- 🛒 **Inventory Checks**
- 📊 **Revenue Calculations**
- 📚 **Author Details**

## 💻 Technologies Used

- **SQL (Structured Query Language)**
- Compatible with:
  - MySQL
  - PostgreSQL
  - SQL Server (minor tweaks may be needed)

## 📌 Sample Queries Included

```sql
-- Total sales by each author
SELECT author_name, SUM(price) AS total_sales
FROM books
JOIN authors ON books.author_id = authors.author_id
GROUP BY author_name;

-- Top 5 bestselling books
SELECT title, COUNT(*) AS copies_sold
FROM orders
JOIN books ON orders.book_id = books.book_id
GROUP BY title
ORDER BY copies_sold DESC
LIMIT 5;

📁 How to Use
Clone this repository.

Open Book Store.sql in your SQL editor.

Run the scripts sequentially to create the database and tables.

Modify or extend the queries for your specific use case.

🚀 Use Case Ideas
Bookstore inventory & sales management system

Academic SQL practice project

Backend logic for bookstore applications

Practice for joins, grouping, and subqueries

Created with ❤️ by [Naushad Saifi]
Feel free to fork the repo, suggest improvements, or use it in your own projects.

#SQL #DatabaseProject #BookStore #SQLQueries #SQLPractice #DataManagement #BookStoreDB #GitHubProjects

