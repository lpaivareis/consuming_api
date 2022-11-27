# Detalhes do projeto

Este projeto roda em **Ruby** na versão`3.0.2` utilizando **Rails** `7.0.3`. Se precisar você pode utilizar um gerenciador de versões para facilitar como o [ASDF](https://www.lucascaton.com.br/2020/02/17/instalacao-do-ruby-do-nodejs-no-ubuntu-linux-usando-asdf).

## Configuração

Neste projeto, estamos usando o Sqlite, se você precisar alterá-los para rodar em sua maquina local, você pode fazê-lo em [database.yml](config/database.yml).

Para executar o projeto siga os passos a abaixo:

```console
$ bundle install
$ bin/rails db:create db:migrate
$ bin/rails server
```

Para qualidade de código e linter, foi utilizado as gens rubocop, rubocop-rails, para rodar use o comando abaixo:

```console
$ bin/rails rubocop
```
