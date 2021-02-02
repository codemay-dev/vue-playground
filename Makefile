local:
	@make update_local
	@make build_local
	@make run_local

docker_dev:
	@make update_local
	@make build_docker_dev
	@make run_docker_dev

docker_prod:
	@make update_local
	@make build_docker_prod
	@make run_docker_prod

build_local:
	$(info ******** Building App ********)
	@ npm install

run_local:
	$(info ******** Starting App ********)
	@ npm run serve

build_docker_dev:
	$(info ******** Building Docker Container ********)
	@ docker build -t vuejs-cookbook/dockerize-vuejs-app .

run_docker_dev:
	$(info ******** Starting App ********)
	@ docker run -it -p 8080:8080 --rm --name dockerize-vuejs-app-1 vuejs-cookbook/dockerize-vuejs-app

build_docker_prod:
	$(info ******** Building Docker Container ********)
	@ docker build -f dockerfile.prod -t vuejs-cookbook/dockerize-vuejs-app .

run_docker_prod:
	$(info ******** Starting App ********)
	@ docker run -it -p 8080:80 --rm --name dockerize-vuejs-app-1 vuejs-cookbook/dockerize-vuejs-app

BRANCH := $(shell git branch --show-current)

update_local:
ifeq ($(BRANCH),master)
	$(info ******** Updating Master ********)
	@ git pull
else
	$(info ******** Updating Master & Branch ********)
	@ git stash
	@ git checkout master
	@ git pull
	@ git checkout $(BRANCH)
	@ git rebase master
	@ git stash pop
endif

push:
ifeq ($(BRANCH),master)
	$(info ******** Already On Master ********)
	@echo "Currently on master, checkout branch"
else
	$(info ******** Rebase & Push Branch ********)
	@ git checkout master
	@ git pull
	@ git checkout $(BRANCH)
	@ git rebase master
	@ git push origin $(BRANCH)
endif
