-- Table: public.base_table

-- DROP TABLE IF EXISTS public.base_table;

CREATE TABLE IF NOT EXISTS public.base_table
(
    ainc_key bigserial NOT NULL DEFAULT,
    create_datetime_utc timestamp with time zone NOT NULL DEFAULT timezone('utc'::text, now()),
    last_update_datetime_utc timestamp with time zone,
    cv_data character varying(256) COLLATE pg_catalog."default",
    num_data numeric,
    CONSTRAINT base_table_pkey PRIMARY KEY (ainc_key)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.base_table
    OWNER to postgres;

-- Trigger: set_last_update_datetime_utc

-- DROP TRIGGER IF EXISTS set_last_update_datetime_utc ON public.base_table;

CREATE TRIGGER set_last_update_datetime_utc
    BEFORE UPDATE 
    ON public.base_table
    FOR EACH ROW
    EXECUTE FUNCTION public.update_last_update_datetime_utc();