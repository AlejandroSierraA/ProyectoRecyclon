/*LLAMADA DATOS PRODUCTOS*/

set serveroutput on
DECLARE
V_ID_PRODUCTO productos_recyclon.idproducto%TYPE;
BEGIN
V_ID_PRODUCTO:='&id_del_producto';

P_DATOS_PRODUCTOS(V_ID_PRODUCTO);

  
END;