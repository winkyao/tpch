tbl: dbgen
	cd dbgen && ./dbgen -s 0.01
dbgen:
	cd dbgen; make;
load:
	mysql -h 127.0.0.1 -P 4000 -u root -D test < dss.sql
	bash loadalldata.sh
loadmysql:
	mysql -u root < dss.sql
	bash loadalldata_mysql.sh
cleansql:
	mv dss.sql dss.sqt
	rm -rf *.sql
	rm -rf dbgen/*.sql
	mv dss.sqt dss.sql
cleantbl:
	cd dbgen; make clean; rm -f *.tbl

.PHONY: dbgen load clean tbl
