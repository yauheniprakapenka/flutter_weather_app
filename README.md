# flutter_weather_app

<img height="160" src="https://i.pinimg.com/564x/83/50/b7/8350b7848ea3761e0a41c28a735dfc0c.jpg">



### О проекте
---

Приложение для отображени погоды для Android и iOS.

### Задание
---

Minimal functionality:
- In the forecast tab, show the forecast for the next 5 days (in 3 hour intervals) at your current location
- Make sure you consider and handle all possible states of the app (offline, data not loading, errors, etc) 

Use:
- Flutter + Dart
- Flutter BLoC
- Make the layout responsive for all screen sizes your app supports
- Support iOS and Android platforms
- Min API Level: 21 and iOS 11
- Open Weather Map API (http://openweathermap.org/api)
- Geolocation for determining the current position of the device
- Material Design Guidelines + Material Design Icon
- Use the design for the application provided below (it is mockup, not final design)
- Share weather as text

Result:
- Code should be published to a public repository on GitHub
- Repository should contains commit history instead of single one
- Select icons by yourself. App should contain non-default launch icon
- Link should be provided to interviewer.

<img height="300" alt="image" src="https://user-images.githubusercontent.com/47568606/155134262-11f768f7-e68d-49bb-9007-310873057558.png">


### Подготовка к запуску
---
Для получения погоды:

1. Зарегистрировать в сервисе `Openweathermap` и добавить личный секретный ключ из https://home.openweathermap.org/api_keys в проект в параметр `_apiKey` по пути:
lib/src/data/lib/src/services/openweathermap_service.dart
2. Если ключа нет, то можно заменить в коде источник данных на заглушку с
`OpenWeatherMapRemoteDataSourceImpl` -> на `WeatherMockRemoteDataSourceImpl` по пути: lib/src/data/lib/src/di/data_service_locator.dart

### Пример поделиться погодой
---

```
Flutter Weather App

city: Gomel, BY
temperature: 7 °C
weather: Clear
wind speed: 9.0, meter/sec
humidity: 57, %
wind degrees: S/SW
pressure: 1000, , hPa
rain: -, mm
```

### Демо
---
<img src="docs/demo-share.gif" height=300>   <img src="docs/demo-pages.gif" height=300>   <img src="docs/demo-no-internet.gif" height=300>

### Скриншоты
---

<img src="https://user-images.githubusercontent.com/47568606/155092576-89b6e467-1112-4252-b207-e0a7d654f860.png" height=300>   <img src="https://user-images.githubusercontent.com/47568606/155092849-422d08fb-3ce9-408d-8fdf-7b6bbda2a280.png" height=300>   <img src="https://user-images.githubusercontent.com/47568606/155093754-90cedfc4-6685-49bc-83c4-5e5c5da03a79.png" height=300>   <img src="https://user-images.githubusercontent.com/47568606/155094616-a27949fd-0a08-47d6-8d3e-61606d7efd98.png" height=300>   <img src="https://user-images.githubusercontent.com/47568606/155134585-89afbccc-3c8c-473c-92cb-81175568eb39.png" height=300>   <img src="https://user-images.githubusercontent.com/47568606/155134522-7873af6f-3608-4e67-8827-d3bfbc861873.png" height=300> 



