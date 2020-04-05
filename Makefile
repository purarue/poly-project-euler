# silly makefile to run all solutions

cleanAll: runAll
runAll:
	find -mindepth 2 -type f -name "Makefile" -execdir make \;
clean:
	find -mindepth 2 -type f -name "Makefile" -execdir make clean \;

