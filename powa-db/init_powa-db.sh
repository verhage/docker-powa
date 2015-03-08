#!/bin/bash
set -o verbose

gosu postgres echo "shared_preload_libraries='pg_stat_statements,powa,pg_stat_kcache,pg_qualstats'" >> $PGDATA/postgresql.conf
gosu postgres echo "host all all 0.0.0.0/0 md5" >> $PGDATA/pg_hba.conf

# you can't create the extensions in single user mode
gosu postgres pg_ctl -w -D $PGDATA start
gosu postgres psql -f /usr/local/src/powa-archivist-REL_2_0_0/install_all.sql
gosu postgres pg_ctl stop -w

