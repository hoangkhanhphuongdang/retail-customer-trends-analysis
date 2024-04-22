# Retail Customer Trend Analysis

## This project is an exploratory data analysis focusing on the customer trends throughout the seasons, from there can we make any business recommendations on how should the owner focus their target to drive sales.

**Context of this analysis**: this is a retail clothing shop (both online and offline) based in the US with 3900 customers' purchases recorded throughout the seasons. The business question is how the marketing team can help the business owner to decide where and how the shop should focus their effort on to drive more sales.

To tackle this business question, we break it down to four smaller questions:
  * What does the customer base look like? (Who is most likely to buy from this shop?)
  * What is their purchase power? (How much and how frequent do they shop, by which age group and gender are they?)
  * What is their purchase pattern? (What is their preference in the shop's items, promo, payment method, shipping type?)
  * Where are they based mostly?

**Tool used**: Microsoft Excel, Microsoft SQL Server Management, Microsoft Power BI.

**Code**: [Customer Trend Analysis](https://github.com/hoangkhanhphuongdang/retail-customer-trends-analysis/blob/main/retail-sales-analysis.sql)

**SKills**: Data Cleaning (via Excel), Exploratory Data Analysis, CTES's, Window Functions, Aggregate Functions, Data Visualisation (using Power BI).

**Results**:
 * Demographic insights (gender, age group distributions and geographical focus):
    - The shop is more frequented by male customers, aging from 25 to 54, this working age group takes up 50% of the customer purchasing data of the shop. This group of customer, by the US census, is known for active participation in the workforce, often with completed education and skills relevant to their careers. They focus on career advancement while balancing family responsibilities and pursuing financial stability. Maintaining health and achieving work-life balance are important priorities for this group.This detail will later come in handy to identify the target group for the marketing team.
    - The ratio between male and female is 3:1, meaning for every 3 male customers, there will be 1 female customer frequent the shop, this is verified by constant result of the calculation in percentage between the genders in sales, categories and items, locations and other criterias. Therefore we're looking at a retail shop that aligns with men fashion and taste, or perhaps suitable for their careers.
    - The top 5 states of the highest revenue are Montana, California, Idaho, Illinois and Alabama. These 5 states share the diverse natural landscape that is suitable for outdoor activities like hiking and skiing, they also boast urban centres like Los Angeles, Chicago and Boise, meaning they have centralised source of revenue for the shop. 
 * Customer Behaviour insights (purchase frequency, revenue analysis, top selling category and items, review rating):
    - In total, the revenue of this shop is 233k USD. On average, each customer spend roughly around 58-60 USD per purchase, 25 purchases per customer, and 3.7/5 for review rating.
    - Best selling category, if measured by revenue, is clothing, and within this category, the best selling items are teal pants size M, orange/black skirts size M, yellow shorts size L and green hoodies size M. However since a high revenue can be a result of the high price of each item, therefore we would also measure by how many times customers buy from a category to see which category is actually the one customers most frequently buy, and by this measure, the accessories is the best selling category, and within this category, the best selling items are sunglasses, backpacks, handbags, jewelry and hat, all in the cold tone colours and size M.
 * Marketing insights (discount and promo analysis, subscription analysis regarding promo code used and payment methods and shipping types):
 * Seasonality insights (most profitable season, category and items analysis throughout each season):

![Final dashboard on Power BI to visualise the customer trends regarding a retail shop based in the US](https://github.com/hoangkhanhphuongdang/retail-customer-trends-analysis/blob/main/customer-shopping-trend-report%20-%20Final.jpg)

**Possible business recommendation and further analysis**:
