USE EmpresaDB;
GO

INSERT INTO Inventario (Producto, Existencias)
VALUES
    ('Laptop', 10),
    ('Monitor', 20),
    ('Teclado', 15);
GO

INSERT INTO Ventas (Producto, Cantidad)
VALUES
    ('Laptop', 3),
    ('Monitor', 5),
    ('Teclado', 2);
GO

SELECT * FROM Ventas;
GO

SELECT * FROM AuditoriaVentas;
GO

SELECT * FROM Inventario;
GO