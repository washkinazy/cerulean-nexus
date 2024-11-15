clean-containers:
    #!/usr/bin/bash
    # Podman cleanup
    podman image prune -af
    podman volume prune -f

    # Docker cleanup
    docker system prune -af        # Removes all unused images, containers, networks
    docker volume prune -f         # Removes all unused Docker volumes
    docker network prune -f        # Removes all unused Docker networks

refresh-repos:
    #!/bin/bash
    @echo "Starting git pull in all directories one level down..."
    @for dir in */; do \
        if [ -d "$dir/.git" ]; then \
            echo "Entering directory: $dir"; \
            (cd "$dir" && echo "Performing git pull in $dir" && git pull); \
            echo "Completed git pull in $dir"; \
        else \
            echo "Skipping $dir (not a git repository)"; \
        fi; \
    done
    @echo "Git pull completed in all git repositories."
