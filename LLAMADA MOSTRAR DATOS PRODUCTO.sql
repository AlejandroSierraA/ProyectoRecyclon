/*LLAMADA MOSRTAR DATOS PRODUCTOS*/

DECLARE
    v_nombre VARCHAR2(200);
    v_descripcion VARCHAR2(300);
    v_tipo_material VARCHAR2(40);
    v_precio NUMBER(5,2);
BEGIN
    mostrar_datos_producto('P001', v_nombre, v_descripcion, v_tipo_material, v_precio);
    
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
    DBMS_OUTPUT.PUT_LINE('Descripción: ' || v_descripcion);
    DBMS_OUTPUT.PUT_LINE('Tipo Material: ' || v_tipo_material);
    DBMS_OUTPUT.PUT_LINE('Precio: ' || TO_CHAR(v_precio));
END;