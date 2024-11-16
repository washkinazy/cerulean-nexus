# Clean all containers, images, volumes, and networks
clean-containers:
    #!/usr/bin/bash
    echo "Cleanuing podman containers and images..."
    podman image prune -af
    podman volume prune -f

    echo "Cleaning docker containers, images, volumes, and networks..."
    docker system prune -af
    docker volume prune -f 
    docker network prune -f 

# Recursively pull all git repositories in the current directory
refresh-repos:
    #!/bin/bash
    echo "Starting git pull in all directories one level down..."
    for dir in */; do \
        if [ -d "$dir/.git" ]; then \
            echo "Entering directory: $dir"; \
            (cd "$dir" && echo "Performing git pull in $dir" && git pull); \
            echo "Completed git pull in $dir"; \
        else \
            echo "Skipping $dir (not a git repository)"; \
        fi; \
    done
    echo "Git pull completed in all git repositories."
