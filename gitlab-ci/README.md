# Централизованный CI

Централизованный ci.

Пример использования

# Концепции

Реализована сборка и деплой стендов development test stage prod.

На проекте в gitlab должны быть определены переменные
- DOCKER_REGISTRY          - адрес docker registry
- DOCKER_REGISTRY_LOGIN    - логин docker registry
- DOCKER_REGISTRY_PASSWORD - пароль docker registry
- KUBECONFIGDEV            - kubeconfig dev кластера
- KUBECONFIGPROD           - kubeconfig prod кластера
- HTTPSCRT и HTTPSKEY      - кодированные в base64 ключи

Инфраструктурный код находится в папке .infra в проекте.

Сборка и пуш образа проекта должна быть описана скриптом .infra/build.sh

Helm-чарт проекта должен находиться в .infra/helm

Для ингресса кластера kubernetes, в который произвоится деплой, должен быть заказана wildcart A-запись в DNS (например *.project.dev.example.ru).

Для данного доменного имени должен быть заказан wildcard сертификат ssl и размещён как описано выше (HTTPSCRT и HTTPSKEY).

Учётные данные для dev-стендов, содержащих обфусцированные непродуктивные данные предполагается размещать в .infra/helm/values.yaml с возможностью указания имени окружения (поле environment.name gitlab ci).

Учётные данные для продуктивных сервисов размещаются в gitlab variables и передаются в чарт через директиву --set . Для повышения безопасности используйте gitlab protected variables.

# Подключение ci в проект

Для включения ci в проект нужно использовать следующий код в .gitlab-ci.yml.

В случае необходимости, можно указать конкретную ветку или комит при инклюде.

В качестве минимума настроек нужно переопределить переменные с именами стендов.

```
---
include:
  - project: py-libs/gitlab-ci
    file: .gitlab-ci-default.yml
  - project: py-libs/gitlab-ci
    file: .gitlab-ci-tests.yml

variables:
  URL_DEVELOP: "http://service-develop.project.dev.example.ru"
  URL_TEST: "https://service-test.project.dev.example.ru"
  URL_STAGE: "https://service-stage.project.dev.example.ru"
  URL_PRODUCTION: "https://service.project.example.ru"
```

Если в проекте нет тестов, можно не инклюдить .gitlab-ci-tests.yml
