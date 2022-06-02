# postgres-magicdb
PostgreSQL proxy that allows connecting with any credentials and any db, creating it on the fly if it does not exist.
Useful for integration testing when you don't know and control the unit under test's configuration.

DON'T USE IN PRODUCTION.

Uses https://github.com/KnifeMaster007/pgAuthProxy under the hood.
