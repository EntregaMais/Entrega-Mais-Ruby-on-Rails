# Entrega-Mais-Web-Rails

> Repositório contendo Backend em Ruby on Rails

## Pré-requisitos
---

É necessário a instalação dos seguintes recursos:

- [Docker](https://docs.docker.com/get-docker/) e [WSL 2](https://docs.microsoft.com/en-us/windows/wsl/install)

## Iniciando via Docker
Na raiz do projeto, onde há o arquivo `docker-compose.yml`, execute o seguinte comando:
```
docker compose build
```

Em seguida, suba o container com o seguinte comando:
```
docker compose up -d
```

Crie a database com o seguinte comando:
```
docker compose exec web rake db:create
```

Crie as tabelas na database com o seguinte comando:
```
docker compose exec web rails db:migrate
```
<!--
- Será criado volumes gerenciados pelo próprio **Docker** na sua maquina local, a fim de persistir os dados
- **RabbitMQ** será iniciado na porta **`5672`**
	- **Management Console** será iniciado na porta **`15672`**
	- user: **`ifpb`**
	- password: **`ifpb`**
- **Postgres** serão iniciados na porta **`5432`**
	- **pgAdmin** será iniciado na porta **`5050`**
	- user: **`ifpb`**
	- password: **`ifpb`** -->


## Usando
--- 
Agora basta enviar requisições com o método **`POST`** para a porta **`3000`**:
```
http://localhost:3000/<model>
```
Com o corpo da requisição contendo um JSON neste formato:
```
{
	<atributo1>: <dado1>,
	<atributo2>: <dado2>,
	...
}
```


## Diagrama ER
---
```mermaid
erDiagram

```
---
[⬆ Voltar ao topo](#Entrega-Mais-Web-Rails)


<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
