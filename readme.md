# Механизм исполнения операций банка на основе микросервисной архитектуры

В этом репозитории описано решение кейса **Механизм исполнения операций банка на основе микросервисной архитектуры**. В этом репозитории будет описана предлагаемая арзитектура и дизайн решения, а так же ссылки на части кода.

## Содержание

* [Цели]()
* [Архитектурные решения]()
* [Контекстная диаграмма]()
* [Взаимодействие компонентов]()
* [Дизайн решения]()
* [Инструкция к запуску]()
* [Полезные ссылки]()

## Цели

Целью задачи является создание ядра системы исполнения операций банка, которое должно соответствовать нескольким архитектурным принципам:

* Предложенное решение дожно быть на основе **микросервисной архитектуры**;
* Для распределенного выполнения операции должа использоваться **событийно-ориентированная архитектура**;
* Решение должно быть в стеке языков программирования **C# или Java**;
* Для улучшения работы команды необходимо внедрить технологии **CI/CD**, которые позволят автоматизировать часть процессов.

## Архитектурные решения

На основе вышеуказанных архитектурных принципов должны быть приняты соответствующие архитектурные решения. Таким образом, решение должно обладать следующим набором свойств:

* Грамотная микросервисная архитектура должна обладавать несколькиими важнейшими качествами: **сильное зацепление** и **низкая связанность**. Первое отвечает за то, чтобы каждый компонент отвечал **только за свою задачу** и чтобы для выполнения функцонала более высокого уровня они **должны общаться друг с другом**. В то же время, второе качество отражает, что микросервисы **не имеют сильной зависимости друг от друга**, что позволяет разрабатывать каждый компонент экосистемы независимо;
* Наличие большого числа микросервисов и стремление к отказоустойчивости приводит к мысли об **использовании технологии оркестрации**, такой как *Kubernetes*;
* Поскольку использование Java является принципиальным, а Kubernetes - необходимым, то можно предложить технологию [Quarkus](https://quarkus.io/) для реализации серверной части. Помимо того, что эта среда является родной для Kubernetes, она еще и гораздо более **эффективна по памяти** (более чем в 10 раз) и **скорости** (более чем в 225 раз) по сравнению с традиционным облако-ориентированным стеком технологий.

## Контекстная диаграмма

![alt text](Context%20Diagram.png)

Здесь представлена контектсная диаграмма решения. В ней задействованы три возможные роли: **клиент** (конечный пользователь), **сотрудник банка**, обслуживающий клиента, и **техническая поддержка**, которая следит за качеством работы сервиса. Сама система имеет несколько подсистем:

* **Регистрация операции**. Эта подсистема отвечает за помощь в динамической отрисовке UI и регистрации операций. После выполнения регистрации операции попадают в подсистему *обработки операций*;
* **Обработка операции**. Компонент отвечает за контроль очередью операций и за их асинхронное выполнения. Каждый шаг тоже фискируется в подсистеме журналировани. Более того, все действия с операциями попадают в подсистему *общего журналирования*, суть которой будет разъяснена ниже;
* **Журналирование операций**. Данный модуль отвечает за ведение журнала работы с операциями. Он фиксирует все действия, которые были осуществлены в рамках той или иной операции. Он будет активно использоваться в системе **отмены операции**.
* **Отмена операции**. Этот компонент является одной из главных особенностей системы. Дело в том, что отмена операции можно проводиться даже после завершения.

## Взаимодействие компонентов

## Дизайн решения

## Инструкция к запуску

## Полезные ссылки