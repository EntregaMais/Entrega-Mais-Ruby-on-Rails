@echo off
docker compose down && docker compose build && docker compose up -d
echo Espere o banco postgres mandar
echo uma mensagem de ready to accept connections
echo para rodar o exec_create_migrate.bat