## Unit tests

Для создания моков используется библиотека mockito с кодогенерацией. Для кодогенерации необходима дополнительно библиотека build_runner. 

Если были изменены тесты, то необходимо запустить кодогенерацию для слоя, в котором было изменение. Перейти в слой:

```
cd modules/architecture/data
cd modules/architecture/domain
```

выполнить
```
flutter pub run build_runner build --delete-conflicting-outputs
```