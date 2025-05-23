/*LLAMADA AL PROCEDIMIENTO BUSCRA USUARIOS*/

set serveroutput on

DECLARE
    V_NOMBRE VARCHAR2(15);
    V_APELLIDO VARCHAR2(20);
    V_EMAIL VARCHAR2(30);
    V_DIRECCION VARCHAR2(30);
    V_CP CHAR(5);
    V_FECHA_CREACION DATE;
    V_TELEFONO CHAR(9);
BEGIN
    mostrar_datos_usuario(
        P_ID_USUARIO => '&id_usuario',
        V_NOMBRE => v_nombre,
        V_APELLIDO => v_apellido,
        V_EMAIL => v_email,
        V_DIRECCION => v_direccion,
        V_CP => v_cp,
        V_FECHA_CREACION => v_fecha_creacion,
        V_TELEFONO => v_telefono
    );

    DBMS_OUTPUT.PUT_LINE('Nombre: ' || V_NOMBRE);
    DBMS_OUTPUT.PUT_LINE('Apellido: ' || V_APELLIDO);
    DBMS_OUTPUT.PUT_LINE('Email: ' || V_EMAIL);
    DBMS_OUTPUT.PUT_LINE('Dirección: ' || V_DIRECCION);
    DBMS_OUTPUT.PUT_LINE('Código Postal: ' || V_CP);
    DBMS_OUTPUT.PUT_LINE('Fecha de creación: ' || TO_CHAR(V_FECHA_CREACION, 'DD-MM-YYYY'));
    DBMS_OUTPUT.PUT_LINE('V_TELEFONO: ' || v_telefono);
END;