# Задача 1

1. Установлен docker и docker compose на рабочую станцию с использованием инструкции по ссылке: https://wiki.astralinux.ru/pages/viewpage.action?pageId=158601444
Проверка версии docker
![alt text](./images/docker-version.png "Проверка версии docker")
Проверка версии docker-compose
![alt text](./images/docker-compose-version.png "Проверка версии docker-compose")
1. Создан публичный репозиторий с именем "custom-nginx" на https://hub.docker.com Ссылка на репозиторий: https://hub.docker.com/repository/docker/mkezhman85/custom-nginx/general 
![alt text](./images/custom-nginx-repo.png "Custom nginx repo on docker-registry")
1. Скачан образ nginx:1.21.1 командой `docker pull ginx:1.21.1`
![alt text](./images/nginx-docker-image.png "Custom nginx repo on docker-registry")
1. Создан [Dockerfile](./Dockerfile)
2. Реализована замена дефолтной индекс-страницы(/usr/share/nginx/html/index.html), на файл index.html с содержимым.
```html
<html>

<head>
    Hey, Netology
</head>

<body>
    <h1>I will be DevOps Engineer!</h1>
</body>

</html>
```
3. Соберите и отправьте созданный образ в свой dockerhub-репозитории c tag 1.0.0 (ТОЛЬКО ЕСЛИ ЕСТЬ ДОСТУП).
Команда для сборки образа
```bash
docker build -t custom-nginx:1.0.0 .
```
Добавление в docker-hub
```bash
docker tag custom-nginx:1.0.0 mkezhman85/custom-nginx:1.0.0
docker push mkezhman85/custom-nginx:1.0.0
```
![alt text](./images/nginx-tag.png "nginx tag")
1. Предоставьте ответ в виде ссылки на https://hub.docker.com/<username_repo>/custom-nginx/general .

Ссылка: https://hub.docker.com/repository/docker/mkezhman85/custom-nginx/general

---

# Задача 2

Запустите ваш образ custom-nginx:1.0.0 командой docker run в соответвии с требованиями:
имя контейнера "ФИО-custom-nginx-t2"
контейнер работает в фоне
контейнер опубликован на порту хост системы 127.0.0.1:8080
```bash
docker run \
    -it \
    -d \
    --name sayurkin-custom-nginx-t2 \
    -p 8080:80 \
    custom-nginx:1.0.0
```
Не удаляя, переименуйте контейнер в "custom-nginx-t2"
```bash
docker rename sayurkin-custom-nginx-t2 custom-nginx-t2
```
![alt text](./images/container-rename.png "container rename")
Выполните команду date +"%d-%m-%Y %T.%N %Z" ; sleep 0.150 ; docker ps ; ss -tlpn | grep 127.0.0.1:8080  ; docker logs custom-nginx-t2 -n1 ; docker exec -it custom-nginx-t2 base64 /usr/share/nginx/html/index.html
![alt text](./images/execute-command.png "execute big command")
Убедитесь с помощью curl или веб браузера, что индекс-страница доступна.
![alt text](./images/curl-nginx.png "Curl nginx")
В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.

---

# Задача 3

1. Воспользуйтесь docker help или google, чтобы узнать как подключиться к стандартному потоку ввода/вывода/ошибок контейнера "custom-nginx-t2".
https://docs.docker.com/reference/cli/docker/container/attach/
Запустить контаейнер с флагом `-it`
```bash
docker run \
    -it \
    -d \
    --name custom-nginx-t2 \
    -p 8080:81 \
    custom-nginx:1.0.0
```
Переименовать
```bash
docker rename sayurkin-custom-nginx-t2 custom-nginx-t2
```
Подключитесь к контейнеру 
```bash
docker attach --detach-keys="ctrl-q" custom-nginx-t2
```
![alt text](./images/container-attach.png "Container attach")
Нажмите комбинацию Ctrl-C.
Выполните docker ps -a и объясните своими словами почему контейнер остановился.
![alt text](./images/deatch-container.png "Detach attach")
> Указанная комбинация клавиш останавливает процесс. В момент нажатия мы были в контейнере
Перезапустите контейнер
![alt text](./images/container-restart.png "Container restart")
Зайдите в интерактивный терминал контейнера "custom-nginx-t2" с оболочкой bash.
![alt text](./images/container-exec.png "Container exec")
Установите любимый текстовый редактор(vim, nano итд) с помощью apt-get.
![alt text](./images/vim-version.png "Vim version")
Отредактируйте файл "/etc/nginx/conf.d/default.conf", заменив порт "listen 80" на "listen 81".
![alt text](./images/change-conf.png "Change conf")
Запомните(!) и выполните команду nginx -s reload, а затем внутри контейнера curl http://127.0.0.1:80 ; curl http://127.0.0.1:81.
![alt text](./images/conf-after-changes.png "Conf after changes")
![alt text](./images/curl-8081.png "Curl 8081")
Выйдите из контейнера, набрав в консоли exit или Ctrl-D.
![alt text](./images/exit-from-container.png "Exit from container")
Проверьте вывод команд: 
- `ss -tlpn | grep 127.0.0.1:8080` 
- `docker port custom-nginx-t2`
- `curl http://127.0.0.1:8080`. 
![alt text](./images/commands-after-container-port-changed.png "Commands after container port changed")
Кратко объясните суть возникшей проблемы.
> Был изменен порт сервера в контейнере.

Это дополнительное, необязательное задание. Попробуйте самостоятельно исправить конфигурацию контейнера, используя доступные источники в интернете. Не изменяйте конфигурацию nginx и не удаляйте контейнер. Останавливать контейнер можно. пример источника

Удалите запущенный контейнер "custom-nginx-t2", не останавливая его.(воспользуйтесь --help или google)
![alt text](./images/container-delete.png "Container delete")



---

# Задача 4

Запустите первый контейнер из образа centos c любым тегом в фоновом режиме, подключив папку текущий рабочий каталог $(pwd) на хостовой машине в /data контейнера, используя ключ -v.
Запустите второй контейнер из образа debian в фоновом режиме, подключив текущий рабочий каталог $(pwd) в /data контейнера.
Подключитесь к первому контейнеру с помощью docker exec и создайте текстовый файл любого содержания в /data.
Добавьте ещё один файл в текущий каталог $(pwd) на хостовой машине.
Подключитесь во второй контейнер и отобразите листинг и содержание файлов в /data контейнера.

---

# Задача 5
...
