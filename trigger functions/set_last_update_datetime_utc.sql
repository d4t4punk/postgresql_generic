-- Trigger: set_last_update_datetime_utc

-- DROP TRIGGER IF EXISTS set_last_update_datetime_utc ON public.base_table;

CREATE TRIGGER set_last_update_datetime_utc
    BEFORE UPDATE 
    ON public.base_table
    FOR EACH ROW
    EXECUTE FUNCTION public.update_last_update_datetime_utc();