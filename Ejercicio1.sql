--1. Crea un procedimiento que declare una variable y muestre por pantalla su valor.

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE ejercicio1(iTexto IN VARCHAR2) IS

    vTexto VARCHAR2(50):=iTexto;

BEGIN

    DBMS_OUTPUT.PUT_LINE(vTexto);
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error en el codigo');
END;

-- llamamos al procedimiento

CALL ejercicio1('hola a todos');