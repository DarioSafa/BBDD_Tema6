--  3. Crea un procedimiento en el que recibas una cadena y la muestre al revés.
--  Ejemplo: recibe Hola Mundo → muestra odnuM aloH.

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE ejercicio3(iMensaje IN VARCHAR2) IS

    vMensaje VARCHAR2(50):= iMensaje;
    vReves VARCHAR2(50):='';
    vSize NUMBER:=LENGTH(vMensaje);
    vLetra CHAR(1);
    
BEGIN
    LOOP
    vLetra:=SUBSTR(vMensaje,vSize,1);
    vReves:=CONCAT(vReves,vLetra);
    vSize:=vSize-1;
    EXIT WHEN vSize=0;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Mensaje al reves: '|| vReves);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Existencia de algun error en ejecución');
END;

CALL ejercicio3('Dario');

-- OTRA FORMA

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE ejercicio3for(iMensaje IN VARCHAR2) IS

    vMensaje VARCHAR2(50):= iMensaje;
    vReves VARCHAR2(50):='';

BEGIN
    FOR vRecorrer IN REVERSE 1..LENGTH(vMensaje) LOOP
        vReves:=vReves||SUBSTR(vMensaje,vRecorrer,1);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Mensaje al reves: '|| vReves);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Existencia de algun error en ejecución');
END;

CALL ejercicio3for('Dario');