--4. Crea un procedimiento llamado p_personal en el que se utilice un cursor para sacar el nombre y la
--fecha de alta de todos los empleados y se muestren uno por uno. Realiza el mismo procedimiento
--utilizando varias maneras distintas de recorrer el cursor.

SET SERVEROUTPUT ON;

--FORMA 1

CREATE OR REPLACE PROCEDURE p_personal IS

    CURSOR  cEmpleados IS
    SELECT EMPLEADOS.NOMBRE,DATOSPERSONALES.FECHA_ALTA 
    FROM DATOSPERSONALES,EMPLEADOS 
    WHERE DATOSPERSONALES.CLAVE_EMPLEADO=EMPLEADOS.ID_EMPLEADO;
    
    TYPE rEmpleado IS RECORD(
        nombre EMPLEADOS.NOMBRE%TYPE,
        fecha_alta DATOSPERSONALES.FECHA_ALTA%TYPE
    );
    
BEGIN

    FOR rEmpleado IN cEmpleados LOOP
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || rEmpleado.nombre || ' | ' || 'Fecha de alta: '|| rEmpleado.fecha_alta);
    END LOOP;

END;

CALL p_personal();