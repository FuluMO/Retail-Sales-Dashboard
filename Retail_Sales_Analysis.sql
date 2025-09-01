SELECT 
    `Product Category`,
    COUNT(DISTINCT `Transaction ID`) AS Number_of_sales,
    COUNT(DISTINCT `Customer ID`) AS Number_of_customers,
    SUM(`Quantity`) AS Total_quantity,
    SUM(`Price per Unit`) AS Total_price_per_unit,
    SUM(`Total Amount`) AS Total_Revenue,
    dayname(`date`) AS Day,
    date_format(`Date`, 'MMMM') AS Month,
    dayofmonth(`date`) AS Day_of_month,
    CASE 
        WHEN `AGE` BETWEEN 0 AND 18 THEN '0-20:Youth'
        WHEN `AGE` BETWEEN 19 AND 25 THEN '21-30:Young Adult'
        WHEN `AGE` BETWEEN 26 AND 35 THEN '31-45:Adult'
        ELSE '45+:Senior'
    END AS Age_group,
    CASE 
        WHEN dayname(`date`) = 'Saturday' THEN 'Weekend'
        WHEN dayname(`date`) = 'Sunday' THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_type,
    CASE 
        WHEN dayofmonth(`date`) BETWEEN 1 AND 7 THEN 'Early'
        WHEN dayofmonth(`date`) BETWEEN 8 AND 14 THEN 'Mid'
        ELSE 'Late'
    END AS Time_of_month,
    CASE 
    WHEN `Total Amount` BETWEEN 0 AND 100 THEN 'Low'
        WHEN `Total Amount` BETWEEN 101 AND 700 THEN 'Medium'
        ELSE 'High'
    END AS Revenue_group
FROM workspace.default.retail_sales
GROUP BY ALL;

 
