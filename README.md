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
    - The shop is more frequented by male customers, aging from 25 to 54, this working age group takes up 50% of the customer purchasing data of the shop. This group of customer, by the US census, is known for active participation in the workforce, often with completed education and skills relevant to their careers. They focus on career advancement while balancing family responsibilities and pursuing financial stability. Maintaining health and achieving work-life balance are important priorities for this group. Therefore they are also the grouop to participate the most revenue to the shop. This detail will later come in handy to identify the target group for the marketing team.
    - The ratio between male and female is 3:1, meaning for every 3 male customers, there will be 1 female customer frequent the shop, this is verified by constant result of the calculation in percentage between the genders in sales, categories and items, locations and other criterias. Therefore we're looking at a retail shop that aligns with men fashion and taste, or perhaps suitable for their careers.
    - The top 5 states of the highest revenue are Montana, California, Idaho, Illinois and Nevada. These 5 states share the diverse natural landscape that is suitable for outdoor activities like hiking and skiing, they also boast urban centres like Los Angeles, Chicago, meaning they have centralised source of revenue for the shop. 
 
 * Customer Behaviour insights (purchase frequency, revenue analysis, top selling category and items, review rating):
    - In total, the revenue of this shop is 233k USD. On average, each customer spend roughly around 58-60 USD per transaction, 25 purchases per customer, and 3.7/5 for review rating. 
    - Best selling category, if measured by revenue, is clothing, and within this category, the best selling items are teal pants size M, orange/black skirts size M, yellow shorts size L and green hoodies size M. However since a high revenue can be a result of the high price of each item, therefore we would also measure by how many times customers a category is bought to see which category is actually the one customers most frequently buy, and by this measure, the accessories is the best selling category, and within this category, the best selling items are sunglasses, backpacks, handbags, jewelry and hat, all in the cold tone colours and size M.

 * Marketing insights (discount and promo analysis, subscription analysis regarding promo code used and payment methods and shipping types):
    - Out of 3900 customers, 1677 customers apply discount, and the only discount type is using promo code (verified by the same number in both customer applying discount and customer using promo code), that means 47% of the total customers apply discount. Within this 1677 customers, 1053 customers subscribe to the shop, 624 customers do not subscribe, 819 customers gave a rating that is above 3.75/5 that are also subscribed to the shop. We are looking at only 1/4 of the total customers that can be potential long-term customers of the shop.
    - Out of the 1677 customers, the most preferred payment method is bank transfer, however for the working age group, the most preferred payment method is credit card; the top shipping type is store pickup, top category turns out to be outerwear, and the preferred item is T-shirt and not pants. These insights are different from the insights we pull from only looking at the revenue and profit in age group and gender. This detail will come in handy in coming with the next marketing strategy.
    - The frequency of purchase is nearly equally distributed, but mostly customers will shop once every 3 months, that equal to once for every season.

 * Seasonality insights (most profitable season, category and items analysis throughout each season):
    - The most profitable season is fall, then winter, spring and lastly summer.
    - For fall, the best selling item is black scarf size M. For winter, the best selling item is charcoal pants size M. For both pring and summer, the best selling item is jewelry.
    - However, by payment method and shipping type, spring is the most profitable (by quantity sold) with preferred payment method is credit card and preferred shipping method is 2-day shipping. Next is fall with preferred payment method is venmo and preferred shipping method is express. Next is winter with paying by paypal and standard shipping. Finally, summer with paying by paypal and express shipping.
    - 

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
