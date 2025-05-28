# Variables
DOCKER_COMPOSE = ./srcs/docker-compose.yml
SERVICES = 

.PHONY: all build up reload down clean fclean nuke

# Build and start all containers
all: build up

# Build containers
build:
	@echo "Building containers..."
	@$(DOCKER_COMPOSE) build $(SERVICES)

# Start containers
up:
	@echo "Starting containers..."
	@$(DOCKER_COMPOSE) up -d $(SERVICES)

# Stop containers
down:
	@echo "Stopping containers..."
	@$(DOCKER_COMPOSE) down

# Rebuild and restart containers
reload: down build up

# Remove containers, networks, and volumes
clean:
	@echo "Cleaning containers, networks, and volumes..."
	@$(DOCKER_COMPOSE) down --volumes --remove-orphans

# Full clean - remove containers, networks, volumes, and images
fclean: clean
	@echo "Removing Docker images..."
	@$(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans

# Nuclear option - removes everything Docker-related (use with caution!)
nuke: fclean
	@echo "Nuking all Docker resources..."
	@docker system prune -a --volumes --force
	@echo "All Docker resources have been removed."

# Help target
help:
	@echo "Available targets:"
	@echo "  all     - Build and start containers (default)"
	@echo "  build   - Build containers"
	@echo "  up      - Start containers"
	@echo "  down    - Stop containers"
	@echo "  reload  - Rebuild and restart containers"
	@echo "  clean   - Remove containers, networks, and volumes"
	@echo "  fclean  - Full clean (including images)"
	@echo "  nuke    - Remove ALL Docker resources (use with caution!)"
	@echo "  help    - Show this help message"