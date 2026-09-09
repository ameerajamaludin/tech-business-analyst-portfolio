# Business Insights

Use this file to document the result and business interpretation of each completed mission.

## Level 1 — SQL Foundations

### How many users do we have?
Result: 20 users

### 2. How many orders do we have?
Result: 25 orders

### 3. What are our 10 most expensive products?

The 10 products with the highest listed prices were identified by
sorting the product catalogue by price in descending order.

 most_expensive_products | price                                                                                     
-------------------------+--------
 Eau de Parfum           | 110.00
 Ceramic Hair Styler     |  95.00
 Structured Tote Bag     |  85.00
 Wide Leg Trousers       |  55.00
 Classic White Shirt     |  45.00
 Vitamin C Serum         |  32.00
 Repair Hair Mask        |  28.00
 Daily Sunscreen SPF50   |  25.00
 Body Scrub              |  24.00
 Lengthening Mascara     |  22.00

## Level 2 — Revenue Analysis

### How much revenue did we generate?
Completed orders generated 1,757.00 in revenue.

### What is our revenue by month?
         month          | total_revenue                                                                              
------------------------+---------------
 2026-01-01 00:00:00+08 |        191.00
 2026-02-01 00:00:00+08 |        255.00
 2026-03-01 00:00:00+08 |        325.00
 2026-04-01 00:00:00+08 |        279.00
 2026-05-01 00:00:00+08 |        448.00
 2026-06-01 00:00:00+08 |        259.00

Revenue was highest in May 2026, reaching 448.00.
The lowest monthly revenue was recorded in January 2026 at 191.00.

### What is our revenue by product category?
 category  | total_revenue                                                                                           
-----------+---------------
 Fashion   |        540.00
 Fragrance |        330.00
 Haircare  |        310.00
 Skincare  |        289.00
 Makeup    |        159.00
 Bodycare  |        129.00

Fashion was the highest-revenue category, generating 540.00.
This was followed by Fragrance at 330.00 and Haircare at 310.00.

### Which country generates the most revenue?
  country  | total_revenue                                                                                           
-----------+---------------
 Malaysia  |        955.00
 Singapore |        420.00
 Thailand  |        195.00
 Indonesia |        187.00

Malaysia generated the most revenue at 955.00, contributing more than any other market in the dataset while Singapore ranked second at 420.00.

## Level 3 — Business Performance

### What is our average order value?

The average value of a completed order is 76.39.

### Which acquisition channel generates the most customers?
acquisition_channel| total_customers   
---------------------+-----------------
 Paid Search         |               4
 Referral            |               4
 TikTok              |               4
 Organic Search      |               4
 Instagram           |               4


Each acquisition channel contributed 4 customers, which means customer acquisition is evenly distributed across Organic Search, Paid Search, Referral, Instagram, and TikTok in this dataset. Therefore, there is no single leading acquisition channel based on customer volume alone.

### Which acquisition channel generates the most revenue?
 acquisition_channel | total_revenue                                                                             
---------------------+---------------
 Organic Search      |        561.00
 Paid Search         |        441.00
 Referral            |        312.00
 Instagram           |        223.00
 TikTok              |        220.00

Organic Search generated the highest revenue at 561.00, followed by Paid Search at 441.00
This suggests that customer volume alone does not indicate the value of an acquisition channel. Despite acquiring the same number of customers, users from different channels generated different levels of revenue.

### What percentage of users actually make a purchase?

85% of registered users made at least one completed purchase.

This indicates the proportion of the registered user base that converted into purchasing customers. The remaining users did not have a completed order during the period represented by the dataset.

Further analysis could examine whether purchase rates differ by acquisition channel, signup period, or country.

## Level 4 — Customer Analysis

### Who are our repeat customers?

 user_id | completed_orders                                                                                          
---------+------------------
       1 |                3
       3 |                3
       2 |                2
       5 |                2

4 customers made at least 2 completed purchases. Users 1 and 3 were the most frequent repeat customers, with 3 completed orders each, while users 2 and 5 completed 2 orders each.

This shows that repeat purchasing exists within the customer base, although it is concentrated among a relatively small group of customers.

### What is our repeat purchase rate?

The repeat purchase rate is 23.53, which is approximately 1 in 4 purchasing customers made at least two completed purchases.

### How many new users do we acquire each month?

signup_month            | new_users                                                                                  
------------------------+-----------
 2026-01-01 00:00:00+08 |         5
 2026-02-01 00:00:00+08 |         5
 2026-03-01 00:00:00+08 |         5
 2026-04-01 00:00:00+08 |         3
 2026-05-01 00:00:00+08 |         2

 New user acquisition remained stable at 5 users per month from January through March, before declining to 3 in April and 2 in May.

The dataset shows a downward trend in new registrations during the later months. However, additional data would be required to determine whether this represents a sustained decline or normal variation.

### What is our Monthly Active Users (MAU)?

month                   |mau                                                                                        
------------------------+-----
 2026-01-01 00:00:00+08 |   3
 2026-02-01 00:00:00+08 |   3
 2026-03-01 00:00:00+08 |   5
 2026-04-01 00:00:00+08 |   4
 2026-05-01 00:00:00+08 |   5
 2026-06-01 00:00:00+08 |   3

For this analysis, an active user is defined as a user who completed at least one purchase during the month.

Monthly purchasing activity fluctuated between 3 and 5 active users. March and May recorded the highest number of purchasing active users at 5, while January, February, and June recorded the lowest at 3.

### What is our Average Revenue Per User (ARPU)?

ARPU across all 20 registered users is 87.85, based on revenue from completed orders. This means that each registered user generated an average of 87.85 in revenue during the period represented by the dataset, including users who did not make a completed purchase.

ARPU provides a broader view of customer value than Average Order Value because it considers the entire registered user base rather than individual transactions.

### Key Takeaways

Customer analysis highlights two areas worth investigating further:

- Repeat purchasing is relatively limited: only 23.53% of purchasing customers made multiple completed purchases.
- New user acquisition declined in the later months: registrations fell from 5 users per month during January–March to 3 in April and 2 in May.

Together, these findings suggest that both customer acquisition and repeat purchasing would be useful areas for deeper analysis. Further investigation could segment customers by acquisition channel, country, signup cohort, and purchasing behaviour to understand where stronger customer value and retention are coming from.

## Level 5 — Advanced Analysis

### What is our customer retention?
         month          | customers_previous_month | retained_customers | retention_rate                             
------------------------+--------------------------+--------------------+----------------
 2026-01-01 00:00:00+08 |                        3 |                  1 |          33.33
 2026-02-01 00:00:00+08 |                        3 |                  0 |           0.00
 2026-03-01 00:00:00+08 |                        5 |                  0 |           0.00
 2026-04-01 00:00:00+08 |                        4 |                  0 |           0.00
 2026-05-01 00:00:00+08 |                        5 |                  0 |           0.00
 2026-06-01 00:00:00+08 |                        3 |                    |        

For this analysis, customer retention is defined as the percentage of customers who made a completed purchase in one month and returned to make another completed purchase in the following month.  

January recorded a 33.33% month-to-month retention rate, with 1 of 3 purchasing customers returning to make another completed purchase in February. No customers from February through May returned to make a completed purchase in the immediately following month, resulting in a 0% month-to-month retention rate for those periods.

June retention cannot yet be calculated because the dataset does not contain July activity. This is treated as unavailable rather than 0%, since the absence of future data does not indicate that no customers returned.

Overall, the results suggest that consecutive-month purchasing is limited in this dataset. Further analysis could examine longer retention windows or cohort-based retention to determine whether customers return after more than one month.       

### Rank products by revenue within each category.

 category  |      product_name       | revenue | revenue_rank                                                        
-----------+-------------------------+---------+--------------
 Bodycare  | Body Scrub              |   72.00 |            1
 Bodycare  | Body Lotion             |   57.00 |            2
 Fashion   | Structured Tote Bag     |  340.00 |            1
 Fashion   | Wide Leg Trousers       |  110.00 |            2
 Fashion   | Classic White Shirt     |   90.00 |            3
 Fragrance | Eau de Parfum           |  330.00 |            1
 Haircare  | Ceramic Hair Styler     |  190.00 |            1
 Haircare  | Repair Hair Mask        |   84.00 |            2
 Haircare  | Silk Hair Scrunchie Set |   36.00 |            3
 Makeup    | Velvet Lip Tint         |   75.00 |            1
 Makeup    | Lengthening Mascara     |   44.00 |            2
 Makeup    | Soft Glow Blush         |   40.00 |            3
 Skincare  | Vitamin C Serum         |  128.00 |            1
 Skincare  | Daily Sunscreen SPF50   |  125.00 |            2
 Skincare  | Hydrating Cleanser      |   36.00 |            3

 Products were ranked by completed-order revenue within their respective categories.  

The Structured Tote Bag generated the highest revenue among all category-leading products at 340.00, followed closely by Eau de Parfum at 330.00. Within Fashion, the Structured Tote Bag contributed 340.00 of the category's 540.00 total revenue, indicating that a substantial share of Fashion revenue came from a single product.

Product performance is not evenly distributed within categories. Further analysis could compare units sold, order frequency, and pricing to understand what is driving the revenue differences between products.
 


### Calculate month-over-month revenue growth.
month          | revenue | previous_month_revenue | mom_growth_percentage                                   
------------------------+---------+------------------------+-----------------------
 2026-01-01 00:00:00+08 |  191.00 |                        |                      
 2026-02-01 00:00:00+08 |  255.00 |                 191.00 |                 33.51
 2026-03-01 00:00:00+08 |  325.00 |                 255.00 |                 27.45
 2026-04-01 00:00:00+08 |  279.00 |                 325.00 |                -14.15
 2026-05-01 00:00:00+08 |  448.00 |                 279.00 |                 60.57
 2026-06-01 00:00:00+08 |  259.00 |                 448.00 |                -42.19

 Revenue increased during February and March before declining by 14.15% in April. The strongest month-over-month growth occurred in May, when revenue increased by 60.57% from 279.00 to 448.00. This was followed by a 42.19% decline in June, the largest monthly decrease in the period.

These fluctuations show that revenue growth was not consistent across the six-month period. Additional analysis would be needed to determine whether changes were driven by customer activity, order frequency, product mix, or other factors.


### Identify customers whose spending is above average.
user_id | total_spending                                                                                       
---------+----------------
       3 |         314.00
       1 |         246.00
       5 |         182.00
       2 |         115.00
      12 |         110.00
      16 |         110.00
      20 |         107.00

Seven purchasing customers spent more than the average spending level among customers with at least one completed order.  

User 3 was the highest-spending customer at 314/00, followed by User 1 at 246.00. Users 1 and 3 were also identified as repeat customers in the earlier customer analysis, each completing three orders. This suggests that repeat purchasing contributed to the higher total spending observed for these customers.

### Key Takeaways

- Customer retention is limited: January achieved 33.33% next-month retention, while February through May recorded 0%. June cannot yet be measured because July data is unavailable.
- Revenue is concentrated in several strong products: the Structured Tote Bag generated 340.00 and was the highest-revenue product among the category leaders.
- Monthly revenue is volatile: the strongest growth occurred in May at +60.57%, followed by the largest decline in June at -42.19%.
- Repeat purchasing appears connected with higher customer value: the two customers with the most completed orders, users 1 and 3, were also the two highest-spending customers.
- The findings point to retention, high-value customer behaviour, and product-level revenue drivers as useful areas for deeper analysis.
