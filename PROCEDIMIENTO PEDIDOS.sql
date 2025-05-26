/*PROCEDIMIENTO*/

set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "DAW1"."P_CALCULAR_PEDIDOS" 
(
  P_ID_USUARIO IN NUMBER 
) AS 

V_NOMBRE empleados.nombre%TYPE;
V_DIRECCION usuarios.direccion%TYPE;
V_TELEFONO usuarios.teelfono%TYPE;
V_CONTADOR_PEDIDOS NUMBER(2);

BEGIN

    V_CONTADOR_PEDIDOS:=F_PEDIDOS(P_ID_USU,V_DIRECCION,V_TELEFONO);
 
    DBMS_OUTPUT.PUT_LINE('ID y Nombre del usuario : ' || P_ID_EMP || ' -' ||  V_NOMBRE);
    DBMS_OUTPUT.PUT_LINE('Direccion del usuario : ' || V_DIRECCION);
    DBMS_OUTPUT.PUT_LINE('Telefono del usuario : ' || V_TELEFONO);
    DBMS_OUTPUT.PUT_LINE('Numero pedidos realizados: ' || V_CONTADOR_PEDIDOS);
 
 
END P_CALCULAR_PEDIDOS;
