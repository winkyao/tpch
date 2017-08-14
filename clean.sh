#!/bin/bash
mysql -u root < clean.sql
mysql -u root -h 127.0.0.1 -P 4000 < clean.sql
