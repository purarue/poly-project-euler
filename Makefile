# silly makefile to run all solutions

cleanAll: runAll
	find -mindepth 2 -type f -name "Makefile" -execdir make clean \;
runAll:
	find -mindepth 2 -type f -name "Makefile" -execdir make \;
