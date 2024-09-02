# Project Deployment Guide

## 🛠️ Deployment Steps

To deploy this app, follow these steps:

### 1. Add Keycloak Host to Hosts File

First, open your terminal at the root of the project and run the following command:

```powershell
Start-Process cmd.exe -ArgumentList "/c PATH_TO_ROOT_PROJECT/KeycloakHost.bat" -Verb RunAs     
# Change PATH_TO_ROOT_PROJECT for your root directory of the proyect. In my case is  C:/Users/genar/Documents/GitHub/MultiRubro
```

From inside the root project directory:
### 2. Start databases

```powershell
docker-compose up -d mysql-database
docker-compose up -d mysql-database-multirubro
docker-compose up -d mysql-database-multirubroproducts
```
### 3. Start services that will consume the app

```powershell
docker-compose up -d rabbitmq # To start RabbitMQ
docker-compose up -d keycloak # Wait 1 minute for its start before starting the other containers
```

### 4. Start microservices

```powershell
docker-compose up -d config-service # Wait 15 seconds

docker-compose up -d eureka-service # Wait 15 seconds

docker-compose up -d gateway-service # Wait 20 seconds

docker-compose up -d multi-rubro-project-1 

docker-compose up -d multi-rubro-project-2 

docker-compose up -d multi-rubro-project-products-1 

docker-compose up -d multi-rubro-project-products-2 
```



