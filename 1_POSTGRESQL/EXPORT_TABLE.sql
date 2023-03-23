
-- ##########    
-- FUNCION PARA EXPORTAR TABLES

CREATE OR REPLACE FUNCTION copy_my_tables ()
RETURNS void LANGUAGE plpgsql AS $$
DECLARE
    r record;
BEGIN
    FOR r IN
        SELECT table_schema, table_name 
		FROM information_schema.tables
		WHERE true 
		AND table_type = 'BASE TABLE'
		AND table_schema = 'public'
    LOOP
        EXECUTE format ('COPY %s.%s TO ''C:\Users\Public\%s_%s.csv'' WITH (FORMAT CSV, HEADER);',
            r.table_schema, r.table_name, r.table_schema, r.table_name);
    END LOOP;
END $$;
-- ##########


-- ##########    
-- EXPORTAR TABLES
SELECT copy_my_tables();
-- ##########
