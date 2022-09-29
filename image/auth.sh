#!/bin/bash

set -eo pipefail -o nounset
# read "input" 
INPUT=$(</dev/stdin)
# extract desired database name
database=$(echo -n "$INPUT" | grep '^database=.*$' |  tr -d '\n' | cut -d'=' -f2-)

# generate hashed pw to return
md5=$(printf '%s' "$TARGET_PASSWORD$TARGET_USER" | md5sum | cut -d ' ' -f 1)
# create database requested by user on demand if it does not exist
echo "SELECT 'CREATE DATABASE $database' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '$database')\gexec" | psql "postgresql://$TARGET_USER:$TARGET_PASSWORD@$TARGET_HOST/$TARGET_DUMMY_DB"

# return connection info to proxy
# keep original options intact
# but override user
cat << END
$INPUT
user=$TARGET_USER
_META_TARGET_HOST=$TARGET_HOST
_META_TARGET_CRED=md5$md5
END
