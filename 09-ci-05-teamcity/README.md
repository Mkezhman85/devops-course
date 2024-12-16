# Домашнее задание к занятию 11 «Teamcity»

## Подготовка к выполнению

1. В Yandex Cloud создайте новый инстанс (4CPU4RAM) на основе образа `jetbrains/teamcity-server`.
![alt text](image.png)
2. Дождитесь запуска teamcity, выполните первоначальную настройку.
![alt text](image-2.png)
3. Создайте ещё один инстанс (2CPU4RAM) на основе образа `jetbrains/teamcity-agent`. Пропишите к нему переменную окружения `SERVER_URL: "http://<teamcity_url>:8111"`.
![alt text](image-3.png)
4. Авторизуйте агент.
![alt text](image-1.png)
5. Сделайте fork [репозитория](https://github.com/aragastmatb/example-teamcity).
6. Создайте VM (2CPU4RAM) и запустите [playbook](./infrastructure).
![alt text](image-4.png)
![alt text](image-5.png)

## Основная часть

1. Создайте новый проект в teamcity на основе fork.
![alt text](image-6.png)
2. Сделайте autodetect конфигурации.
![alt text](image-7.png)
3. Сохраните необходимые шаги, запустите первую сборку master.
![alt text](image-8.png)
![alt text](image-9.png)
4. Поменяйте условия сборки: если сборка по ветке `master`, то должен происходит `mvn clean deploy`, иначе `mvn clean test`.
![alt text](image-10.png)
5. Для deploy будет необходимо загрузить [settings.xml](./teamcity/settings.xml) в набор конфигураций maven у teamcity, предварительно записав туда креды для подключения к nexus.
![alt text](image-11.png)
6. В pom.xml необходимо поменять ссылки на репозиторий и nexus.
[pom.xml](https://github.com/Mkezhman85/example-teamcity-hw/blob/master/pom.xml)
7. Запустите сборку по master, убедитесь, что всё прошло успешно и артефакт появился в nexus.
![alt text](image-12.png)
![alt text](image-13.png)
8. Мигрируйте `build configuration` в репозиторий.
![alt text](image-18.png)
9. Создайте отдельную ветку `feature/add_reply` в репозитории.
[](https://github.com/Mkezhman85/example-teamcity-hw/commit/07df202ae74747d1665f81e3c95e7dc27e68b2ee)
10. Напишите новый метод для класса Welcomer: метод должен возвращать произвольную реплику, содержащую слово `hunter`.
[](https://github.com/Mkezhman85/example-teamcity-hw/commit/07df202ae74747d1665f81e3c95e7dc27e68b2ee)
11. Дополните тест для нового метода на поиск слова `hunter` в новой реплике.[](https://github.com/Mkezhman85/example-teamcity-hw/commit/07df202ae74747d1665f81e3c95e7dc27e68b2ee)
12. Сделайте push всех изменений в новую ветку репозитория.
[](https://github.com/Mkezhman85/example-teamcity-hw/commit/07df202ae74747d1665f81e3c95e7dc27e68b2ee)
13. Убедитесь, что сборка самостоятельно запустилась, тесты прошли успешно.
![alt text](image-14.png)
14. Внесите изменения из произвольной ветки `feature/add_reply` в `master` через `Merge`.
[](https://github.com/Mkezhman85/example-teamcity-hw/pull/1)
15. Убедитесь, что нет собранного артефакта в сборке по ветке `master`.
![alt text](image-15.png)
16. Настройте конфигурацию так, чтобы она собирала `.jar` в артефакты сборки.
![alt text](image-16.png)
17. Проведите повторную сборку мастера, убедитесь, что сбора прошла успешно и артефакты собраны.
![alt text](image-17.png)
18. Проверьте, что конфигурация в репозитории содержит все настройки конфигурации из teamcity.
19. В ответе пришлите ссылку на репозиторий.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
