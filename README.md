# flutter_weather_app

<img height="160" src="https://i.pinimg.com/564x/83/50/b7/8350b7848ea3761e0a41c28a735dfc0c.jpg">



### О проекте
---

Приложение для отображения погоды.

### Возможности
---

- Open Weather Map API (http://openweathermap.org/api)
- Вкладка для прогноза погоды на 5 дней с интервалом в 3 часа
- Обработка состояний приложения (отсутствие сети, загрузка)
- Архитектура состояния Flutter BLoC, Provider
- Архитектура приложения Clean architecture
- Адаптивный дизайн
- Поддержка iOS и Android
- Min API Level: 21 and iOS 11
- Определение геолокации текущего положения устройства
- Поделиться текущий погодой через мессенджеры
- Смена языка

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
<img src="docs/demo-share.gif" height=300>   <img src="docs/demo-pages.gif" height=300>   <img src="docs/demo-no-internet.gif" height=300>   <img src="docs/demo-change-locale.gif" height=300>

### Скриншоты
---

<img src="https://user-images.githubusercontent.com/47568606/155092576-89b6e467-1112-4252-b207-e0a7d654f860.png" height=300>   <img src="https://user-images.githubusercontent.com/47568606/155092849-422d08fb-3ce9-408d-8fdf-7b6bbda2a280.png" height=300>   <img src="https://user-images.githubusercontent.com/47568606/155093754-90cedfc4-6685-49bc-83c4-5e5c5da03a79.png" height=300>   <img src="https://user-images.githubusercontent.com/47568606/155094616-a27949fd-0a08-47d6-8d3e-61606d7efd98.png" height=300>   

<img src="https://user-images.githubusercontent.com/47568606/155134585-89afbccc-3c8c-473c-92cb-81175568eb39.png" height=300>   <img src="https://user-images.githubusercontent.com/47568606/155134522-7873af6f-3608-4e67-8827-d3bfbc861873.png" height=300> 


### Локализция
---

- Для локализаии используется библиотека `intl`

- Конфигурация локализации
```
l10n.yaml
```

- Новые строки добавляются в json
```
lib/src/ui/shared/localization/arb/app_en.arb
lib/src/ui/shared/localization/arb/app_ru.arb
```

- Выполнить flutter pub get. Сгенерируются новые файлы по пути
```
.dart_tool/flutter_gen/gen_l10n/app_localizations_ru.dart
```

- В проблемах может отобразиться, что файлы локализации не найдены. Для исправления нужно перезапустить IDE.

- Для использования значений локализации импортировать файл 
```
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
```

- Выбрать нужный текст
```
AppLocalizations.of(context)?.today ?? ''
```