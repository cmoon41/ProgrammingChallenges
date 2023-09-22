/* question 1 */

select date, sum(impressions) as "Daily Impressions"
from marketing_performance
GROUP BY date;

/* question 2 */

select state, sum(revenue) as "Total Revenue"
from website_revenue
GROUP BY state
order by revenue DESC
LIMIT 3;
/* the third best state (TX) generated 34080 in revenue */

/* question 3 */

select c.name, sum(m.cost) as "Total Cost", 
sum(m.impressions) as "Total Impressions", 
sum(m.clicks) as "Total Clicks", 
sum(w.revenue) as "Total Revenue"
FROM campaign_info AS c
INNER JOIN marketing_performance as m
on c.id = m.campaign_id
INNER JOIN website_revenue as w
on m.campaign_id = w.campaign_id
group by c.name;

/* question 4 */ 

SELECT state, sum(conversions) as "Total Conversions"
FROM campaign_info as c
inner join marketing_performance as m 
on c.id = m.campaign_id
inner join website_revenue as w 
on m.campaign_id = w.campaign_id
where name = "Campaign5"
GROUP by state;
/* the state that generated the most conversions for Campaign5 was GA. */

/* question 5 */

/* based on the ratio of total cost to total revenue of each campaign, i think
	campaign 4 was the most efficient, as it had the lowest ratio. proportionally,
    the least amount of money was spent to generate revenue in comparison
    to the other campaigns. */
    
/* bonus question */

select dayofweek(date) as "Day", 
sum(cost) as "Total Cost", 
sum(impressions) as "Total Impressions", 
sum(clicks) as "Total Clicks", 
sum(conversions) as "Total Conversions"
from marketing_performance
group by dayofweek(date);

/* showcases various metrics, grouped by Day */
