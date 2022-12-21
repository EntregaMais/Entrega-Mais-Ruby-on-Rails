@echo off
rd /s /q %cd%\tmp\db\ && mkdir %cd%\tmp\db\ && docker compose down && docker compose build && docker compose up -d
echo Espere o banco postgres mandar
echo uma mensagem de ready to accept connections
echo para rodar o reset_part2.bat