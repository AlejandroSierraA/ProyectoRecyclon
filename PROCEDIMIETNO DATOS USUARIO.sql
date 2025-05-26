/*PROCEDIMIENTO DATOS USUARIO*/

set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "DAW1"."P_DATOS_USUARIO" 
(
  P_ID_USUARIO  IN usuarios.id_usuario%TYPE 
) AS 

V_DATOS_USUARIO  usuarios%ROWTYPE; 
V_NUMERO_PEDIDOS_REALIZADOS NUMBER;
V_DIRECCION VARCHAR2;
V_NOMBRE VARCHAR2;
V_TELEFONO usuarios.telefono%TYPE;

BEGIN

    V_NUMERO_PEDIDOS_REALIZADOS := F_PEDIDOS(P_ID_USUARI0,V_NOMBRE,V_DIRECCION,V_TELEFONO);

SELECT * INTO V_DATOS_USUARIO
FROM usuarios 
WHERE id_usuario=P_ID_USUARIO;

DBMS_OUTPUT.PUT_LINE('Usuario nº: ' || P_ID_USUARIO);
DBMS_OUTPUT.PUT_LINE('Nombre y apellido del usuario: ' || V_NOMBRE.nombre || '-' ||V_DATOS_USUARIO.apellido );
DBMS_OUTPUT.PUT_LINE('Email del usuario: ' || V_DATOS_PRODUCTO.email);
DBMS_OUTPUT.PUT_LINE('Direccion del usuario: ' || V_DIRECCION || '-' || V_DATOS_PRODUCTO.cp);
DBMS_OUTPUT.PUT_LINE('Fecha creacion cuenta: ' || V_DATOS_PRODUCTO.fcreacion);
DBMS_OUTPUT.PUT_LINE('Telefono del usuario: ' || V_TELEFONO);
DBMS_OUTPUT.PUT_lINE('Numero de pedidos realizados por el usuario' || V_NUMERO_PEDIDOS_REALIZADOS);


EXCEPTION
WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('El producto n�: ' || P_ID_producto || 'no existe en la empresa.');
WHEN OTHER THEN
    DBMS_OUTPUT.PUT_LINE('Ha surgido el error ' || SQLRRM);

END P_DATOS_PRODUCTOS;