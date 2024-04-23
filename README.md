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
    - The shop attracts predominantly male customers aged 25-54, representing 50% of purchases. They prioritize career advancement, family balance, and financial stability.
    - The male-to-female ratio is 3:1, indicating a focus on men's fashion or career-related items.
    - Top revenue-generating states include Montana, California, Idaho, Illinois, and Nevada, known for outdoor activities and urban centres.
 
 * Customer Behaviour insights (purchase frequency, revenue analysis, top selling category and items, review rating):
    - Average customer spend is £58-60, with 25 purchases per customer and an average review rating of 3.7/5.
    - Clothing is the top-selling category by revenue, but accessories are most frequently bought.
    - Nearly half of customers (47%) use discounts, with a quarter subscribing to the shop for potential long-term engagement.
    - Payment methods vary; credit cards are preferred by the working age group, while bank transfers are most common overall.
    - Customers shop approximately once every three months, aligning with seasonal changes.

 * Marketing insights:
    - Fall is the most profitable season, followed by winter, spring, and summer.
    - Seasonal preferences vary by payment and shipping methods; spring sees the highest sales volume, with credit cards and 2-day shipping being preferred.
    - Analysis of payment methods and shipping types reveals insights different from revenue-focused demographics.

 * Seasonality insights (most profitable season, category and items analysis throughout each season):
    - The most profitable season is fall, then winter, spring and lastly summer.
    - For fall, the best selling item is black scarf size M. For winter, the best selling item is charcoal pants size M. For both pring and summer, the best selling item is jewelry.
    - However, by payment method and shipping type, spring is the most profitable (by quantity sold) with preferred payment method is credit card and preferred shipping method is 2-day shipping. Next is fall with preferred payment method is venmo and preferred shipping method is express. Next is winter with paying by paypal and standard shipping. Finally, summer with paying by paypal and express shipping.

![Final dashboard on Power BI to visualise the customer trends regarding a retail shop based in the US](https://github.com/hoangkhanhphuongdang/retail-customer-trends-analysis/blob/main/customer-shopping-trend-report%20-%20Final.jpg)

**Possible business recommendation and further analysis**:

**Business recommendation**
1. **Targeted Marketing**: Focus on males aged 25-54, emphasising their lifestyle and fashion preferences. Highlight accessories in cold tones, size M.
2. **Customer Engagement**: Create loyalty programmes for potential long-term customers. Use positive reviews for credibility and offer personalised promotions.
3. **Payment and Shipping Optimisation**: Prioritise credit card payments and adjust shipping methods based on seasonality.
4. **Seasonal Product Planning**: Stock best-selling items for each season and align marketing efforts with profitable seasons.

**Further analysis**:
1. **Market Segmentation**: Explore subgroups within the male demographic (25-54) based on profession, income, or interests.
2. **Customer Lifetime Value (CLV)**: Calculate CLV for different segments to prioritise marketing efforts.
3. **Competitive Analysis**: Evaluate competitors to identify opportunities for differentiation.
4. **Product Mix Optimisation**: Identify underperforming products and opportunities for expansion.
5. **Channel Analysis**: Assess sales channels to optimise resource allocation.
6. **Customer Feedback Analysis**: Extract insights from reviews to improve products and service.
7. **Promotion Effectiveness**: Test different promotions to identify the most effective strategies.
