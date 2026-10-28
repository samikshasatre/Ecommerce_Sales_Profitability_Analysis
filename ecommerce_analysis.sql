-- =============================================================================
-- E-COMMERCE SALES & PROFITABILITY ANALYSIS — SQL SCRIPT
-- Author : Samiksha Satre | MBA in Business Analytics (SPPU)
-- =============================================================================

-- 1. EXECUTIVE KPI SUMMARY
SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(net_revenue), 2) AS total_net_revenue,
    ROUND(SUM(net_profit), 2) AS total_net_profit,
    ROUND((SUM(net_profit) * 100.0) / NULLIF(SUM(net_revenue), 0), 2) AS weighted_profit_margin_pct,
    ROUND(SUM(net_revenue) / COUNT(DISTINCT order_id), 2) AS average_order_value_inr
FROM ecommerce_orders;

-- 2. DISCOUNT BAND THRESHOLD ANALYSIS (CTE + Window Functions)
WITH discount_band_cte AS (
    SELECT 
        CASE 
            WHEN discount_pct = 0 THEN '1. 0% (No Discount)'
            WHEN discount_pct <= 0.10 THEN '2. 1% - 10% (Low Discount)'
            WHEN discount_pct <= 0.20 THEN '3. 11% - 20% (Moderate Discount)'
            ELSE '4. >20% (High Discount - Margin Leakage)'
        END AS discount_tier,
        COUNT(order_id) AS order_count,
        ROUND(SUM(net_revenue), 2) AS total_net_revenue,
        ROUND(SUM(net_profit), 2) AS total_net_profit,
        ROUND((SUM(net_profit) * 100.0) / SUM(net_revenue), 2) AS weighted_margin_pct
    FROM ecommerce_orders
    GROUP BY 1
)
SELECT 
    discount_tier,
    order_count,
    ROUND((order_count * 100.0) / SUM(order_count) OVER (), 1) AS order_volume_share_pct,
    total_net_revenue,
    total_net_profit,
    ROUND((total_net_profit * 100.0) / SUM(total_net_profit) OVER (), 1) AS profit_share_pct,
    weighted_margin_pct
FROM discount_band_cte
ORDER BY discount_tier;

-- 3. CATEGORY PERFORMANCE VS TARGET BENCHMARKS (INNER JOIN + RANK)
SELECT 
    o.category,
    t.department_head,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.net_revenue), 2) AS category_revenue,
    ROUND(SUM(o.net_profit), 2) AS category_profit,
    ROUND((SUM(o.net_profit) * 100.0) / SUM(o.net_revenue), 2) AS actual_margin_pct,
    t.target_margin_pct,
    RANK() OVER (ORDER BY SUM(o.net_profit) DESC) AS profit_contribution_rank
FROM ecommerce_orders o
INNER JOIN category_targets t ON o.category = t.category
GROUP BY o.category, t.department_head, t.target_margin_pct
ORDER BY category_revenue DESC;
