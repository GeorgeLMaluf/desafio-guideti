# Desafio Guideti
Este projeto é uma proposta de solução ao desafio descrito no arquivo [CHALLENGE.md](CHALLENGE.md).

## Requesitos
Qual sistema com Docker e Docker-Compose instalado e uma conexão com internet.

## Arquitetura do Projeto
Este projeto é separado em dois artefatos:
- Api (backend): uma API REST escrita em Ruby on Rails
- App (frontend): uma aplicação web escrita em Angular

## Configuração
### Criar os containers em Docker
O primeiro passo para executar o projeto é criar os containers em Docker. Para isso execute:
```
$ docker-compose build
```

## Execução do Projeto
Para executar o projeto:
```
$ docker-compose up -d
```

Depois abra o endereço abaixo em seu navegador de preferência:
```
http://localhost:4200/
```