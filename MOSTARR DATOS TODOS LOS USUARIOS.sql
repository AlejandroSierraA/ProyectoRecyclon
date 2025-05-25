/*MOSTRAR LOS DATOS DE TODOS LOS USUARIOS*/

set serveroutput on;
DECLARE
V_USUARIO usuarios%ROWTYPE;
V_MIN_USUARIO usuarios.id_usuario%TYPE;
V_MAX_USUARIO usuarios.id_usuario%TYPE;
´
BEGIN 

SELECT MIN(id_usuario),MAX(id_usuario) INTO V_MINIMO,V_MAXIMO FROM usuarios;

FOR i IN V_MIN_USUARIO..V_MAX_USUARIO
LOOP

SELECT COUNT(*) INTO V_CONTADOR
    FROM usuarios
    WHERE id_usuario=i;

    IF V_CONTADOR_CLIENTE!=0 THEN
        SELECT * INTO V_USUARIO FROM usuarios WHERE id_usuario=i;

        DBMS_OUTPUT.PUT_LINE('Usuario Nº: ' || i || ' Nombre y apellido del usuario: ' ||V_USUARIO.nombre || '-' ||V_USUARIO-apellido );
        DBMS_OUTPUT.PUT_LINE('Email del usuario: ' || V_USUARIO.email);
        DBMS_OUTPUT.PUT_LINE('Direccion del usuario: ' || V_USUARIO.direccion || '-' || V_USUARIO.cp);
        DBMS_OUTPUT.PUT_LINE('Fecha de creacion de la cuenta: ' || V_USUARIO.fcreacion);
        DBMS_OUTPUT.PUT_LINE('Telefono de contacto: ' || V_USUARIO.telefono);
              
            
    END IF;
END LOOP;   

EXCEPTION 
WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('El usuario que has introducido no existe, prueba otro');
WHEN OTHER THEN
    DBMS_OUTPUT.PUT_LINE('Ha surgido el error ' || SQLRRM);

END;