use pipeline_management;

INSERT INTO dim_users (u__email, first_name, last_name, u__createddate, isactive, u__type)
VALUES

    ('john@management.com', 'John', 'Doe', '2023-01-01', 1, 'Reseller'),
    ('marta_gomez@management.com', 'Marta', 'Gomez', '2023-07-01', 1, 'Sales Rep'),
    ('fer_rodriguez@management.com', 'Fernando', 'Rodriguez', '2023-12-01', 1, 'Technician'),
    ('emma@management.com', 'Emma', 'Johnson', '2023-03-20', 1, 'Reseller'),
    ('david_wong@management.com', 'David', 'Wong', '2023-04-25', 1, 'Technician'),
    ('laura_smith@management.com', 'Laura', 'Smith', '2023-05-30', 1, 'Sales Rep'),
    ('alex@management.com', 'Alex', 'Martinez', '2023-06-05', 1, 'Technician'),
    ('jessica@management.com', 'Jessica', 'Brown', '2023-07-10', 1, 'Reseller'),
    ('michael@management.com', 'Michael', 'Davis', '2023-08-15', 1, 'Sales Rep'),
    ('sophia@management.com', 'Sophia', 'Wilson', '2023-09-20', 1, 'Reseller'),
    ('adam@management.com', 'Adam', 'Anderson', '2023-10-25', 1, 'Technician'),
    ('olivia@management.com', 'Olivia', 'Taylor', '2023-11-30', 1, 'Sales Rep'),
    ('william@management.com', 'William', 'Thomas', '2023-12-05', 1, 'Reseller'),
    ('emily@management.com', 'Emily', 'Harris', '2024-01-10', 1, 'Sales Rep'),
    ('james@management.com', 'James', 'Walker', '2024-02-15', 1, 'Technician'),
    ('ava@management.com', 'Ava', 'White', '2024-03-20', 1, 'Reseller'),
    ('benjamin@management.com', 'Benjamin', 'Jackson', '2024-04-25', 1, 'Sales Rep'),
    ('harper@management.com', 'Harper', 'Moore', '2024-05-30', 1, 'Technician'),
    ('emma@management.com', 'Emma', 'Martinez', '2024-06-05', 1, 'Reseller'),
    ('logan@management.com', 'Logan', 'Lee', '2024-07-10', 1, 'Sales Rep'),
    ('grace@management.com', 'Grace', 'Perez', '2024-08-15', 1, 'Technician'),
    ('noah@management.com', 'Noah', 'Gonzalez', '2024-09-20', 1, 'Reseller'),
    ('chloe@management.com', 'Chloe', 'Rodriguez', '2024-10-25', 1, 'Sales Rep');

INSERT INTO dim_currency (currency_code, currency_name, currency_rate, c__createddate)
VALUES
    ('USD', 'United States Dollar', 1.00, '2023-04-10'), 
    ('INR', 'Indian Rupee', 0.014, '2024-01-10'), 
    ('JPY', 'Japanese Yen', 0.0093, '2024-02-15'),
    ('KRW', 'South Korean Won', 0.00088, '2024-03-20'), 
    ('CNY', 'Chinese Yuan', 0.16, '2024-04-25'), 
    ('SGD', 'Singapore Dollar', 0.74, '2024-05-30'),
    ('AUD', 'Australian Dollar', 0.77, '2024-06-05'), 
    ('NZD', 'New Zealand Dollar', 0.71, '2024-07-10'), 
    ('TWD', 'New Taiwan Dollar', 0.036, '2024-08-15'),
    ('THB', 'Thai Baht', 0.032, '2024-08-15'), 
    ('PHP', 'Philippine Peso', 0.020, '2024-07-15');

INSERT INTO facts_account (a__name, a__number, a__country, primary_contactid, a__createddate)
VALUES
    ('ABC Corporation', 'ABC123', 'United States', 1, '2023-05-15'),
    ('XYZ Enterprises', 'XYZ456', 'Canada', 2, '2023-06-20'),
    ('123 Industries', '123789', 'United Kingdom', 3, '2023-07-25'),
    ('123 Industries', '123789', 'United Kingdom', 3, '2023-07-25'),
    ('PQR Solutions', 'PQR123', 'India', 4, '2023-11-15'),
    ('LMN Tech', 'LMN789', 'Japan', 5, '2023-12-20'),
    ('XYZ Innovations', 'XYZ789', 'South Korea', 6, '2024-01-25'),
    ('ABC Tech', 'ABC123', 'China', 7, '2024-02-10'),
    ('EFG Innovations', 'EFG456', 'Singapore', 8, '2024-03-15'),
    ('GHI Solutions', 'GHI789', 'Australia', 9, '2024-04-20'),
    ('JKL Tech', 'JKL123', 'New Zealand', 10, '2024-05-25'),
    ('MNO Innovations', 'MNO456', 'Taiwan', 11, '2024-06-10'),
    ('RST Solutions', 'RST789', 'Philippines', 12, '2024-07-15'),
    ('UVW Tech', 'UVW123', 'Thailand', 13, '2024-08-20'),
    ('QRS Innovations', 'QRS456', 'Malaysia', 14, '2024-09-25'),
    ('TUV Solutions', 'TUV789', 'Vietnam', 15, '2024-10-10'),
    ('WXY Tech', 'WXY123', 'Indonesia', 16, '2024-11-15'),
    ('ZAB Innovations', 'ZAB456', 'Myanmar', 17, '2024-12-20'),
    ('CDE Tech', 'CDE789', 'Cambodia', 18, '2025-01-25'),
    ('FGH Innovations', 'FGH123', 'Laos', 19, '2025-02-10'),
    ('IJK Solutions', 'IJK456', 'Bangladesh', 20, '2025-03-15'),
    ('LMN Tech', 'LMN789', 'Nepal', 21, '2025-04-20'),
    ('OPQ Innovations', 'OPQ123', 'Pakistan', 22, '2025-05-25');

INSERT INTO facts_opportunities (ownerid, accountid, o__name, o__statusname, o__closeddate, o__createddate, productid, currencycode)
VALUES
    (1, 1, 'Xaiomi and Dell products USA customer', 'Won', '2024-02-12', '2023-04-10', 1, 'USD'), 
    (2, 2, 'Phillips and GM - special discount', 'Won', '2024-02-12', '2023-04-10', 2, 'USD'), 
    (3, 3, 'Fashion closthing different size', 'Won', '2024-02-12', '2023-04-10', 3, 'USD'),
    (1, 1, 'Xaiomi and Dell products USA customer', 'Won', '2024-02-12', '2023-04-10', 1, 'USD'), 
    (2, 2, 'Phillips and GM - special discount', 'Won', '2024-02-12', '2023-04-10', 2, 'USD'), 
    (3, 3, 'Fashion closthing different size', 'Won', '2024-02-12', '2023-04-10', 3, 'USD'),
    (4, 1, 'Software Development Project', 'Open', '2025-05-15', '2024-01-10', 4, 'INR'), 
    (5, 2, 'Tech Consultation Service', 'Won', '2025-05-15', '2024-02-15', 5, 'JPY'), 
    (6, 3, 'Hardware Upgrade Contract', 'Lost', '2025-05-15', '2024-03-20', 6, 'KRW'),
    (7, 1, 'Cloud Services Implementation', 'Open', '2025-05-15', '2024-04-25', 7, 'CNY'), 
    (8, 2, 'AI Integration Project', 'Won', '2025-05-15', '2024-05-30', 8, 'SGD'), 
    (9, 3, 'Digital Marketing Campaign', 'Open', '2024-09-05', '2024-06-05', 9, 'AUD'),
    (10, 1, 'E-commerce Platform Development', 'Lost', '2025-05-15', '2024-07-10', 10, 'NZD'),
    (11, 2, 'IoT Solutions Implementation', 'Open', '2025-05-15', '2024-08-15', 11, 'TWD'), 
    (12, 3, 'Network Infrastructure Upgrade', 'Won', '2025-05-15', '2024-08-15', 12, 'THB'),
    (13, 1, 'Mobile App Development', 'Open', '2025-02-12', '2024-07-15', 13, 'PHP'),
    (14, 2, 'Web Development Project', 'Open', '2024-10-15', '2024-03-15', 14, 'SGD'), 
    (15, 3, 'Database Optimization', 'Open', '2024-12-15', '2024-08-15', 15, 'AUD');

INSERT INTO facts_products (product__code, product__name, product__type, product__price, opportunityid, currencycode)
VALUES
('P1234', 'Xiaomi phone L2', 'Electronics', 899.99, 1, 'USD'),
('P343536', 'Tablet Apple', 'Electronics', 699.99, 1, 'USD'),
('P737475', 'Rice Cooker Zojirushi', 'Home Appliances', 129.99, 2, 'USD'),
('P404142', 'Adidas Sneakers', 'Footwear', 129.99, 3, 'USD'),
('P91011', 'Sara Jeans', 'Clothing XXL', 49.99, 3, 'USD'),
('P495051', 'Puma Joggers', 'Clothing M', 39.99, 6, 'CNY'),
('P13234', 'Computer Dell', 'Electronics', 750, 4, 'JPY'),
('P434445', 'Smart TV Sony', 'Electronics', 1499.99, 4, 'JPY'),
('P464748', 'Microwave Panasonic', 'Home Appliances', 149.99, 5, 'INR'),
('P4378', 'Blender Philips', 'Home Appliances', 5000, 5, 'INR'),
('P94511', 'Desigual Sweater', 'Clothing XXS', 1500, 6, 'CNY'),
('P495051', 'Puma Joggers', 'Clothing M', 39.99, 6, 'CNY'),
('P162738', 'Smartwatch Y3', 'Electronics', 349.99, 7, 'AUD'),
('P525354', 'Digital Camera Canon', 'Electronics', 599.99, 7, 'AUD'),
('P192021', 'Refrigerator Samsung', 'Home Appliances', 899.99, 8, 'NZD'),
('P555657', 'Air Fryer Philips', 'Home Appliances', 249.99, 8, 'NZD'),
('P222324', 'Levi Jeans', 'Clothing XL', 59.99, 9, 'TWD'),
('P585960', 'Leather Jacket', 'Clothing S', 119.99, 9, 'TWD'),
('P252627', 'Laptop HP', 'Electronics', 899.99, 10, 'THB'),
('P616263', 'Bluetooth Speaker JBL', 'Electronics', 199.99, 10, 'THB'),
('P282930', 'Toaster KitchenAid', 'Home Appliances', 13500, 11, 'SGD'),
('P646566', 'Vacuum Cleaner Dyson', 'Home Appliances', 399.99, 11, 'SGD'),
('P313233', 'Nike Hoodie', 'Clothing L', 79.99, 12, 'PHP'),
('P676869', 'Summer Dress', 'Clothing XS', 29.99, 13, 'PHP'),
('P707172', 'Wireless Headphones Sony', 'Electronics', 299.99, 15, 'USD'),
('P5678', 'Fridge GM', 'Home Appliances', 399.50, 15, 'USD'),
('P737475', 'Rice Cooker Zojirushi', 'Home Appliances', 129.99, 14, 'USD'); 

