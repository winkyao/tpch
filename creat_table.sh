#!/bin/bash
mysql -u root < dss.sql
mysql -u root -h 127.0.0.1 -P 4000 < dss.sql
