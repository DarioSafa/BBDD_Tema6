--11. Crea una función que devuelva los apellidos de un conductor en función de su DNI. La función recibe
-- como parámetro de entrada el DNI y como variable de salida una variable con el apellido del Empleado.

SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION ejercicio11(i_dni IN VARCHAR)RETURN VARCHAR2 IS

    vDNI CONDUCTOR.DNI%TYPE:=i_dni;
    vAp1 CONDUCTOR.PRAPELLIDO%TYPE;
    vAp2 CONDUCTOR.SGAPELLIDO%TYPE;
    vApellidos VARCHAR2(100);

BEGIN

    SELECT PRAPELLIDO,SGAPELLIDO INTO vAp1,vAp2 FROM CONDUCTOR 
    WHERE DNI=vDNI;

    vApellidos:=vAp1 || ' ' || vAp2;
    DBMS_OUTPUT.PUT_LINE(vApellidos);

    RETURN vApellidos;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se ha encontrado la informacion en la tabla sobre ese DNI');
        RETURN -1;
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Esta ocurrencia del DNI tiene valores de apellidos no unicos');
        RETURN -2;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error en tiempo de ejecucion');
        RETURN -3;
END;

SELECT ejercicio11('83119803B') from dual;
SELECT ejercicio11('57927673L') from dual;
SELECT ejercicio11('465645H4') from dual;