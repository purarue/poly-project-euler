# silly makefile to run all solutions

clean: cleanAll
runAll:
	find -mindepth 2 -type f -name "Makefile" -execdir make \;
cleanAll:
	find -mindepth 2 -type f -name "Makefile" -execdir make clean \;

