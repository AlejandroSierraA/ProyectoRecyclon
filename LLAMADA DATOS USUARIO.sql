/*LLAMADA DATOS USUARIO*/


set serveroutput on
DECLARE
V_ID_USUARIO usuarios.id_usuario%TYPE;
BEGIN
V_ID_USUARIO:='&id del usuario';

P_DATOS_USUARIO(V_ID_USUARIO);

  
END;