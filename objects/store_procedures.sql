
use pipeline_management;
-- 1 


DELIMITER //
CREATE PROCEDURE UpdateOpportunityStatus()
BEGIN
    UPDATE facts_opportunities
    SET o__statusname = 
        CASE 
            WHEN o__closeddate > DATE_ADD(CURDATE(), INTERVAL 30 DAY) THEN 'Lost'
            ELSE o__statusname
        END;
END//
DELIMITER ;

-- 2

DELIMITER //
CREATE PROCEDURE GetAccountValueDistribution()
BEGIN
    CREATE TEMPORARY TABLE temp_account_value_distribution (
        account_name VARCHAR(255),
        total_opportunity_value DECIMAL(10, 2)
    );

    INSERT INTO temp_account_value_distribution
    SELECT 
        A.a__name AS account_name, 
        SUM(P.product__price) AS total_opportunity_value
    FROM facts_account A
    JOIN facts_opportunities O ON O.accountid = A.accountid
    JOIN facts_products P ON P.opportunityid = O.opportunityid
    GROUP BY A.accountid
    ORDER BY total_opportunity_value DESC;

    SELECT * FROM temp_account_value_distribution;

    DROP TEMPORARY TABLE IF EXISTS temp_account_value_distribution;
END//
DELIMITER ;

-- 3

DELIMITER //
CREATE PROCEDURE GetMostSoldProductsBySalesRep()
BEGIN
    SELECT 
        CONCAT(U.first_name, ' ', U.last_name) AS sales_rep_name,
        P.product__name AS product_name,
        COUNT(*) AS total_sold,
        SUM(P.product__price) AS total_value
    FROM dim_users U
    JOIN facts_opportunities O ON O.ownerid = U.userid
    JOIN facts_products P ON P.opportunityid = O.opportunityid
    WHERE O.o__statusname = 'Won'
    GROUP BY U.userid, P.product__name
    ORDER BY total_sold DESC;
END//
DELIMITER ;

CALL UpdateOpportunityStatus();
CALL GetAccountValueDistribution();
CALL GetMostSoldProductsBySalesRep(); 