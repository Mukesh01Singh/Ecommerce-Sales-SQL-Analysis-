# 📊 SQL Data Analysis Project – E-commerce Dataset

## 📌 Project Overview

This project performs **end-to-end data analysis using SQL** on a Brazilian e-commerce dataset to uncover insights about customer behavior, sales performance, delivery efficiency, and payment trends.

The analysis simulates real-world business scenarios where data analysts use SQL to answer strategic questions that support **data-driven decision making**.

Through exploratory analysis, advanced SQL queries, and business interpretation, this project demonstrates how raw data can be transformed into **actionable insights**.

---

# 🎯 Business Objectives

The main objectives of this project are to:

* Understand **customer purchasing behavior**
* Analyze **sales trends over time**
* Evaluate **delivery performance**
* Study **payment patterns and installment usage**
* Identify **regional performance differences**
* Generate **data-driven recommendations**

---

# 🗂 Dataset Description

The dataset contains information about customers, orders, products, payments, and logistics from a Brazilian e-commerce platform.

| Table         | Description                                        |
| ------------- | -------------------------------------------------- |
| customers     | Customer ID, location, and demographic information |
| orders        | Order timestamps, status, and delivery details     |
| order_items   | Products included in each order                    |
| payments      | Payment type, installments, and payment value      |
| products      | Product category and attributes                    |
| sellers       | Seller information                                 |
| order_reviews | Customer review scores                             |
| geolocation   | Geographic location data                           |

---

# 🗄 Database Schema

The database consists of multiple related tables connected through keys such as:

* `order_id`
* `customer_id`
* `product_id`
* `seller_id`
* `zip_code_prefix`

Schema Diagram:


[schema/database_schema.png](schema/database_schema.png)


---

# 📈 Key Business Questions Answered

### Customer Behavior

* What time of day do customers place the most orders?
* How are customers distributed across different states?

### Sales & Revenue

* What is the total and average order value by region?
* How has the cost of orders evolved over time?

### Order Trends

* Is there a growing trend in the number of orders?
* Is there monthly seasonality in customer purchases?

### Logistics & Delivery

* What is the average delivery time for orders?
* Which states have the fastest and slowest delivery performance?

### Payment Behavior

* What payment methods are most frequently used?
* How many installments do customers typically choose?

---

# 🔍 Key Insights

Some important findings from the analysis:

✔ Orders increased significantly from **2016 to 2018**, indicating rapid e-commerce growth.

✔ Most orders are placed during the **afternoon and evening**, suggesting peak customer activity during these hours.

✔ Certain states show **higher sales volume**, indicating strong regional demand.

✔ Freight costs and delivery times vary significantly across regions.

✔ Customers frequently use **payment installments**, reflecting purchasing behavior in online retail.

---

# 💡 Business Recommendations

Based on the analysis, the following recommendations were identified:

* Increase marketing campaigns during **peak purchasing hours**.
* Improve logistics infrastructure in regions with **longer delivery times**.
* Focus customer acquisition strategies in **low-penetration regions**.
* Optimize freight costs by improving warehouse and shipping networks.

---

# 🛠 Tools & Technologies

* SQL
* Google BigQuery / PostgreSQL
* VS Code
* Git & GitHub

---

# 📂 Project Structure

```
SQL-Data-Analysis-Project
│
├── data
│   └── raw datasets
│
├── schema
│   └── database_schema.png
│
├── sql_queries
│   ├── business-question.sql
│   ├── queries.sql
│
├── insights-recommendations
│   └── business_report.pdf
│
├── project_overview.md
│   
└── README.md
```

---

# 📊 Skills Demonstrated

This project demonstrates the following **Data Analyst skills**:

* SQL Data Exploration
* Data Cleaning & Validation
* Joins and Aggregations
* Window Functions
* Business Data Analysis
* Data-Driven Decision Making
* Documentation & Project Structuring

---

# 🚀 Future Improvements

Potential improvements for this project include:

* Creating **interactive dashboards in Power BI or Tableau**
* Performing **customer segmentation analysis**
* Conducting **product category performance analysis**
* Building **predictive models for sales forecasting**

---

# 👤 Author

**Shubham Gupta**

Aspiring **Data Analyst** passionate about turning raw data into meaningful insights.

---

⭐ If you like this project, feel free to **star the repository**.

---

# 📬 Contact

[LinkedIn](https://www.linkedin.com/in/theshubhamguptaa/) ,
[GitHub](https://github.com/theShubhmGupta)
