use pipeline_management;


DELIMITER //
CREATE FUNCTION TotalAmountSoldByCountry(country_name VARCHAR(100)) 
RETURNS DECIMAL(12, 2)
READS SQL DATA
BEGIN
    DECLARE total_amount DECIMAL(12, 2);
    
    SELECT SUM(P.product__price) INTO total_amount
    FROM facts_products P
    JOIN facts_opportunities O ON P.opportunityid = O.opportunityid
    JOIN facts_account A ON O.accountid = A.accountid
    WHERE A.a__country = country_name;
    
    RETURN total_amount;
END;

//

DELIMITER ;

SELECT TotalAmountSoldByCountry('United States');

DELIMITER //

CREATE FUNCTION TotalOpportunitiesByUserType(user_type VARCHAR(50)) 
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE total_opportunities INT;
    
    SELECT COUNT(*) INTO total_opportunities
    FROM facts_opportunities O
    JOIN dim_users U ON O.ownerid = U.userid
    WHERE U.u__type = user_type;
    
    RETURN total_opportunities;
END; //

DELIMITER ;

SELECT TotalOpportunitiesByUserType('Sales Rep');

DELIMITER //

CREATE FUNCTION TotalSalesInFiscalYear(fiscal_year INT) 
RETURNS DECIMAL(10, 2) 
READS SQL DATA
BEGIN
    DECLARE start_date DATE;
    DECLARE end_date DATE;
    DECLARE total_sales DECIMAL(10, 2);

    -- Calculate start and end dates of the fiscal year
    SET start_date = STR_TO_DATE(CONCAT(fiscal_year, '-01-01'), '%Y-%m-%d');
    SET end_date = STR_TO_DATE(CONCAT(fiscal_year, '-12-31'), '%Y-%m-%d');

    -- Calculate total sales
    SELECT SUM(o_amount) INTO total_sales
    FROM facts_opportunities
    WHERE o__closeddate BETWEEN start_date AND end_date;

    RETURN total_sales;
END;

//

DELIMITER ;

SELECT TotalSalesInFiscalYear(2025);