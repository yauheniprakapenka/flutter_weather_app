## Как добавить новую локализацию

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
import '../../../shared/localization/providers/locale_provider.dart';
```

- Выбрать текст
```
context.l10n?.temperatureSymbolCelsius
```