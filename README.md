# アプリ内課金のサンプル
baseはRevenueCat公式のサンプルアプリを踏襲。
https://github.com/RevenueCat/purchases-flutter/tree/main/revenuecat_examples/MagicWeather

## 動作環境
```txt: flutter doctor
[✓] Flutter (Channel stable, 3.13.2, on macOS 14.0 23A344 darwin-arm64, locale ja-JP)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.2)
[✓] Xcode - develop for iOS and macOS (Xcode 15.0)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2022.1)
[✓] VS Code (version 1.84.2)
[✓] Connected device (3 available)
[✓] Network resources
```
パッケージバージョン：purchases_flutter: ^6.2.0

## ios
SANDBOX環境で購入可能。
履歴がRevenueCatのダッシュボードに反映される。

## android
Google Play Consoleでクローズドテストの申請通らないとAPIが許可されずエラーとなること注意。

## .env
RevenueCatのAPIは、.env.templateを.envにリネームして、APIキーを設定する。

## 参考
https://zenn.dev/tsukatsuka1783/scraps/34236ac4b98006