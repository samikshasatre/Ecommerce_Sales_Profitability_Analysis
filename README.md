# Ecommerce_Sales_Profitability_Analysis
E-Commerce Sales &amp; Profitability Analysis
# 📊 E-Commerce Sales & Profitability Analysis
**Author:** Samiksha Satre | MBA in Business Analytics (SPPU)  
**Live Portfolio:** [samiksha-ba-portfolio.vercel.app](https://samiksha-ba-portfolio.vercel.app)  
**Tools Used:** Python (Pandas, NumPy, Matplotlib, Seaborn), SQL (SQLite), Excel / Power BI

> **Dataset Disclaimer:** This case study analyzes a simulated 5,000-order retail e-commerce dataset (`ecommerce_orders_cleaned.csv`) designed to evaluate promotional discount leakage, regional demand, and SKU-level profitability.

---

## 🎯 1. Business Problem & Objectives
High top-line order volume in retail e-commerce frequently masks severe net profit margin erosion caused by uncalibrated promotional discounting and shipping overhead. This analysis answers:
1. Which product categories drive top-line revenue versus actual bottom-line profit?
2. At what promotional discount threshold (`%`) do orders become unprofitable?
3. How do seasonal Q4 promotional campaigns impact net margin?
4. Which regions exhibit the highest revenue and Average Order Value (AOV)?

---

## 📈 2. Executive Visualizations
![Executive Charts](./ecommerce_executive_charts (1).png
)

---

## 💡 3. Key Analytical Findings
* **Category Margin Disparity:** While **Electronics** generates the highest gross revenue share, high cost of goods sold (COGS ~72%) compresses its net margin compared to **Apparel & Accessories** and **Office Supplies**.
* **Promotional Discount Cliff (>20%):** Orders discounted above **20%** experience severe margin erosion, frequently turning net-negative once fulfillment and shipping costs are deducted.
* **November Seasonal Spike:** Order volume peaks in November during seasonal promotions, but aggressive 30%–40% discounting causes weighted net profit margin to dip significantly.
* **Regional Concentration:** The **West** and **North** regions account for over 60% of total revenue.

---

## 🚀 4. Actionable Business Recommendations
1. **Enforce Discount Guardrails:** Cap automated promotional discounts on high-COGS Electronics SKUs at **15%**, replacing deep flat discounts with bundled accessories.
2. **Minimum Order Value (MOV) Thresholds:** Introduce a free-shipping threshold to offset fixed per-order fulfillment costs on low-price items.
3. **Pre-Season Price Elasticity Testing:** Before Q4 flash sales, run controlled A/B tests on 10% vs. 20% discount tiers to maximize net profit rather than gross volume.

---

## 📂 Repository Structure
* `Ecommerce_Sales_Profitability_Analysis.ipynb` — End-to-end Python data preparation, SQL queries, and visualization notebook.
* `ecommerce_orders_cleaned.csv` — Cleaned 5,000-row transaction dataset ready for Power BI / Tableau import.
* `ecommerce_executive_charts.png` — 4-panel executive summary chart output.
