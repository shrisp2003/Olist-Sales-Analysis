# Olist-Sales-Analysis
# Project Overview

This project analyzes Olist e-commerce transactional data to evaluate sales performance, customer behavior, and operational efficiency.

The dataset was transformed using a star schema data model in SQL, and key business metrics were visualized in a Power BI executive dashboard.

The objective was to build an end-to-end analytical solution — from raw transactional tables to validated KPIs and business insights.
# Business Objective

Analyze total revenue and sales trends

Evaluate customer purchasing behavior

Measure delivery performance

Identify geographic revenue distribution

Calculate key business KPIs (AOV, ASP, etc.)

Ensure data validation between SQL and Power BI

# Data Modeling (Star Schema)

The dataset was structured using a star schema design to ensure:

Proper aggregation

No double counting

Clear separation of fact and dimension tables

Scalability for reporting

Fact Tables

fact_orders → One row per order

fact_order_items → One row per order-item (transactional grain)

fact_payments → One row per payment

Dimension Tables

dim_customers

dim_products

dim_delivery_days

Model View

# KPIs Calculated

Total Revenue

Total Orders

Total Quantity

Average Order Value (AOV)

Average Selling Price (ASP)

Shipping Contribution %

Monthly Revenue Trend

Revenue by State

# KPI Definitions

Revenue

SELECT SUM(price + freight_value)
FROM order_items;

Average Order Value (AOV)

Revenue / Total Orders

Average Selling Price (ASP)

Revenue / Total Quantity

Revenue was validated in SQL to ensure it matched the Power BI dashboard values.
An initial discrepancy was identified due to model relationship granularity, which was corrected to prevent double counting.

# Dashboard Preview

The Power BI dashboard provides:

Revenue trend analysis

State-wise performance

Customer insights

Order-level KPIs

Delivery performance metrics

# Key Business Insights

Revenue is concentrated in a few major states, indicating geographic dependency.

AOV is higher than ASP, suggesting customers often purchase multiple items per order.

Shipping contributes a measurable portion of total revenue.

Delivery performance varies across regions, impacting customer experience.

# Tools & Technologies

MySQL (Data modeling & KPI validation)

Power BI (Dashboard & visualization)

GitHub (Version control & documentation)

# How to Run This Project

Execute SQL files in the following order:

Dimension tables

Fact tables

KPI calculations

Open the Power BI .pbix file.

Ensure revenue logic matches SQL validation queries.

# Key Learning Outcomes

Implemented star schema modeling from transactional data

Handled fact table granularity issues

Prevented revenue double counting in BI model

Validated KPIs between SQL and Power BI

Built executive-level analytical dashboard
