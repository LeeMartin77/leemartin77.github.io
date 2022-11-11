jekyll-build:
	docker run --rm --volume="$$PWD/JekyllSite:/srv/jekyll" -it jekyll/builder:4.1.0 jekyll build

jekyll-serve:
	docker run --rm --volume="$$PWD/JekyllSite:/srv/jekyll" --publish 4000:4000 -it jekyll/jekyll:4.1.0 jekyll serve

jekyll-podman-serve:
	podman run --rm --volume="$$PWD/JekyllSite:/srv/jekyll" --publish 4000:4000 -it docker.io/jekyll/jekyll:4.1.0 jekyll serve