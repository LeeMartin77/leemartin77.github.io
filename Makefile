jekyll-build:
	docker run --rm --volume="$$PWD/JekyllSite:/srv/jekyll" -it jekyll/builder:4.1.0 jekyll build

jekyll-build-ci:
	docker run --rm --volume="$$PWD/JekyllSite:/srv/jekyll" jekyll/builder:4.1.0 jekyll build

jekyll-serve:
	docker run --rm --volume="$$PWD/JekyllSite:/srv/jekyll" --publish [::1]:4000:4000 -it jekyll/jekyll:4.1.0 jekyll serve