/*PROCEDIMIENTO QUE ENSEÑA LOS DATOS DE UN PRODUCTO*/

CREATE OR REPLACE PROCEDURE "DAW1"."MOSTRAR_DATOS_PRODUCTOS" (
    p_idproducto IN CHAR,
    p_nombre OUT VARCHAR2,
    p_descripcion OUT VARCHAR2,
    p_tipo_material OUT VARCHAR2,
    p_precio OUT NUMBER
) IS
BEGIN

    SELECT NOMBRE, DESCRIPCION, TIPO_MATERIAL, PRECIO
    INTO p_nombre, p_descripcion, p_tipo_material, p_precio
    FROM PRODUCTOS_RECYCLON
    WHERE IDPRODUCTO = p_idproducto;
    
    
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_nombre := NULL;
        p_descripcion := NULL;
        p_tipo_material := NULL;
        p_precio := NULL;
END;