run: index.html
	python -m webbrowser index.html
index.html: src/Main.elm
	elm make src/Main.elm
clean:
	rm -rf elm-stuff index.html
