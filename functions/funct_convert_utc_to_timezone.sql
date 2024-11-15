-- FUNCTION: public.funct_convert_utc_to_timezone(timestamp with time zone, text)

-- DROP FUNCTION IF EXISTS public.funct_convert_utc_to_timezone(timestamp with time zone, text);

CREATE OR REPLACE FUNCTION public.funct_convert_utc_to_timezone(
	utc_time timestamp with time zone,
	target_timezone text)
    RETURNS timestamp without time zone
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
BEGIN
     RETURN utc_time AT TIME ZONE target_timezone;
END;
$BODY$;

ALTER FUNCTION public.funct_convert_utc_to_timezone(timestamp with time zone, text)
    OWNER TO postgres;
