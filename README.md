# flutter_weather_app

### Подготовка к запуску:
---
Для получения погоды:

1. Зарегистрировать в сервисе `Openweathermap` и добавить личный секретный ключ из https://home.openweathermap.org/api_keys в проект в параметр `_apiKey` по пути:
lib/src/data/lib/src/services/openweathermap_service.dart
2. Если ключа нет, то можно заменить в коде источник данных на заглушку с
`OpenWeatherMapRemoteDataSourceImpl` -> на `WeatherMockRemoteDataSourceImpl` по пути: lib/src/data/lib/src/di/data_service_locator.dart

### Демо
---
<img src="https://user-images.githubusercontent.com/47568606/155092576-89b6e467-1112-4252-b207-e0a7d654f860.png" height=300> <img src="
https://user-images.githubusercontent.com/47568606/155092849-422d08fb-3ce9-408d-8fdf-7b6bbda2a280.png" height=300>  <img src="
https://user-images.githubusercontent.com/47568606/155093754-90cedfc4-6685-49bc-83c4-5e5c5da03a79.png" height=300>  <img src="
https://user-images.githubusercontent.com/47568606/155094616-a27949fd-0a08-47d6-8d3e-61606d7efd98.png" height=300>



