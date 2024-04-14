--Business question: How should the owner focus its target to drive sales?
---Breaking down this question: 
----What does the customer base look like (Who is most likely to purchase from this shop)? 
----How is their purchase power (how much and how frequent do they shop, by which age group and gender are they)?
----What is the purchase pattern from this customer base? (Their preferences in products, promo, payment and shipping type)
----Where are they based mostly?

--Overview of the database
SELECT *
FROM shopping_trends_updated$

--Demographic, including: Age group, Gender, Location
---Is this shop most likely visited by male or female?
SELECT
    100 * SUM(CASE WHEN gender = 'MALE' THEN 1 ELSE 0 END) / COUNT(*) AS male_percentage,
    100 * SUM(CASE WHEN gender = 'FEMALE' THEN 1 ELSE 0 END) / COUNT(*) AS female_percentage
FROM shopping_trends_updated$;

---What is the proportion of male and female of this shop? By age group?
SELECT
    [Age group],
    100 * SUM(CASE WHEN gender = 'MALE' THEN 1 ELSE 0 END) / COUNT(*) AS male_percentage,
    100 * SUM(CASE WHEN gender = 'FEMALE' THEN 1 ELSE 0 END) / COUNT(*) AS female_percentage
FROM shopping_trends_updated$
GROUP BY [Age group];

---What are the top 5 states with the most customers? What is the proportion of male and female in these 5 states?
SELECT TOP 5 Location, COUNT(*) AS customer_count
FROM shopping_trends_updated$
GROUP BY Location
ORDER BY customer_count DESC;

SELECT 
	Location,
	100 * SUM(CASE WHEN gender = 'MALE' THEN 1 ELSE 0 END) / COUNT(*) AS male_percentage,
	100 * SUM(CASE WHEN gender = 'FEMALE' THEN 1 ELSE 0 END) / COUNT(*) AS female_percentage
FROM shopping_trends_updated$
WHERE Location IN ('Montana', 'California', 'Idaho', 'Illinois', 'Alabama')
GROUP BY Location;

---What is the porportion (in percentage) of each age group?
SELECT 
	[Age group],
    COUNT(*) AS GroupCount,
    ROUND((COUNT(*) * 100) / (SELECT COUNT(*) FROM shopping_trends_updated$), 2) AS Percentage
FROM shopping_trends_updated$
GROUP BY [Age group]
ORDER BY GroupCount DESC;

---Which age group is the most profitable?
SELECT [Age group], SUM([Purchase Amount]) AS Revenue
FROM shopping_trends_updated$
GROUP BY [Age group]
ORDER BY Revenue DESC;

--Metric break down: revenue, number of orders, category, items (colour and size), review rating, subscription, shipping type, discount and promo code, payment method.
---What is the shop's revenue and the number of orders?
SELECT SUM([Purchase Amount]) AS Revenue
FROM shopping_trends_updated$;

SELECT AVG([Previous Purchases]) AS number_of_orders
FROM shopping_trends_updated$;

---What is the top category (by revenue and number of purchases)? What are the top 5 best selling items (its colour and size) of this category? 
-----Top category by revenue and number of purchases
SELECT 
	Category,
	SUM([Purchase Amount]) AS total_purchase_amount
FROM shopping_trends_updated$
GROUP BY Category
ORDER BY total_purchase_amount DESC;

SELECT Category, AVG([Previous Purchases]) AS number_of_purchases
FROM shopping_trends_updated$
GROUP BY Category
ORDER BY number_of_purchases DESC;

-----Top 5 items (by colour and size) in Clothing and Accessories by how many times these items were bought
WITH RankedItems AS (
    SELECT
        [Item Purchased],
        color,
        size,
        COUNT(*) AS purchase_count,
        ROW_NUMBER() OVER (PARTITION BY [Item Purchased] ORDER BY COUNT(*) DESC) AS rn
    FROM
        shopping_trends_updated$
    WHERE
        category = 'Clothing'
    GROUP BY
        [Item Purchased],
        color,
        size
)
SELECT TOP 5
    [Item Purchased] AS item_name,
    color,
    size,
    purchase_count
FROM
    RankedItems
WHERE
    rn = 1
ORDER BY
    purchase_count DESC;

WITH RankedItems AS (
    SELECT
        [Item Purchased],
        color,
        size,
        COUNT(*) AS purchase_count,
        ROW_NUMBER() OVER (PARTITION BY [Item Purchased] ORDER BY COUNT(*) DESC) AS rn
    FROM
        shopping_trends_updated$
    WHERE
        category = 'Accessories'
    GROUP BY
        [Item Purchased],
        color,
        size
)
SELECT TOP 5
    [Item Purchased] AS item_name,
    color,
    size,
    purchase_count
FROM
    RankedItems
WHERE
    rn = 1
ORDER BY
    purchase_count DESC;

---What is the average review rating? How many people use discount? How many use promo code? 
----Why so? -> Answered by: How many people whose review rating above average use discount and promo code?
SELECT AVG([Review Rating]) AS avg_rating
FROM shopping_trends_updated$;

SELECT COUNT(DISTINCT [Customer ID]) AS num_discount_applied
FROM shopping_trends_updated$
WHERE [Discount Applied] = 'Yes';

SELECT COUNT(DISTINCT [Customer ID]) AS num_promo_applied
FROM shopping_trends_updated$
WHERE [Promo Code Used] = 'Yes';

SELECT COUNT(DISTINCT [Customer ID]) AS potential_customer
FROM shopping_trends_updated$
WHERE 
	[Review Rating] >= 3.75
	AND [Promo Code Used] = 'Yes';

---How many people opt in subscription? How many of the subscribed use promo code? How many of the non-subscribed use promo code?
----Why? -> Answered by: What is their preferred payment method? Their preferred shipping type? Their preferred category and items? 
SELECT COUNT(DISTINCT [Customer ID]) AS num_subscribed
FROM shopping_trends_updated$
WHERE [Subscription Status] = 'Yes';

SELECT COUNT(DISTINCT [Customer ID]) AS promo_code_used_subscribed
FROM shopping_trends_updated$
WHERE [Subscription Status] = 'Yes' AND [Promo Code Used] = 'Yes';

SELECT COUNT(DISTINCT [Customer ID]) AS promo_code_used_unsubscribed
FROM shopping_trends_updated$
WHERE [Subscription Status] = 'No' AND [Promo Code Used] = 'Yes';

WITH PaymentCounts AS (
    SELECT [Customer ID], [Payment Method], COUNT(*) AS PaymentCount
    FROM shopping_trends_updated$
    WHERE [Customer ID]IN (SELECT DISTINCT [Customer ID]FROM shopping_trends_updated$ WHERE [Review Rating] >= 3.75 AND [Subscription Status] = 'Yes')
    GROUP BY [Customer ID], [Payment Method]
)
SELECT TOP 1 [Payment Method] AS preferred_payment_method
FROM PaymentCounts
ORDER BY PaymentCount DESC;

WITH ShippingCount AS (
    SELECT [Customer ID], [Shipping Type], COUNT(*) AS ShippingCount
    FROM shopping_trends_updated$
    WHERE [Customer ID] IN (SELECT DISTINCT [Customer ID]FROM shopping_trends_updated$ WHERE [Review Rating] >= 3.75 AND [Subscription Status] = 'Yes')
    GROUP BY [Customer ID], [Shipping Type]
)
SELECT TOP 1 [Shipping Type] AS preferred_shipping_type
FROM ShippingCount
ORDER BY [Shipping Type] DESC;

WITH CategoryCount AS (
    SELECT [Customer ID], Category, COUNT(*) AS CategoryCount
    FROM shopping_trends_updated$
    WHERE [Customer ID] IN (SELECT DISTINCT [Customer ID]FROM shopping_trends_updated$ WHERE [Review Rating] >= 3.75 AND [Subscription Status] = 'Yes')
    GROUP BY [Customer ID], Category
)
SELECT TOP 1 Category AS preferred_category
FROM CategoryCount
ORDER BY Category DESC;

WITH ItemCount AS (
    SELECT [Customer ID], [Item Purchased], COUNT(*) AS CategoryCount
    FROM shopping_trends_updated$
    WHERE [Customer ID] IN (SELECT DISTINCT [Customer ID] FROM shopping_trends_updated$ WHERE [Review Rating] >= 3.75 AND [Subscription Status] = 'Yes')
    GROUP BY [Customer ID], [Item Purchased]
)
SELECT TOP 1 [Item Purchased] AS preferred_item
FROM ItemCount
ORDER BY [Item Purchased] DESC;

---What is the most shopping frequency (rank them)? 
----Why? -> Answered by: For which gender (in percentage)
SELECT 
    [Frequency of Purchases],
    COUNT(DISTINCT [Customer ID]) AS FrequencyCount,
    SUM(CASE WHEN [Gender] = 'Male' THEN 1 ELSE 0 END) AS MaleCount,
    SUM(CASE WHEN [Gender] = 'Female' THEN 1 ELSE 0 END) AS FemaleCount,
    ROUND((SUM(CASE WHEN [Gender] = 'Male' THEN 1 ELSE 0 END) * 100) / COUNT(DISTINCT [Customer ID]), 2) AS MalePercentage,
    ROUND((SUM(CASE WHEN [Gender] = 'Female' THEN 1 ELSE 0 END) * 100) / COUNT(DISTINCT [Customer ID]), 2) AS FemalePercentage
FROM shopping_trends_updated$
GROUP BY [Frequency of Purchases]
ORDER BY FrequencyCount DESC;

--Seasonality: to answer what is the best time to use what type of marketing tactic to drive sales.
---Which season is the most profitable? What is the average review rating for each season?
SELECT 
	Season, 
	AVG([Previous Purchases]) AS avg_num_orders,
	SUM([Purchase Amount]) AS seasonal_revenue,
	AVG([Review Rating]) AS avg_rating
FROM shopping_trends_updated$
GROUP BY Season
ORDER BY Season DESC;

---Which category and item (colour and size) is the best selling by season?
WITH RankedSales AS (
    SELECT 
        Season,
        Category,
        [Item Purchased],
        Color,
        Size,
        SUM([Previous Purchases]) AS TotalQuantitySold,
        ROW_NUMBER() OVER (PARTITION BY Season ORDER BY SUM([Previous Purchases]) DESC) AS Rank
    FROM shopping_trends_updated$
	GROUP BY Season, Category, [Item Purchased], Color, Size
)
SELECT 
    Season,
    Category,
    [Item Purchased],
    Color,
    Size,
    TotalQuantitySold
FROM 
    RankedSales
WHERE 
    Rank <= 5;

---What is the most preferred shipping type and payment method by each season?
WITH RankedShipping AS (
    SELECT 
        Season,
        [Shipping Type],
		[Payment Method],
        SUM([Previous Purchases]) AS TotalQuantitySold,
        ROW_NUMBER() OVER (PARTITION BY Season ORDER BY SUM([Previous Purchases]) DESC) AS Rank
    FROM shopping_trends_updated$
	GROUP BY Season, [Shipping Type], [Payment Method]
)
SELECT 
    Season,
    [Shipping Type],
	[Payment Method],
    TotalQuantitySold
FROM 
    RankedShipping
WHERE 
    Rank <= 5;
---What is the most shopping frequency for each season?
WITH RankedFrequency AS (
    SELECT 
        Season,
        [Frequency of Purchases],
        SUM([Previous Purchases]) AS TotalQuantitySold,
        ROW_NUMBER() OVER (PARTITION BY Season ORDER BY SUM([Previous Purchases]) DESC) AS Rank
    FROM shopping_trends_updated$
	GROUP BY Season, [Frequency of Purchases]
)
SELECT 
    Season,
    [Frequency of Purchases],
    TotalQuantitySold
FROM 
    RankedFrequency
WHERE 
    Rank <= 5;

--Geography: to answer where should the owner focus its effort?
---Which state is driving the most sales, by revenue and by number of orders?
----Why? -> Answered by the proportion of age and gender
SELECT 
	Location,
	SUM([Previous Purchases]) AS TotalQuantitySold,
	SUM([Purchase Amount]) AS TotalSales,
    SUM(CASE WHEN [Gender] = 'Male' THEN 1 ELSE 0 END) AS MaleCount,
    SUM(CASE WHEN [Gender] = 'Female' THEN 1 ELSE 0 END) AS FemaleCount,
    ROUND((SUM(CASE WHEN [Gender] = 'Male' THEN 1 ELSE 0 END) * 100) / COUNT(DISTINCT [Customer ID]), 2) AS MalePercentage,
    ROUND((SUM(CASE WHEN [Gender] = 'Female' THEN 1 ELSE 0 END) * 100) / COUNT(DISTINCT [Customer ID]), 2) AS FemalePercentage
FROM shopping_trends_updated$
GROUP BY Location
ORDER BY TotalSales DESC;

SELECT 
	Location,
	SUM([Previous Purchases]) AS TotalQuantitySold,
	SUM([Purchase Amount]) AS TotalSales,
    SUM(CASE WHEN [Age group] = 'Young Adult' THEN 1 ELSE 0 END) AS YoungAdultCount,
    SUM(CASE WHEN [Age group] = 'Working Age' THEN 1 ELSE 0 END) AS WorkingAgeCount,
	SUM(CASE WHEN [Age group] = 'Mature Working Age' THEN 1 ELSE 0 END) AS MatureWorkingAgeCount,
    SUM(CASE WHEN [Age group] = 'Elderly' THEN 1 ELSE 0 END) AS ElderlyCount,
    ROUND((SUM(CASE WHEN [Age group] = 'Young Adult' THEN 1 ELSE 0 END) * 100) / COUNT(DISTINCT [Customer ID]), 2) AS YoungAdultPercentage,
    ROUND((SUM(CASE WHEN [Age group] = 'Working Age' THEN 1 ELSE 0 END) * 100) / COUNT(DISTINCT [Customer ID]), 2) AS WorkingAgePercentage,
	ROUND((SUM(CASE WHEN [Age group] = 'Mature Working Age' THEN 1 ELSE 0 END) * 100) / COUNT(DISTINCT [Customer ID]), 2) AS MatureWorkingAgePercentage,
    ROUND((SUM(CASE WHEN [Age group] = 'Elderly' THEN 1 ELSE 0 END) * 100) / COUNT(DISTINCT [Customer ID]), 2) AS ElderlyPercentage
FROM shopping_trends_updated$
GROUP BY Location
ORDER BY TotalSales DESC;


