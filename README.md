# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

Список сущностей

1. Тесты(создание, управление, выполнение)
2. Проверка тестов(аутенфикация)
3. Права доступа(их разграничение)
4. Результат
5. Соц.сеть(публикация результата в соц.сети)

Внимание! Задание нужно выполнять в новой ветке и оформлять как Pull Request.

1. Создайте Rails-модели с нужными атрибутами для следующих сущностей:

   Тест
   Вопрос
   Ответ
   Пользователь
   Категория

2. С помощью механизма миграций, добавьте ограничения целостности на уровне БД в соответствующих таблицах для необходимых атрибутов так, чтобы они не могли содержать значение NULL
3. С помощью механизма миграций добавьте значения по умолчанию:

   Для уровня Теста
   Для атрибута correct у Ответа
