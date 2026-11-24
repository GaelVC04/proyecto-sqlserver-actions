USE EmpresaDB;
GO

CREATE OR ALTER TRIGGER trg_AuditarVenta
ON Ventas
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Ventas dbo.VentasTipo;

    INSERT INTO @Ventas (VentaID, Producto, Cantidad)
    SELECT VentaID, Producto, Cantidad
    FROM inserted;

    EXEC dbo.sp_RegistrarAuditoria @Ventas = @Ventas;
END;
GO