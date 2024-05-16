--7. Escribe una función que reciba un número entero de entrada y devuelva TRUE si el número es par o FALSE en caso contrario.

CREATE OR REPLACE FUNCTION ejercicio7(i_numero IN NUMBER) RETURN NUMBER IS

    vNumero NUMBER:=i_numero;
    vModulo NUMBER; 
    par BOOLEAN;
    
BEGIN
    vModulo:=MOD(vNumero,2);
    if vModulo=0 THEN
        par:=true;
    ELSE
        par:=false;
    END IF;
    if par then
        RETURN 1;
    else
        return 0;
    end if;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error de ejecución');
        return -1;
END;

select ejercicio7(9) from dual;
