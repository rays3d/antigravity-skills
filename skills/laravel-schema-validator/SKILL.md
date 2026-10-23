---
name: laravel-schema-validator
description: "Validate Laravel database migrations and MySQL schemas against naming conventions, indexing rules, and safety checks."
---

# Database Schema Validator

## Rules

1. Reject destructive operations (`DROP TABLE`, `TRUNCATE`) unless explicitly requested.
2. Enforce Laravel naming conventions:
   - `snake_case`
   - plural table names
3. Ensure every table has a primary key using the project's standard convention.
4. Prefer InnoDB for transactional tables.
5. Verify foreign keys, indexes, and column types follow Laravel best practices.
6. Flag schema changes that may cause data loss or break existing relationships.

## Prompt

> Review this migration or SQL schema for Laravel compatibility, naming conventions, and potential migration risks.
