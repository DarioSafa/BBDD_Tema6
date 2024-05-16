--10. Escribe una función que reciba tres números reales como parámetros de entrada y devuelva el mayor
--de los tres.


--Aunque podria hacerse facil con IFs o un Switch (case) quería practicar VARRAYS
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION ejercicio10(i_num1 IN NUMBER,i_num2 IN NUMBER, i_num3 IN NUMBER) RETURN NUMBER IS 

    vNum1 NUMBER:= i_num1;
    vNum2 NUMBER:= i_num2;
    vNum3 NUMBER:= i_num3;
    TYPE numeros IS VARRAY(3) OF BINARY_INTEGER;
    vNumeros numeros:=numeros(vNum1,vNum2,vNum3);
    vMax NUMBER:=vNum1;

BEGIN
    
    for i IN 2..vNumeros.LIMIT loop
        if vNumeros(i) > vMax then 
        vMax:=vNumeros(i);
        end if;
    end loop;
    return vMax;
    DBMS_OUTPUT.PUT_LINE('El numero mas grande es:' || vMax);
EXCEPTION

    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error de ejecucion');

END;

SELECT ejercicio10(2,10,5) from dual;
