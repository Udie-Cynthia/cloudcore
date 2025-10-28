# CloudCore static site — Nginx container
FROM nginx:alpine

# Maintain a lightweight, secure image
EXPOSE 80

# Copy the entire static site into Nginx's web root
# (We'll add a .dockerignore in the next step to avoid copying .git, etc.)
COPY . /usr/share/nginx/html

# Healthcheck (optional but nice)
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost/ || exit 1
