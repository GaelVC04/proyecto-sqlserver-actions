USE EmpresaDB;
GO

IF TYPE_ID('dbo.VentasTipo') IS NULL
BEGIN
    EXEC('CREATE TYPE dbo.VentasTipo AS TABLE (
        VentaID INT,
        Producto VARCHAR(100),
        Cantidad INT
    )');
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_RegistrarAuditoria
    @Ventas dbo.VentasTipo READONLY
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM (
            SELECT Producto, SUM(Cantidad) AS CantidadVendida
            FROM @Ventas
            GROUP BY Producto
        ) AS V
        LEFT JOIN Inventario AS I
            ON I.Producto = V.Producto
        WHERE I.Producto IS NULL
           OR I.Existencias < V.CantidadVendida
    )
    BEGIN
        THROW 50001, 'Producto inexistente o inventario insuficiente.', 1;
    END;

    INSERT INTO AuditoriaVentas (VentaID, Mensaje)
    SELECT
        VentaID,
        'Venta registrada automáticamente'
    FROM @Ventas;

    UPDATE I
    SET I.Existencias = I.Existencias - V.CantidadVendida
    FROM Inventario AS I
    INNER JOIN (
        SELECT Producto, SUM(Cantidad) AS CantidadVendida
        FROM @Ventas
        GROUP BY Producto
    ) AS V
        ON I.Producto = V.Producto;
END;
GO