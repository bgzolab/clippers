---
aliases:
  - MySQL Restrictions and Limitations 12 Limits in MySQL
created: 2025-07-19T12:21:00
description: 
modified: 2025-07-19T12:23:58
source: https://dev.mysql.com/doc/mysql-reslimits-excerpt/8.0/en/limits.html
tags: 
title: MySQL Restrictions and Limitations 12 Limits in MySQL
type: archive-web
---
# MySQL Restrictions and Limitations 12 Limits in MySQL

## [12.1 Identifier Length Limits](https://dev.mysql.com/doc/mysql-reslimits-excerpt/8.0/en/identifier-length.html)

The following table describes the maximum length for each type of identifier.

| Identifier Type          | Maximum Length (characters)                |
| ------------------------ | ------------------------------------------ |
| Database                 | 64 (includes NDB Cluster 8.0.18 and later) |
| Table                    | 64 (includes NDB Cluster 8.0.18 and later) |
| Column                   | 64                                         |
| Index                    | 64                                         |
| Constraint               | 64                                         |
| Stored Program           | 64                                         |
| View                     | 64                                         |
| Tablespace               | 64                                         |
| Server                   | 64                                         |
| Log File Group           | 64                                         |
| Alias                    | 256 (see exception following table)        |
| Compound Statement Label | 16                                         |
| User-Defined Variable    | 64                                         |
| Resource Group           | 64                                         |

Aliases for column names in [`CREATE         VIEW`](https://dev.mysql.com/doc/refman/8.0/en/create-view.html) statements are checked against the maximum column length of 64 characters (not the maximum alias length of 256 characters).

For constraint definitions that include no constraint name, the server internally generates a name derived from the associated table name. For example, internally generated foreign key and `CHECK` constraint names consist of the table name plus `_ibfk_` or `_chk_` and a number. If the table name is close to the length limit for constraint names, the additional characters required for the constraint name may cause that name to exceed the limit, resulting in an error.

Identifiers are stored using Unicode (UTF-8). This applies to identifiers in table definitions and to identifiers stored in the grant tables in the `mysql` database. The sizes of the identifier string columns in the grant tables are measured in characters. You can use multibyte characters without reducing the number of characters permitted for values stored in these columns.

Prior to NDB 8.0.18, NDB Cluster imposed a maximum length of 63 characters for names of databases and tables. As of NDB 8.0.18, this limitation is removed. See [Previous NDB Cluster Issues Resolved in NDB Cluster 8.0](https://dev.mysql.com/doc/refman/8.0/en/mysql-cluster-limitations-resolved.html).

Values such as user name and host names in MySQL account names are strings rather than identifiers. For information about the maximum length of such values as stored in grant tables, see [Section 12.2, “Grant Table Scope Column Properties”](https://dev.mysql.com/doc/mysql-reslimits-excerpt/8.0/en/grant-tables-scope-column-properties.html "12.2 Grant Table Scope Column Properties").

[12.2 Grant Table Scope Column Properties](https://dev.mysql.com/doc/mysql-reslimits-excerpt/8.0/en/grant-tables-scope-column-properties.html)

Scope columns in the grant tables contain strings. The default value for each is the empty string. The following table shows the number of characters permitted in each column.

**Table 12.1 Grant Table Scope Column Lengths**

|Column Name|Maximum Permitted Characters|
|---|---|
|`Host`, `Proxied_host`|255 (60 prior to MySQL 8.0.17)|
|`User`, `Proxied_user`|32|
|`Db`|64|
|`Table_name`|64|
|`Column_name`|64|
|`Routine_name`|64|

`Host` and `Proxied_host` values are converted to lowercase before being stored in the grant tables.

For access-checking purposes, comparisons of `User`, `Proxied_user`, `authentication_string`, `Db`, and `Table_name` values are case-sensitive. Comparisons of `Host`, `Proxied_host`, `Column_name`, and `Routine_name` values are not case-sensitive.

## [12.3 Limits on Number of Databases and Tables](https://dev.mysql.com/doc/mysql-reslimits-excerpt/8.0/en/database-count-limit.html)

MySQL has no limit on the number of databases. The underlying file system may have a limit on the number of directories.

MySQL has no limit on the number of tables. The underlying file system may have a limit on the number of files that represent tables. Individual storage engines may impose engine-specific constraints. `InnoDB` permits up to 4 billion tables.

## [12.4 Limits on Table Size](https://dev.mysql.com/doc/mysql-reslimits-excerpt/8.0/en/table-size-limit.html)

The effective maximum table size for MySQL databases is usually determined by operating system constraints on file sizes, not by MySQL internal limits. For up-to-date information operating system file size limits, refer to the documentation specific to your operating system.

Windows users, please note that FAT and VFAT (FAT32) are _not_ considered suitable for production use with MySQL. Use NTFS instead.

If you encounter a full-table error, there are several reasons why it might have occurred:

- The disk might be full.
- You are using `InnoDB` tables and have run out of room in an `InnoDB` tablespace file. The maximum tablespace size is also the maximum size for a table. For tablespace size limits, see [InnoDB Limits](https://dev.mysql.com/doc/refman/8.0/en/innodb-limits.html).
Generally, partitioning of tables into multiple tablespace files is recommended for tables larger than 1TB in size.
- You have hit an operating system file size limit. For example, you are using `MyISAM` tables on an operating system that supports files only up to 2GB in size and you have hit this limit for the data file or index file.
- You are using a `MyISAM` table and the space required for the table exceeds what is permitted by the internal pointer size. `MyISAM` permits data and index files to grow up to 256TB by default, but this limit can be changed up to the maximum permissible size of 65,536TB (2567 − 1 bytes).
If you need a `MyISAM` table that is larger than the default limit and your operating system supports large files, the [`CREATE TABLE`](https://dev.mysql.com/doc/refman/8.0/en/create-table.html) statement supports `AVG_ROW_LENGTH` and `MAX_ROWS` options. See [CREATE TABLE Statement](https://dev.mysql.com/doc/refman/8.0/en/create-table.html). The server uses these options to determine how large a table to permit.
If the pointer size is too small for an existing table, you can change the options with [`ALTER TABLE`](https://dev.mysql.com/doc/refman/8.0/en/alter-table.html) to increase a table's maximum permissible size. See [ALTER TABLE Statement](https://dev.mysql.com/doc/refman/8.0/en/alter-table.html).

```sql
ALTER TABLE tbl_name MAX_ROWS=1000000000 AVG_ROW_LENGTH=nnn;
```

You have to specify `AVG_ROW_LENGTH` only for tables with [`BLOB`](https://dev.mysql.com/doc/refman/8.0/en/blob.html) or [`TEXT`](https://dev.mysql.com/doc/refman/8.0/en/blob.html) columns; in this case, MySQL cannot optimize the space required based only on the number of rows.

To change the default size limit for `MyISAM` tables, set the [`myisam_data_pointer_size`](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_myisam_data_pointer_size), which sets the number of bytes used for internal row pointers. The value is used to set the pointer size for new tables if you do not specify the `MAX_ROWS` option. The value of [`myisam_data_pointer_size`](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_myisam_data_pointer_size) can be from 2 to 7. For example, for tables that use the dynamic storage format, a value of 4 permits tables up to 4GB; a value of 6 permits tables up to 256TB. Tables that use the fixed storage format have a larger maximum data length. For storage format characteristics, see [MyISAM Table Storage Formats](https://dev.mysql.com/doc/refman/8.0/en/myisam-table-formats.html).

You can check the maximum data and index sizes by using this statement:

```sql
SHOW TABLE STATUS FROM db_name LIKE 'tbl_name';
```

You also can use **myisamchk -dv /path/to/table-index-file**. See [SHOW Statements](https://dev.mysql.com/doc/refman/8.0/en/show.html), or [myisamchk — MyISAM Table-Maintenance Utility](https://dev.mysql.com/doc/refman/8.0/en/myisamchk.html).

Other ways to work around file-size limits for `MyISAM` tables are as follows:

- If your large table is read only, you can use **myisampack** to compress it. **myisampack** usually compresses a table by at least 50%, so you can have, in effect, much bigger tables. **myisampack** also can merge multiple tables into a single table. See [myisampack — Generate Compressed, Read-Only MyISAM Tables](https://dev.mysql.com/doc/refman/8.0/en/myisampack.html).
- MySQL includes a `MERGE` library that enables you to handle a collection of `MyISAM` tables that have identical structure as a single `MERGE` table. See [The MERGE Storage Engine](https://dev.mysql.com/doc/refman/8.0/en/merge-storage-engine.html).
- You are using the `MEMORY` (`HEAP`) storage engine; in this case you need to increase the value of the [`max_heap_table_size`](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_max_heap_table_size) system variable. See [Server System Variables](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html).

## [12.5 Limits on Table Column Count and Row Size](https://dev.mysql.com/doc/mysql-reslimits-excerpt/8.0/en/column-count-limit.html)

### Column Count Limits

MySQL has hard limit of 4096 columns per table, but the effective maximum may be less for a given table. The exact column limit depends on several factors:

- The maximum row size for a table constrains the number (and possibly size) of columns because the total length of all columns cannot exceed this size. See [Row Size Limits](https://dev.mysql.com/doc/mysql-reslimits-excerpt/8.0/en/column-count-limit.html#row-size-limits "Row Size Limits").
- The storage requirements of individual columns constrain the number of columns that fit within a given maximum row size. Storage requirements for some data types depend on factors such as storage engine, storage format, and character set. See [Data Type Storage Requirements](https://dev.mysql.com/doc/refman/8.0/en/storage-requirements.html).
- Storage engines may impose additional restrictions that limit table column count. For example, [`InnoDB`](https://dev.mysql.com/doc/refman/8.0/en/innodb-storage-engine.html) has a limit of 1017 columns per table. See [InnoDB Limits](https://dev.mysql.com/doc/refman/8.0/en/innodb-limits.html). For information about other storage engines, see [Alternative Storage Engines](https://dev.mysql.com/doc/refman/8.0/en/storage-engines.html).
- Functional key parts (see [CREATE INDEX Statement](https://dev.mysql.com/doc/refman/8.0/en/create-index.html)) are implemented as hidden virtual generated stored columns, so each functional key part in a table index counts against the table total column limit.

### Row Size Limits

The maximum row size for a given table is determined by several factors:

- The internal representation of a MySQL table has a maximum row size limit of 65,535 bytes, even if the storage engine is capable of supporting larger rows. [`BLOB`](https://dev.mysql.com/doc/refman/8.0/en/blob.html) and [`TEXT`](https://dev.mysql.com/doc/refman/8.0/en/blob.html) columns only contribute 9 to 12 bytes toward the row size limit because their contents are stored separately from the rest of the row.
- The maximum row size for an `InnoDB` table, which applies to data stored locally within a database page, is slightly less than half a page for 4KB, 8KB, 16KB, and 32KB [`innodb_page_size`](https://dev.mysql.com/doc/refman/8.0/en/innodb-parameters.html#sysvar_innodb_page_size) settings. For example, the maximum row size is slightly less than 8KB for the default 16KB `InnoDB` page size. For 64KB pages, the maximum row size is slightly less than 16KB. See [InnoDB Limits](https://dev.mysql.com/doc/refman/8.0/en/innodb-limits.html).

If a row containing [variable-length columns](https://dev.mysql.com/doc/refman/8.0/en/glossary.html#glos_variable_length_type) exceeds the `InnoDB` maximum row size, `InnoDB` selects variable-length columns for external off-page storage until the row fits within the `InnoDB` row size limit. The amount of data stored locally for variable-length columns that are stored off-page differs by row format. For more information, see [InnoDB Row Formats](https://dev.mysql.com/doc/refman/8.0/en/innodb-row-format.html).

- Different storage formats use different amounts of page header and trailer data, which affects the amount of storage available for rows.
- For information about `InnoDB` row formats, see [InnoDB Row Formats](https://dev.mysql.com/doc/refman/8.0/en/innodb-row-format.html).
- For information about `MyISAM` storage formats, see [MyISAM Table Storage Formats](https://dev.mysql.com/doc/refman/8.0/en/myisam-table-formats.html).

#### Row Size Limit Examples

- The MySQL maximum row size limit of 65,535 bytes is demonstrated in the following `InnoDB` and `MyISAM` examples. The limit is enforced regardless of storage engine, even though the storage engine may be capable of supporting larger rows.

```sql
mysql> CREATE TABLE t (a VARCHAR(10000), b VARCHAR(10000),
c VARCHAR(10000), d VARCHAR(10000), e VARCHAR(10000),
f VARCHAR(10000), g VARCHAR(6000)) ENGINE=InnoDB CHARACTER SET latin1;
ERROR 1118 (42000): Row size too large. The maximum row size for the used
table type, not counting BLOBs, is 65535. This includes storage overhead,
check the manual. You have to change some columns to TEXT or BLOBs
```

```sql
mysql> CREATE TABLE t (a VARCHAR(10000), b VARCHAR(10000),
c VARCHAR(10000), d VARCHAR(10000), e VARCHAR(10000),
f VARCHAR(10000), g VARCHAR(6000)) ENGINE=MyISAM CHARACTER SET latin1;
ERROR 1118 (42000): Row size too large. The maximum row size for the used
table type, not counting BLOBs, is 65535. This includes storage overhead,
check the manual. You have to change some columns to TEXT or BLOBs
```

In the following `MyISAM` example, changing a column to [`TEXT`](https://dev.mysql.com/doc/refman/8.0/en/blob.html) avoids the 65,535-byte row size limit and permits the operation to succeed because [`BLOB`](https://dev.mysql.com/doc/refman/8.0/en/blob.html) and [`TEXT`](https://dev.mysql.com/doc/refman/8.0/en/blob.html) columns only contribute 9 to 12 bytes toward the row size.

```sql
mysql> CREATE TABLE t (a VARCHAR(10000), b VARCHAR(10000),
c VARCHAR(10000), d VARCHAR(10000), e VARCHAR(10000),
f VARCHAR(10000), g TEXT(6000)) ENGINE=MyISAM CHARACTER SET latin1;
Query OK, 0 rows affected (0.02 sec)
```

The operation succeeds for an `InnoDB` table because changing a column to [`TEXT`](https://dev.mysql.com/doc/refman/8.0/en/blob.html) avoids the MySQL 65,535-byte row size limit, and `InnoDB` off-page storage of variable-length columns avoids the `InnoDB` row size limit.

```sql
mysql> CREATE TABLE t (a VARCHAR(10000), b VARCHAR(10000),
c VARCHAR(10000), d VARCHAR(10000), e VARCHAR(10000),
f VARCHAR(10000), g TEXT(6000)) ENGINE=InnoDB CHARACTER SET latin1;
Query OK, 0 rows affected (0.02 sec)
```

- Storage for variable-length columns includes length bytes, which are counted toward the row size. For example, a [`VARCHAR(255) CHARACTER SET utf8mb3`](https://dev.mysql.com/doc/refman/8.0/en/char.html) column takes two bytes to store the length of the value, so each value can take up to 767 bytes.

The statement to create table `t1` succeeds because the columns require 32,765 + 2 bytes and 32,766 + 2 bytes, which falls within the maximum row size of 65,535 bytes:

```sql
mysql> CREATE TABLE t1
(c1 VARCHAR(32765) NOT NULL, c2 VARCHAR(32766) NOT NULL)
ENGINE = InnoDB CHARACTER SET latin1;
Query OK, 0 rows affected (0.02 sec)
```

The statement to create table `t2` fails because, although the column length is within the maximum length of 65,535 bytes, two additional bytes are required to record the length, which causes the row size to exceed 65,535 bytes:

```sql
mysql> CREATE TABLE t2
(c1 VARCHAR(65535) NOT NULL)
ENGINE = InnoDB CHARACTER SET latin1;
ERROR 1118 (42000): Row size too large. The maximum row size for the used
table type, not counting BLOBs, is 65535. This includes storage overhead,
check the manual. You have to change some columns to TEXT or BLOBs
```

Reducing the column length to 65,533 or less permits the statement to succeed.

```sql
mysql> CREATE TABLE t2
(c1 VARCHAR(65533) NOT NULL)
ENGINE = InnoDB CHARACTER SET latin1;
Query OK, 0 rows affected (0.01 sec)
```

- For [`MyISAM`](https://dev.mysql.com/doc/refman/8.0/en/myisam-storage-engine.html) tables, `NULL` columns require additional space in the row to record whether their values are `NULL`. Each `NULL` column takes one bit extra, rounded up to the nearest byte.

The statement to create table `t3` fails because [`MyISAM`](https://dev.mysql.com/doc/refman/8.0/en/myisam-storage-engine.html) requires space for `NULL` columns in addition to the space required for variable-length column length bytes, causing the row size to exceed 65,535 bytes:

```sql
mysql> CREATE TABLE t3
(c1 VARCHAR(32765) NULL, c2 VARCHAR(32766) NULL)
ENGINE = MyISAM CHARACTER SET latin1;
ERROR 1118 (42000): Row size too large. The maximum row size for the used
table type, not counting BLOBs, is 65535. This includes storage overhead,
check the manual. You have to change some columns to TEXT or BLOBs
```

For information about [`InnoDB`](https://dev.mysql.com/doc/refman/8.0/en/innodb-storage-engine.html) `NULL` column storage, see [InnoDB Row Formats](https://dev.mysql.com/doc/refman/8.0/en/innodb-row-format.html).

- `InnoDB` restricts row size (for data stored locally within the database page) to slightly less than half a database page for 4KB, 8KB, 16KB, and 32KB [`innodb_page_size`](https://dev.mysql.com/doc/refman/8.0/en/innodb-parameters.html#sysvar_innodb_page_size) settings, and to slightly less than 16KB for 64KB pages.

The statement to create table `t4` fails because the defined columns exceed the row size limit for a 16KB `InnoDB` page.

```sql
mysql> CREATE TABLE t4 (
c1 CHAR(255),c2 CHAR(255),c3 CHAR(255),
c4 CHAR(255),c5 CHAR(255),c6 CHAR(255),
c7 CHAR(255),c8 CHAR(255),c9 CHAR(255),
c10 CHAR(255),c11 CHAR(255),c12 CHAR(255),
c13 CHAR(255),c14 CHAR(255),c15 CHAR(255),
c16 CHAR(255),c17 CHAR(255),c18 CHAR(255),
c19 CHAR(255),c20 CHAR(255),c21 CHAR(255),
c22 CHAR(255),c23 CHAR(255),c24 CHAR(255),
c25 CHAR(255),c26 CHAR(255),c27 CHAR(255),
c28 CHAR(255),c29 CHAR(255),c30 CHAR(255),
c31 CHAR(255),c32 CHAR(255),c33 CHAR(255)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC DEFAULT CHARSET latin1;
ERROR 1118 (42000): Row size too large (> 8126). Changing some columns to TEXT or BLOB may help.
In current row format, BLOB prefix of 0 bytes is stored inline.
```

This chapter lists current limits in MySQL 8.0.
