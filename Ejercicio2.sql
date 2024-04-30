--2. Declara una función que dándole dos números realice la división de éstos. 
-- Tener en cuenta si es necesario añadir alguna restricción o validación.
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION ejercicio2(iNum1 IN NUMBER, iNum2 IN NUMBER) RETURN NUMBER IS
    
    vNum1 NUMBER:= iNum1;
    vNum2 NUMBER:= iNum2;
    vResultado NUMBER;
    
BEGIN
  
    vResultado:=vNum1/vNum2;

    return vResultado;
    
EXCEPTION
    WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('No se puede dividir entre 0');
    vResultado:=0;          --Controlamos el return
    return vResultado;
    

END;

SELECT ejercicio2(10,0) from dual;