--9. Escribe una función que devuelva el valor del área de un círculo a partir del valor del radio que se
--recibirá como parámetro de entrada.

CREATE OR REPLACE FUNCTION ejercicio9(i_numero IN NUMBER) RETURN NUMBER IS

    vRadio NUMBER:=i_numero;
    vArea NUMBER;
    vPi NUMBER:=3.141592;
    
BEGIN
    
    vArea:=  vPi *POWER(vRadio,2);
    RETURN vArea;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error de ejecución');
END;

SELECT ejercicio9(2) from dual;