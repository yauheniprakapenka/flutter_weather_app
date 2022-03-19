# flutter_weather_app

<p align="center">
  <img src="https://i.pinimg.com/564x/83/50/b7/8350b7848ea3761e0a41c28a735dfc0c.jpg" width=280>
</p>

Приложение для отображения погоды.

Погода
- Получение погоды из Open Weather Map API (http://openweathermap.org/api)
- Погода сегодня
- Прогноз погоды на 5 дней с интервалом в 3 часа
- Определение геолокации устройства для отображения погоды
- Поделиться текущей погодой через мессенджеры
- Погода кэшируется при первом запуске и больше нет лишних обращений на сервер. Возможно обновление погоды вручную. 

Локализация
- Используется библиотека `intl`
- Поддержка `ru` и `en` локализации
- Определение языка устройства
- Смена языка

Адаптивность
- Отображение бокового меню

Архитектура
- Архитектура приложения Clean architecture
- Архитектура состояния Flutter BLoC, Provider

### Пример поделиться текущей погодой
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
<img src=".github/demo-share.gif" height=300>   <img src=".github/demo-pages.gif" height=300>   <img src=".github/demo-no-internet.gif" height=300>   <img src=".github/demo-change-locale.gif" height=300>

### Скриншоты
---

<img src="https://user-images.githubusercontent.com/47568606/155092576-89b6e467-1112-4252-b207-e0a7d654f860.png" height=300>   <img src="https://user-images.githubusercontent.com/47568606/155092849-422d08fb-3ce9-408d-8fdf-7b6bbda2a280.png" height=300>   <img src="https://user-images.githubusercontent.com/47568606/155093754-90cedfc4-6685-49bc-83c4-5e5c5da03a79.png" height=300>   <img src="https://user-images.githubusercontent.com/47568606/155094616-a27949fd-0a08-47d6-8d3e-61606d7efd98.png" height=300>   

<img src="https://user-images.githubusercontent.com/47568606/155134585-89afbccc-3c8c-473c-92cb-81175568eb39.png" height=300>   <img src="https://user-images.githubusercontent.com/47568606/155134522-7873af6f-3608-4e67-8827-d3bfbc861873.png" height=300> 

### Как добавить новую локализацию
---

<p align="center">
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMV8QuUAECmcmHZeG3TACzrqs-CVQBUDggxg&usqp=CAU" width=100>
</p>

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

- Для отсутствующего AppLocalizations импортировать 
```
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
```

- Выбрать текст
```
import '../../shared/localization/extensions/l10n_extension.dart';
```

```
context.l10n?.today ?? ''
```