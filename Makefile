.PHONY: new deploy

run:
	bundle exec jekyll serve --port 8080

deploy:
	sh deploy.sh
