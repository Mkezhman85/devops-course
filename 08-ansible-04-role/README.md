# Домашнее задание к занятию 4 «Работа с roles»

## Подготовка к выполнению

1. * Необязательно. Познакомьтесь с [LightHouse](https://youtu.be/ymlrNlaHzIY?t=929).

2. Создайте два пустых публичных репозитория в любом своём проекте: vector-role и lighthouse-role.
   
   > * vectore-role: <https://github.com/Mkezhman85/vector-role>
   > * lighthouse-role: <https://github.com/Mkezhman85/lighthouse-role>

3. Добавьте публичную часть своего ключа к своему профилю на GitHub.
   
   > * Go to: <https://github.com/settings/keys>
   > * Push to `New SSH key` button
   > * View public key
   
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```
   
   > * Copy public key to github and save

---

## Основная часть

Ваша цель — разбить ваш playbook на отдельные roles.

Задача — сделать roles для ClickHouse, Vector и LightHouse и написать playbook для использования этих ролей.

Ожидаемый результат — существуют три ваших репозитория: два с roles и один с playbook.

**Что нужно сделать**

1. Создайте в старой версии playbook файл `requirements.yml` и заполните его содержимым:
   
   ```yaml
   ---
     - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
       scm: git
       version: "1.13"
       name: clickhouse 
   ```

2. При помощи `ansible-galaxy` скачайте себе эту роль.

```bash
ansible-galaxy install -r requirements.yml -p roles
```

3. Создайте новый каталог с ролью при помощи `ansible-galaxy role init vector-role`.

**Vector role**

- Creating role

```bash
ansible-galaxy role init vector
```

- Go to vector directory
  
  ```bash
  cd vector
  ```

- Git init
  
  ```bash
  git init
  ```

- Git remote origin

```bash
git remote add origin git@github.com:Mkezhman85/vector-role.git
```

- Add files to index

```bash
git add .  
```

- Commit changes

```bash
git commit -m "Vector role"
```

- Push changes to remote repo

```bash
git push --set-upstream --force origin main
```

4. На основе tasks из старого playbook заполните новую role. Разнесите переменные между `vars` и `default`.
- [vars]([vector-role/vars/main.yml at main · Mkezhman85/vector-role · GitHub](https://github.com/Mkezhman85/vector-role/blob/main/vars/main.yml))

- [default]([vector-role/defaults/main.yml at main · Mkezhman85/vector-role · GitHub](https://github.com/Mkezhman85/vector-role/blob/main/defaults/main.yml))
5. Перенести нужные шаблоны конфигов в `templates`.

6. Опишите в `README.md` обе роли и их параметры. Пример качественной документации ansible role [по ссылке](https://github.com/cloudalchemy/ansible-prometheus).
   
   - [README vector]([vector-role/README.md at main · Mkezhman85/vector-role · GitHub](https://github.com/Mkezhman85/vector-role/blob/main/README.md)
   
   - [README lighthouse]([lighthouse-role/README.md at main · Mkezhman85/lighthouse-role · GitHub](https://github.com/Mkezhman85/lighthouse-role/blob/main/README.md))

7. Повторите шаги 3–6 для LightHouse. Помните, что одна роль должна настраивать один продукт.
   **Lighthouse role**
- Creating role

```bash
ansible-galaxy role init lighthouse
```

- Go to lighthouse directory
  
  ```bash
  cd lighthouse
  ```

- Git init
  
  ```bash
  git init
  ```

- Git remote origin

```bash
git remote add origin https://github.com/Mkezhman85/lighthouse-role.git
```

- Add files to index

```bash
git add .  
```

- Commit changes

```bash
git commit -m "Lighthouse role"
```

- Push changes to remote repo

```bash
git push --set-upstream --force origin main
```

8. Выложите все roles в репозитории. Проставьте теги, используя семантическую нумерацию. Добавьте roles в `requirements.yml` в playbook.
- ```bash
  git tag -a v1.0 -m "First version 1.0"
  ```

- ```bash
  git push origin v1.0
  ```

- [requirements.yml](...)
9. Переработайте playbook на использование roles. Не забудьте про зависимости LightHouse и возможности совмещения `roles` с `tasks`.
   
   ```bash
   cd playbook
   ansible-galaxy install -r requirements.yml -p roles
   ```

10. Выложите playbook в репозиторий.
- [playbook]([devops-course/08-ansible-04-role/README.md at main · Mkezhman85/devops-course · GitHub](https://github.com/Mkezhman85/devops-course/blob/main/08-ansible-04-role/README.md))
11. В ответе дайте ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.
- [lighhouse role]([GitHub - Mkezhman85/lighthouse-role: This repo was made for netology home task](https://github.com/Mkezhman85/lighthouse-role))

- [vector role]([GitHub - Mkezhman85/vector-role](https://github.com/Mkezhman85/vector-role))

- [playbook]([devops-course/08-ansible-04-role/playbook/site.yml at main · Mkezhman85/devops-course · GitHub](https://github.com/Mkezhman85/devops-course/blob/main/08-ansible-04-role/playbook/site.yml))

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

[README]([devops-course/08-ansible-04-role/README.md at main · Mkezhman85/devops-course · GitHub](https://github.com/Mkezhman85/devops-course/blob/main/08-ansible-04-role/README.md))

---
