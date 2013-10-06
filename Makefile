build: compile coffee vendor

compile:
	./node_modules/.bin/jade < ./src/index.jade > ./public/index.html
	./node_modules/.bin/stylus < ./src/style.styl > ./public/style.css

vendor:
	cat ./bower_components/fuzzyset.js/lib/fuzzyset.js >> ./public/script.js
	cat ./bower_components/underscore/underscore-min.js >> ./public/script.js

coffee:
	cat ./src/findName.coffee > ./public/script.coffee
	./node_modules/.bin/coffee -c ./public/
	coffee ./src/processNames.coffee >> ./public/script.js
