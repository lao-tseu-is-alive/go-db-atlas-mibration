#!/bin/bash
# put your postgres database connection info in .env in your home project
# https://www.postgresql.org/docs/current/libpq-envars.html
export $(grep -v '^#' .env | xargs)
if [[ -z "${PGPASSWORD}" ]]; then
  echo "## 💥💥 ERROR: you must export postgres database connection env variable like PGPASSWORD ! "
else
  atlas schema inspect -u "postgresql://localhost:5432/" > db_atlas_ddl_schema.hcl
  atlas schema inspect -u "postgresql://localhost:5432/" --log '{{ sql . }}' > db_ddl_schema.sql
fi