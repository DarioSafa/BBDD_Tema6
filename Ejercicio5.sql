--5. Utilizando la base de datos PERSONAL:

-- Crea un procedimiento que devuelva el DNI de un Empleado a partir de su código de empleado.
-- Crea una función que devuelva en número de empleados que pertenecen al departamento Personal. No recibe ningún parámetro de entrada.
-- Crea una función que devuelva el número de empleados que pertenecen a un departamento en concreto. El nombre del departamento será parámetro de entrada.

-- 1
SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE ejercicio5_1(i_clave IN VARCHAR) IS
    vClaveEmpleado DATOSPERSONALES.CLAVE_EMPLEADO%TYPE:=upper(i_clave);
    vDNI DATOSPERSONALES.DNI%TYPE;
BEGIN
    SELECT DATOSPERSONALES.DNI INTO vDNI FROM DATOSPERSONALES WHERE CLAVE_EMPLEADO=vClaveEmpleado;
    IF(vDNI IS NOT null) THEN
        DBMS_OUTPUT.PUT_LINE('El DNI de la clave de empleado '|| vClaveEmpleado || ' es: ' || vDNI);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No existe un empleado con esa clave');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Error de numero de filas devueltas'); 
END;

CALL ejercicio5_1('emp09');

--2

CREATE OR REPLACE FUNCTION ejercicio5_2 RETURN NUMBER IS
    vDevolver NUMBER;
    sinEmpleados EXCEPTION;
BEGIN
    SELECT COUNT(ID_EMPLEADO) INTO vDevolver FROM EMPLEADOS,DEPARTAMENTO WHERE DEPARTAMENTO.ID_DEPARTAMENTO=EMPLEADOS.ID_DEPARTAMENTO AND DEPARTAMENTO.NOMBRE = 'Personal';
    if vDevolver = 0 THEN
        RAISE sinEmpleados;
    end if;
    return vDevolver;
EXCEPTION
    WHEN sinEmpleados THEN
        DBMS_OUTPUT.PUT_LINE('No existe ese departamento');
END;

SELECT ejercicio5_2() from dual;

--3

CREATE OR REPLACE FUNCTION ejercicio5_3(i_depar IN NUMBER) RETURN NUMBER IS
    vDevolver NUMBER;
    vDepar NUMBER:=i_depar;
    sinEmpleados EXCEPTION;
BEGIN
    SELECT COUNT(ID_EMPLEADO) INTO vDevolver FROM EMPLEADOS,DEPARTAMENTO WHERE DEPARTAMENTO.ID_DEPARTAMENTO=EMPLEADOS.ID_DEPARTAMENTO AND DEPARTAMENTO.ID_DEPARTAMENTO = vDepar;
    if vDevolver = 0 THEN
        RAISE sinEmpleados;
    end if;
    return vDevolver;
EXCEPTION
    WHEN sinEmpleados THEN
        DBMS_OUTPUT.PUT_LINE('No existe ese departamento');
        return -1;
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No existe ese departamento');
        return -2;
END;

SELECT ejercicio5_3(6) from dual;
