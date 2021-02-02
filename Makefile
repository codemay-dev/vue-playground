local:
	@make build_local
	@make run_local

docker:
	@make build_docker
	@make run_docker

build_local:
	$(info ******** Building App ********)
	@ npm install

run_local:
	$(info ******** Starting App ********)
	@ npm run serve

build_docker:
	$(info ******** Building Docker Container ********)
	@ docker build -t vuejs-cookbook/dockerize-vuejs-app .

run_docker:
	$(info ******** Starting App ********)
	@ docker run -it -p 8080:80 --rm --name dockerize-vuejs-app-1 vuejs-cookbook/dockerize-vuejs-app