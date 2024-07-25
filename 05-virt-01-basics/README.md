# Задание 2. Выбор типа платформы в зависимости от задачи

| №   | Задача                                                     | Выбранный тип платформы            | Критерий выбора                                                                                                                                                                               |
| --- | ---------------------------------------------------------- | ---------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | Высоконагруженная база данных MySql, критичная к отказу    | Физические сервера                 | Для базы данных, которая требует больших ресурсов целесообразно выделить отдельный сервер                                                                                                     |
| 2   | Различные web-приложения                                   | Виртуализация уровня ОС<br/>Docker | Для различных веб приложение одним из самых главных критериев является быстрота развертывания и доставки инкремента. Для такого рода задач целесообразно использовать контейнерные технологии |
| 3   | Windows-системы для использования бухгалтерским отделом    | Паравиртуализация<br/>Hyper-V      | Данный гипервизор наиболее адаптирован к данной ОС.                                                                                                                                           |
| 4   | Системы, выполняющие высокопроизводительные расчёты на GPU | Полная (аппаратная) виртуализация  | Такого рода системы требуют много ресурсов, а также производительности                                                                                                                        |

# Задача 3. Выберите подходящую систему управления виртуализацией для предложенного сценария. Опишите ваш выбор.

| №   | Задача                                                                                                                                                                                                                                                                                   | Тип платформы | Критерий выбора                                                                                          |
| --- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------- | -------------------------------------------------------------------------------------------------------- |
| 1   | 100 виртуальных машин на базе<br> Linux и Windows, общие задачи, нет особых требований. Преимущественно Windows<br> based-инфраструктура, требуется реализация программных балансировщиков<br> нагрузки, репликации данных и автоматизированного механизма создания резервных<br> копий. | VMWare        | Имеет различные компоненты. Не<br> имеет ограничений при выборе ОС                                       |
| 2   | Требуется наиболее<br> производительное бесплатное open source-решение для виртуализации небольшой<br> (20-30 серверов) инфраструктуры на базе Linux и Windows виртуальных машин.                                                                                                        | KVM           | Данная платформа обозначена как<br> open source-решение. Для windows показывает себя лучше, чем Xen      |
| 3   | Необходимо бесплатное,<br> максимально совместимое и производительное решение для виртуализации<br> Windows-инфраструктуры.                                                                                                                                                              | Hyper-V       | Используется для ОС Windows                                                                              |
| 4   | Необходимо рабочее окружение для<br> тестирования программного продукта на нескольких дистрибутивах Linux.                                                                                                                                                                               | Xen           | Как преимущество для данной<br> платформы обозначено "Нативная для большинства современных<br><br> ядер" |

# Задача 4. Проблемы и недостатки гетерогенной среды виртуализации
Развертывание нескольких систем управления в будущем ведет к высоким трудозатратам на поддержку. Если нет жестких ограничений, которые являются критериями выбора системы управления, то выбор гетерогенной среды виртуализации нецелесообразен