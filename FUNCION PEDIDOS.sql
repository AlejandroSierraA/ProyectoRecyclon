/*Funcion que sirve para calcular el numero de pedidos hechos por un usuario */


  CREATE OR REPLACE NONEDITIONABLE FUNCTION "DAW1"."F_PEDIDOS" 
(
  P_ID_USU IN NUMBER 
, P_NOMBRE_USU OUT VARCHAR2
, P_DIRECCION OUT VARCHAR2
, P_TELEFONO OUT usuarios.telefono%TYPE
) RETURN NUMBER AS 

V_DIRECCION usuarios.direccion%TYPE;
V_NUMPEDIOS NUMBER(2);
V_TELEFONO usuarios.telefono%TYPE; 

BEGIN
    SELECT nombre INTO P_NOMBRE_USU
    FROM usuarios 
    WHERE id_usuario=P_ID_USU;

/*Si ponemos una direccion erronea tomaremos Madrid como la predeterminada*/
    IF V_DIRECCION IS NOT NULL THEN
        SELECT direccion INTO P_DIRECCION 
        FROM usuarios
        WHERE id_usuario=P_ID_USU;
    ELSE
        P_DIRECCION := 'Madrid, España';        
    END IF; 

/*Lo mismo, si ponemos un valor de telefono incorrcto se nos asignara 666666666 como predeterminado*/
    IF V_TELEDONO IS NOT NULL THEN
    
        SELECT telefono INTO P_TELEFONO
        FROM usuarios WHERE id_usuario=P_ID_USU;            
    ELSE
        P_CIUDAD:='666666666';
    END IF;
    
    
    SELECT COUNT(*) INTO V_NUMPEDIDOS
    FROM pedidos
    WHERE idcomprador= P_ID_USU ;
    
    return V_NUMPEDIDOS;
    
EXCEPTION
WHEN no_data_found THEN
    RETURN -1;
END F_PEDIDOS;
