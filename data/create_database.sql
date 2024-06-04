-- open a terminal and run the following command from the root of the project

-- 1) sudo -i -u postgres
--   "-i" flag is used to login as the postgres user
--   "-u" flag is used to specify the user to login as

-- 2) psql -f data/create_database.sql
--   "-f" flag is used to specify the file to run

-- 3) psql -U mountify < data/create_tables.sql
--   "-U" flag is used to specify the user to run the command as
        -- we don't use -d flag because user and database names are the same
--   "<" is used to specify the file to run

-- 4) psql -U mountify < data/seeding.sql

CREATE USER mountify WITH PASSWORD 'mountify';

CREATE DATABASE mountify OWNER mountify;