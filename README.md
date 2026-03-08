# 🌐 SUT Browser

Navegador baseado em Chromium feito com Flutter.
Funciona em **Windows**, **Android** e **iPhone**.

---

## 💻 Windows - Gerar o .exe

### Pré-requisito: instalar Flutter
1. Baixe Flutter: https://flutter.dev/docs/get-started/install/windows
2. Extraia e adicione ao PATH

### Rodar:
Dê dois cliques em `INSTALAR_WINDOWS.bat`

O `.exe` vai aparecer em:
`build\windows\x64\runner\Release\sut_browser.exe`

---

## 📱 Android - Gerar o .apk

### Pré-requisito: instalar Flutter + Android Studio
1. Instale Flutter: https://flutter.dev/docs/get-started/install/windows
2. Instale Android Studio: https://developer.android.com/studio
3. Execute: `flutter doctor` para verificar tudo

### Gerar APK:
Abra o terminal na pasta do projeto e rode:
```
flutter build apk --release
```
O APK vai estar em: `build\app\outputs\flutter-apk\app-release.apk`

Instale no celular e pronto!

---

## 🍎 iPhone (iOS)

Requer Mac + Xcode:
```
flutter build ios --release
```

---

## ✨ Funcionalidades
- Abas múltiplas
- Modo anônimo
- Mecanismo de busca configurável (Google, Bing, DuckDuckGo, Ecosia)
- Motor Chromium (via WebView)
- Interface adaptada para PC e celular
- Barra de navegação (voltar, avançar, recarregar)
