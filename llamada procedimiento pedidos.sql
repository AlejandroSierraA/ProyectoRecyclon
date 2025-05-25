/*LLamada al procedimiento p_pedidos*/


set serveroutput on
DECLARE
V_ID_USU usuarios.id_usuarios%TYPE;
BEGIN
V_ID_usu:=&identificativo_del_usuario;

P_CALCULAR_PEDIDOS(V_ID_USU);

  
END;