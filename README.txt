В папке www/index.html лежит само приложение PastMetki (один HTML-файл).
Его можно:
 1) загрузить в онлайн-конвертер HTML -> APK, или
 2) собрать через GitHub (вкладка Actions, файл .github/workflows/build.yml), или
 3) открыть проект в Android Studio (npm install, npx cap add android, npx cap open android).

Обновление поверх старой версии:
 - debug.keystore в корне проекта - фиксированный ключ подписи. Все APK, собранные через
   GitHub Actions с этим файлом, подписаны одним ключом и устанавливаются поверх друг друга.
 - versionCode растёт с каждой сборкой автоматически.
 - Если на телефоне уже стоит PastMetki, собранная раньше с ДРУГИМ ключом, один раз удалите её,
   потом ставьте новую.

Версия 1.0.3. Иконка приложения лежит в папке assets (icon-only/foreground/background.png),
при сборке через GitHub она ставится автоматически. firestore.rules нужно вставить в консоль Firebase
(Firestore -> Rules -> Publish).
