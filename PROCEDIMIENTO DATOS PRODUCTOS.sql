/*Procedimiento apra mostrar los datos de un producto*/

set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "DAW1"."P_DATOS_PRODUCTOS" 
(
  P_ID_PRODUCTO  IN productos_recyclon.idproducto%TYPE 
) AS 

V_DATOS_PRODUCTO  productos_recyclon%ROWTYPE;

BEGIN

SELECT * INTO V_DATOS_PRODUCTO
FROM productos_recyclon 
WHERE idproducto=P_ID_PRODUCTO;

DBMS_OUTPUT.PUT_LINE('Producto n�: ' || P_ID_PRODUCTO);
DBMS_OUTPUT.PUT_LINE('Nombre del producto: ' || V_DATOS_PRODUCTO.nombre);
DBMS_OUTPUT.PUT_LINE('Descripcion del producto: ' || V_DATOS_PRODUCTO.descripcion);
DBMS_OUTPUT.PUT_LINE('Tipo de material del producto: ' || V_DATOS_PRODUCTO.tipo_material);
DBMS_OUTPUT.PUT_LINE('Precio del producto: ' || V_DATOS_PRODUCTO.precio);


EXCEPTION
WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('El producto n�: ' || P_ID_producto || 'no existe en la empresa.');
WHEN OTHER THEN
    DBMS_OUTPUT.PUT_LINE('Ha surgido el error ' || SQLRRM);

END P_DATOS_PRODUCTOS;