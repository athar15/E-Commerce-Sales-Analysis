📊 E-Commerce Sales Analytics Dashboard
End-to-End Data Analytics Project using MYSQL & Power BI

📌 **Project Overview**

This project explores the Brazilian E-Commerce Public Dataset (Olist) to understand key aspects of an online business such as sales performance, customer behavior, product trends, payment patterns, and delivery efficiency.

The goal of this project was to simulate a real-world data analytics workflow—starting from raw transactional data and transforming it into meaningful insights that can support business decisions.

**The project includes:**
Building a relational database in MySQL
Performing business analysis using SQL
Creating KPIs and measures in Power BI using DAX
Designing an interactive dashboard for business insights
By combining SQL analysis with data visualization, the project demonstrates how raw e-commerce data can be turned into actionable insights for decision makers.

| Tool               | Purpose                             |
| ------------------ | ----------------------------------- |
| **MySQL**          | Database design and data storage    |
| **SQL**            | Data cleaning and business analysis |
| **Power BI**       | Interactive dashboard creation      |
| **DAX**            | KPI and measure calculations        |
| **Kaggle Dataset** | Source of the e-commerce data       |


**📂 Dataset Source**

Dataset: Brazilian E-Commerce Public Dataset by Olist
Source: Kaggle
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

**Dataset Highlights**

The dataset includes detailed information about e-commerce transactions in Brazil:
~100,000 orders
~99,000 customers
~112,000 order items
Multiple payment methods
Product categories
Order delivery timestamps and logistics data

This dataset provides a realistic view of how an online marketplace operates.

**🗄 Database Schema**

A relational database was created in MySQL using the following tables:

customers
orders
order_items
products
payments

**Table Relationships**
customers → orders → order_items → products
orders → payments

Primary keys and foreign key relationships were used to model a real transactional e-commerce system.

🔎 **SQL Analysis**

More than 20 SQL queries were written to answer important business questions.

SQL Concepts Used
INNER JOIN and LEFT JOIN
GROUP BY with aggregations
Subqueries

**Business Questions Explored**

What is the total revenue generated?
Which product categories generate the most revenue?
Who are the top customers by revenue contribution?
What does the monthly revenue trend look like?
Which payment methods are most commonly used?
How efficient is the delivery process?

**📊 Power BI Dashboard**
An interactive Power BI dashboard was developed to visualize key metrics and business insights.

**1️⃣ Executive Sales Overview**

This page provides a high-level summary of business performance.
Key KPIs
Total Revenue
Total Orders
Total Customers
Average Order Value

**Visualizations**
Monthly Revenue Trend
Customer Distribution Map
Revenue by State

**2️⃣ Customer & Payment Insights**

This section focuses on customer behavior and payment preferences.

**Visualizations**

Customer Growth Trend
Orders per Customer
Payment Method Distribution
Payment Installment Analysis
Revenue by Payment Type

**3️⃣ Delivery Performance Analysis**

This page analyzes logistics performance and delivery efficiency.

**Visualizations**

Average Delivery Time
Delayed Orders
Delivery Time Distribution
Delivery Performance by Region

**📈 Key Insights from the Analysis**

**💰 Revenue Insights**

The dataset generated over 15 million in total revenue.
A small number of product categories contribute a large portion of sales.

**👥 Customer Behavior**

Most customers place only one order, suggesting potential opportunities to improve customer retention.
A small segment of customers contributes a significant share of total revenue.

**💳 Payment Trends**

Credit cards dominate transactions, indicating strong adoption of digital payments.
Many customers choose installment payments, highlighting the importance of flexible payment options.

**🚚 Delivery Insights**

The average delivery time is around 10–12 days.
Some regions experience longer delivery times, which may indicate logistical challenges.
Delayed deliveries reveal opportunities to optimize supply chain operations.

**📊 Example Dashboard**
Page1: ![Dashboard Preview](https://github.com/athar15/E-Commerce-Sales-Analysis/blob/main/e-commerce%20dashboard%20pg1.png)
Page2: ![Dashboard Preview](https://github.com/athar15/E-Commerce-Sales-Analysis/blob/main/e-commerce%20dashboard%20pg2.png)



**📁 Project Structure**

Ecommerce-Sales-Analysis
│
├── dashboard
│   └── ecommerce_dashboard.pbix
│
├── sql
│   └── ecommerce_analysis_queries.sql
│
├── dataset
│   └── ecommerce_data.csv
│
├── images
│   └── dashboard_screenshots.png
│
└── README.md

**🎯 Skills Demonstrated**

This project highlights several important data analytics skills:
  SQL querying and relational database design
  Data cleaning and transformation
  Business KPI development
  Data visualization and storytelling
  Power BI dashboard development
  Analytical and problem-solving skills



