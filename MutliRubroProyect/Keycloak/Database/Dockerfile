
FROM mysql:8.0


COPY keycloak.sql /docker-entrypoint-initdb.d/

# Ensure the dump file has the right permissions
RUN chmod 644 /docker-entrypoint-initdb.d/keycloak.sql