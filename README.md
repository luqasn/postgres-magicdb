# postgres-magicdb
PostgreSQL proxy that allows connecting with any credentials and any db, creating it on the fly if it does not exist.
Useful for integration testing when you don't know and control the unit under test's configuration.

Pair it with a wildcard dns server that resolves `*.rds.amazonaws.com` and you have a "fake RDS"!

## Remarks
DON'T USE IN PRODUCTION.

Also, this assumes all your services use different database names. As this is just a single postgres instance, you will otherwise interfere with other services' data.

## Credits
Uses https://github.com/KnifeMaster007/pgAuthProxy under the hood.
