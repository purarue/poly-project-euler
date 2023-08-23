run: main.beam
	erl -noshell -s main main -s init stop
main.beam: main.erl
	erlc main.erl
clean:
	rm -f main.beam erl_crash.dump
