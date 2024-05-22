use pipeline_management;
-- 1

CREATE VIEW opportunity_summary AS
SELECT 
    U.userid, 
    A.a__name AS account_name, 
    A.a__country AS account_country, 
    CONCAT(U.first_name, ' ', U.last_name) AS full_name, 
    O.opportunityid,
    O.o__name AS opportunity_name, 
    SUM(P.product__price) AS opportunity_value,
    O.currencycode,
    O.o__closeddate,
    O.o__statusname
FROM dim_users U
JOIN facts_account A ON A.primary_contactid = U.userid
JOIN facts_opportunities O ON O.accountid = A.accountid
JOIN facts_products P ON P.opportunityid = O.opportunityid
GROUP BY O.opportunityid;

-- 2

CREATE VIEW top_sales_reps AS
SELECT 
    CONCAT(U.first_name, ' ', U.last_name) AS sales_rep_name, 
    SUM(P.product__price) AS total_opportunity_value
FROM dim_users U
JOIN facts_opportunities O ON O.ownerid = U.userid
JOIN facts_products P ON P.opportunityid = O.opportunityid
WHERE O.o__statusname = 'Won'
GROUP BY U.userid
ORDER BY total_opportunity_value DESC
LIMIT 5;


-- 3


CREATE VIEW account_value_distribution AS
SELECT 
    A.a__name AS account_name, 
    SUM(P.product__price) AS total_opportunity_value
FROM facts_account A
JOIN facts_opportunities O ON O.accountid = A.accountid
JOIN facts_products P ON P.opportunityid = O.opportunityid
GROUP BY A.accountid
ORDER BY total_opportunity_value DESC;

-- 4


CREATE VIEW opportunity_status_breakdown AS
SELECT 
    O.o__statusname AS status, 
    COUNT(*) AS count
FROM facts_opportunities O
GROUP BY O.o__statusname;


-- 5


CREATE VIEW product_performance AS
SELECT 
    product__type AS product_type, 
    SUM(product__price) AS total_revenue
FROM facts_products
GROUP BY product__type
ORDER BY total_revenue DESC;