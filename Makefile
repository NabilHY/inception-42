COMPOSE_PATH=srcs/docker-compose.yml
.PHONY: build up down clean restart logs ps

build:
	echo "Building Docker Images 🐳"
	docker-compose -f $(COMPOSE_PATH) build 
	# echo "=== Done ==="
up:
	echo "Launching Containers on background"
	docker-compose -f $(COMPOSE_PATH)  up -d 
down:
	echo "Stop and delete containers, volumes and networks"
	docker-compose -f $(COMPOSE_PATH) down 
clean:
	docker-compose -f $(COMPOSE_PATH) down -v --remove-orphans 

logs:
	docker-compose -f $(COMPOSE_PATH) logs -f 
ps:
	docker-compose -f $(COMPOSE_PATH) ps 
psa:
	docker-compose -f $(COMPOSE_PATH) ps -a 


restart: down up
