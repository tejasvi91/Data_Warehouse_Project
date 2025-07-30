/*

=====================================================================
Create database and schema

=====================================================================
Script purpose:
       This script creates a new database named 'DataWareHouse' after checking if it already exists.
       If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
       within the database: 'bronze', 'silver', 'gold'.
Warning:
Running this script will drop the entire "DataWareHouse" database if it exists.
All data in the database will be permanently deleted. Proceed with caution and 
ensure you have proper backups befor running this script
       
*/

USE master;
GO

--Drop and recreate the 'DataWareHouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWareHouse')
BEGIN
     ALTER DATABASE DataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
     DROP DATABASE DataWareHouse;
END;
GO

-- create DATABASE "DataWareHouse"

create database DataWareHouse;
GO

Use DataWareHouse;
GO

-- create schema for bronze, silver nad gold layer
create schema bronze;
Go
create schema silver;
Go
create schema gold;
Go

--Go - separate the batches when working with multiple SQL statements
