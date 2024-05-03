--6. Crea un procedimiento que saque la fecha del viaje que conduce el conductor con número de empleado más bajo. No necesita parámetros de entrada.

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE ejercicio6 IS

    CURSOR cViajes IS SELECT VIAJES.FECHA 
    FROM VIAJES,CONDUCTOR 
    WHERE VIAJES.DNI_CONDUCTOR = CONDUCTOR.DNI AND CONDUCTOR.NUM_EMPLEADO = (SELECT MIN(NUM_EMPLEADO) FROM CONDUCTOR);
    

    fechaViaje cViajes%ROWTYPE;

BEGIN

    DBMS_OUTPUT.PUT_LINE('las fechas que realiza el conductor con numero de empleado más bajo son: ');
    for fechaViaje in cViajes loop
        DBMS_OUTPUT.PUT_LINE(fechaViaje.FECHA);
    end loop;

END;

--SELECT VIAJES.FECHA FROM VIAJES,CONDUCTOR WHERE VIAJES.DNI_CONDUCTOR = CONDUCTOR.DNI AND CONDUCTOR.NUM_EMPLEADO = (SELECT MIN(NUM_EMPLEADO) FROM CONDUCTOR);

CALL ejercicio6();