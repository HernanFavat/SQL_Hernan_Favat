use pipeline_management;
CREATE TABLE sales_target_achieved_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sales_rep VARCHAR(255),
    total_value DECIMAL(10, 2),
    currencycode VARCHAR(10) DEFAULT 'USD',
    achieved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //

CREATE TRIGGER log_opportunities_non_us_india
AFTER INSERT ON facts_opportunities
FOR EACH ROW
BEGIN
    INSERT INTO sales_target_achieved_log (sales_rep, total_value)
    SELECT DISTINCT u.u__email, SUM(p.product__price) AS total_value
    FROM facts_opportunities o
    JOIN facts_products p ON o.opportunityid = p.opportunityid
    JOIN facts_account a ON o.accountid = a.accountid
    JOIN dim_users u ON o.ownerid = u.userid
    WHERE a.a__country NOT IN ('United States', 'India')
    GROUP BY u.u__email
    HAVING total_value >= 400;
END//

-- Testiando el trigger con nuevas entradas
INSERT INTO facts_opportunities (ownerid, accountid, o__name, o__statusname, o__closeddate, o__createddate, productid, currencycode)
VALUES (4, 5, 'New Opportunity in India', 'Won', '2024-05-19', '2024-05-19', 5, 'USD'), 
(8, 7, 'New Opportunity in China', 'Won', '2024-05-19', '2024-05-19', 6, 'USD'),
(4, 2, 'New Opportunity in China', 'Won', '2024-05-19', '2024-05-19', 9, 'USD');

SELECT sales_rep, total_value FROM sales_target_achieved_log;


DELIMITER //

CREATE TRIGGER log_technician_opportunities 
AFTER INSERT ON facts_opportunities 
FOR EACH ROW 
BEGIN 
    DECLARE user_type VARCHAR(50);

   
    SELECT u.u__type INTO user_type 
    FROM dim_users u 
    WHERE u.userid = NEW.ownerid;


    IF user_type = 'Technician' THEN
        INSERT INTO technician_opportunity_log (opportunity_id, technician_id, opportunity_name, created_at)
        VALUES (NEW.opportunityid, NEW.ownerid, NEW.o__name, NOW());
    END IF;
END//

DELIMITER ;

-- TESTING el trigger con una nueva entrada
INSERT INTO facts_opportunities (ownerid, accountid, o__name, o__statusname, o__closeddate, o__createddate, productid, currencycode)
VALUES
    (3, 4, 'New Software Installation Project', 'Open', '2024-05-19', '2024-05-19', 16, 'USD');

SELECT * FROM technician_opportunity_log; 