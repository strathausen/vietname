build: compile vendor

compile:
	./node_modules/.bin/coffee -o ./public/ -c ./src/script.coffee
	./node_modules/.bin/jade < ./src/index.jade > ./public/index.html
	./node_modules/.bin/stylus < ./src/style.styl > ./public/style.css

vendor:
	cat ./bower_components/fuzzyset.js/lib/fuzzyset.js >> ./public/script.js
