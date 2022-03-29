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