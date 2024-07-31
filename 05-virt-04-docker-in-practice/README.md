# Задача 0
Убедитесь что у вас НЕ(!) установлен docker-compose, для этого получите следующую ошибку от команды `docker-compose --version`
![alt text](image.png)

Убедитесь что у вас УСТАНОВЛЕН docker compose(без тире) версии не менее v2.24.X, для это выполните команду `docker compose version`
![alt text](image-1.png)

---
# Задача 1

1. Сделайте в своем github пространстве fork репозитория
Ссылка: https://github.com/Mkezhman85/shvirtd-example-python

2. Создайте файл с именем Dockerfile.python для сборки данного проекта
   - [x] (для 3 задания изучите https://docs.docker.com/compose/compose-file/build/ ). 
   
   - [x] Используйте базовый образ python:3.9-slim. 
   ```Dockerfile
   FROM python:3.9-slim
   WORKDIR /app
   COPY . .
   RUN pip install --no-cache-dir -r requirements.txt
   CMD [ "python", "main.py"]
   ```
   - [x] Обязательно используйте конструкцию COPY . . в Dockerfile.

   - [x] Не забудьте исключить ненужные в имадже файлы с помощью dockerignore. 
   ```ini
   /haproxy
   /nginx
   .gitignore
   compose.yaml
   init.sh
   LICENCE
   proxy.yaml
   schema.pdf
   README.md
   .dockerignore
   ```
   - [x] Протестируйте корректность сборки.
  
    ```bash
    docker build -t python_app .
    ```
    ![alt text](image-2.png)
