use pipeline_management;

DROP USER IF EXISTS 'admin_user'@'localhost';
DROP USER IF EXISTS 'sales_rep_user'@'localhost';
DROP USER IF EXISTS 'technician_user'@'localhost';
DROP USER IF EXISTS 'manager_user'@'localhost';
DROP USER IF EXISTS 'auditor_user'@'localhost';
DROP USER IF EXISTS 'guest_user'@'localhost';

DROP ROLE IF EXISTS admin;
DROP ROLE IF EXISTS sales_rep;
DROP ROLE IF EXISTS technician;
DROP ROLE IF EXISTS manager;
DROP ROLE IF EXISTS auditor;
DROP ROLE IF EXISTS guest;

-- Roles y passwords
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';
CREATE USER 'sales_rep_user'@'localhost' IDENTIFIED BY 'sales_rep_password';
CREATE USER 'technician_user'@'localhost' IDENTIFIED BY 'technician_password';
CREATE USER 'manager_user'@'localhost' IDENTIFIED BY 'manager_password';
CREATE USER 'auditor_user'@'localhost' IDENTIFIED BY 'auditor_password';
CREATE USER 'guest_user'@'localhost' IDENTIFIED BY 'guest_password';

-- crear roles
CREATE ROLE admin;
CREATE ROLE sales_rep;
CREATE ROLE technician;
CREATE ROLE manager;
CREATE ROLE auditor;
CREATE ROLE guest;

-- Assignar roles a usuarios
GRANT admin TO 'admin_user'@'localhost';
GRANT sales_rep TO 'sales_rep_user'@'localhost';
GRANT technician TO 'technician_user'@'localhost';
GRANT manager TO 'manager_user'@'localhost';
GRANT auditor TO 'auditor_user'@'localhost';
GRANT guest TO 'guest_user'@'localhost';