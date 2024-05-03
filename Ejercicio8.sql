-- 8. Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente
-- un día de la semana y que devuelva una cadena de caracteres con el nombre del día de la semana
-- correspondiente. Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.

CREATE OR REPLACE PROCEDURE ejercicio8(i_dia in NUMBER) IS

    vDia NUMBER:=i_dia;
    vCadena VARCHAR2(15);
    fueraRango EXCEPTION;

BEGIN
    CASE vDia
        when 1 then vCadena:='Lunes';
        when 2 then vCadena:='Martes';
        when 3 then vCadena:='Miercoles';
        when 4 then vCadena:='Jueves';
        when 5 then vCadena:='Vienes';
        when 6 then vCadena:='Sabado';
        when 7 then vCadena:='Domingo'; 
        else raise fueraRango;
    end case;
    DBMS_OUTPUT.PUT_LINE(vCadena);
EXCEPTION
    when fueraRango then
        dbms_output.put_line('Parametro fuera de rango');
END;

CALL ejercicio8(8);