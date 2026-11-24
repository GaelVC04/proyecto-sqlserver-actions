IF NOT EXISTS (
    SELECT name
    FROM sys.databases
    WHERE name = 'EmpresaDB'
)
BEGIN
    CREATE DATABASE EmpresaDB;
END;
GO
