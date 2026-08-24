# Project Overview

## 1. Introduction

This project performs SQL-based data analysis on an e-commerce dataset to understand customer behavior, sales trends, delivery performance, and payment patterns.

The dataset contains information about customers, orders, payments, products, sellers, reviews, and geolocation data. Using SQL queries, the project explores the dataset and extracts meaningful business insights.

The goal of the analysis is to help businesses understand purchasing patterns and improve operational decision-making.

---

# 2. Dataset Description

The dataset includes the following tables:

| Table Name | Description |
|------------|-------------|
| customers | Contains customer information such as location and unique customer ID |
| orders | Contains order details including purchase time and delivery dates |
| order_items | Details of products included in each order |
| payments | Payment information for each order |
| products | Product characteristics |
| sellers | Seller information |
| order_reviews | Customer reviews for orders |
| geolocation | Location data for customers and sellers |


---

# 3. Database Schema

The dataset consists of multiple related tables connected using foreign keys such as:

- `order_id`
- `customer_id`
- `product_id`
- `seller_id`
- `zip_code_prefix`

These relationships allow the dataset to be analyzed using joins between tables.

---

# 4. Exploratory Data Analysis

Initial exploration of the dataset was performed to understand the structure and characteristics of the data.

Key checks included:

- Data types of columns
- Time range of orders
- Distribution of customers across cities and states
- Order status distribution
- Order frequency over time

The analysis showed that the dataset contains orders from **September 2016 to October 2018**.

---

# 5. Business Questions Addressed

Several business questions were analyzed using SQL queries:

### Order Trends
- Is the number of orders increasing over time?
- Are there seasonal trends in monthly orders?

### Customer Behavior
- What time of the day do customers place most orders?
- How are customers distributed across different states?

### Sales & Revenue
- What is the total and average order value by state?
- How has the cost of orders increased over time?

### Delivery Performance
- What is the average delivery time?
- Which states have the fastest and slowest delivery times?

### Payment Analysis
- Which payment methods are most commonly used?
- How do payment installments affect order volume?

---

# 6. Key Insights

Some major insights discovered from the analysis:

• Orders increased significantly between 2016 and 2018, indicating growing e-commerce adoption.

• Afternoon and evening are the most active times for customers placing orders.

• Certain states have significantly higher order volumes than others.

• Freight costs and delivery times vary across different regions.

• Multiple payment installments are frequently used by customers.

---

# 7. Recommendations

Based on the analysis, the following recommendations were identified:

• Increase promotional campaigns during peak shopping hours (afternoon and evening).

• Improve logistics infrastructure in regions with high delivery times.

• Focus marketing efforts on states with lower customer penetration.

• Optimize freight costs by analyzing shipping routes and warehouse placement.

---

# 8. Tools Used

The following tools were used in this project:

- SQL
- BigQuery / PostgreSQL
- VS Code
- GitHub

---

# 9. Project Structure

SQL-Data-Analysis-Project
│
├── data
├── schema
├── sql_queries
├── insights-recommendations
├── project_overview
└── README.md

---

# 10. Conclusion

This project demonstrates how SQL can be used to analyze large datasets and generate valuable business insights. By combining data exploration, analytical queries, and business interpretation, organizations can make data-driven decisions to improve customer experience and operational efficiency.