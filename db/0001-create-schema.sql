-- auth schema
CREATE SCHEMA IF NOT EXISTS auth;

-- storage schema
CREATE SCHEMA IF NOT EXISTS storage;

-- public
-- pgcrypt & citext is required to be installed in the
-- `public` schema because of Hasura
-- https://github.com/hasura/graphql-engine/issues/3657
CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;

CREATE OR REPLACE FUNCTION public.set_current_timestamp_updated_at ()
  RETURNS TRIGGER
  LANGUAGE plpgsql
  AS $$
DECLARE
  _new record;
BEGIN
  _new := new;
  _new. "updated_at" = now();
  RETURN _new;
END;
$$;

CREATE EXTENSION postgis;

