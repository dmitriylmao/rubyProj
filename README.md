# ONLIBRARY

Проект по созданию сарвиса для отслеживания книг, взятых в библиотеке

## Инструкция по установке

* Версия Ruby - 3.3.3

Чтобы подготовить проект к запуску локально, необходимо сделать следующее:

```bash
bundle install
yarn install
bundle exec rake db:create
bundle exec rake db:migrate
```

Для запуска web-сервера и сборки клиента необходимо сделать:

```bash
foreman start -f Procfile.dev
```

Для сборки клиента без запуска сервера необходимо сделать:

```bash
foreman start -f Procfile.front
```