#!/bin/bash
# Общая подготовка Android-проекта (используется и для запасной сборки без виджетов)
set -e
npx cap add android
npx @capacitor/assets@3.0.5 generate --android --iconBackgroundColor '#0E0C16' --iconBackgroundColorDark '#0E0C16' || true
npx cap sync android
mkdir -p ~/.android && cp debug.keystore ~/.android/debug.keystore
sed -i "s/versionCode 1/versionCode ${GITHUB_RUN_NUMBER:-1}/" android/app/build.gradle
sed -i 's/versionName "1.0"/versionName "1.0.4"/' android/app/build.gradle
sed -i 's#</manifest>#<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/></manifest>#' android/app/src/main/AndroidManifest.xml
chmod +x android/gradlew
