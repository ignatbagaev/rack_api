Реализовать JSON API, используя для роутинга только rack.
Хранилище данных на свое усмотрение (в памяти, в файловой системе, в редисе, в постгресе, ...).
Приложение должно отвечать на 3 запроса:

* POST /users
Принимает json вида:
{
  "email": "john@example.com"
}
email обязателен, проверяется на формат и уникальность. Ошибка возвращается с соответствующим кодом (email_missing, email_already_exists, wrong_email_format)

Возвращает:
{
  "data": {
    "id": "2ea550bc-705c-4702-b6d0-831919a33e5c",
    "email": "john@example.com"
  }
}

* GET /users
Возвращает список созданных пользователей:
{
  "data": [
    {
      "id": "2ea550bc-705c-4702-b6d0-831919a33e5c",
      "email": "john@example.com"
    }
  ]
}

* GET /users/:id
Возвращает пользователя по id:
{
  "data": {
    "id": "2ea550bc-705c-4702-b6d0-831919a33e5c",
    "email": "john@example.com"
  }
}

* На все остальные запросы возвращается 404 с кодом not_found

Как запустить:

1. склонируйте репозиторий - git@github.com:ignatbagaev/rack_api.git

2. перейдите в директорию с приложением,

3. в терминале введите следующие команды

- gem install bundler (на случай если не утановлен)
- bundle install
- rackup config.ru
