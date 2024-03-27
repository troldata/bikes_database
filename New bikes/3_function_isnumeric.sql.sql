--To check whether a value can be converted to a number, we create the isnumeric function. 
--The function returns TRUE if conversion is possible, otherwise FALSE.

CREATE OR REPLACE FUNCTION public.isnumeric(text)
    RETURNS boolean
    LANGUAGE 'plpgsql'
    COST 100
    IMMUTABLE STRICT PARALLEL UNSAFE
AS $$
DECLARE x NUMERIC;
BEGIN
    x = $1::NUMERIC;
    RETURN TRUE;
EXCEPTION WHEN others THEN
    RETURN FALSE;
END;
$$;
