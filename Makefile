build: compile vendor

compile:
	./node_modules/.bin/coffee -c ./src/ ./public/
	./node_modules/.bin/jade < ./src/index.jade > ./public/index.html
	./node_modules/.bin/stylus < ./src/style.styl > ./public/style.css

vendor:
