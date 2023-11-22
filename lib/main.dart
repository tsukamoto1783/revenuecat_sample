import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'src/app.dart';
import 'src/constant.dart';
import 'store_config.dart';

Future<void> main() async {
  await dotenv.load();

  if (Platform.isIOS || Platform.isMacOS) {
    StoreConfig(
      store: Store.appStore,
      apiKey: appleApiKey,
    );
  } else if (Platform.isAndroid) {
    // Run the app passing --dart-define=AMAZON=true
    // const useAmazon = bool.fromEnvironment("amazon");
    // StoreConfig(
    //   store: useAmazon ? Store.amazon : Store.playStore,
    //   apiKey: useAmazon ? amazonApiKey : googleApiKey,
    // );
    StoreConfig(
      store: Store.playStore,
      apiKey: googleApiKey,
    );
  }

  WidgetsFlutterBinding.ensureInitialized();

  await _configureSDK();

  runApp(const MagicWeatherFlutter());
}

Future<void> _configureSDK() async {
  // Enable debug logs before calling `configure`.
  await Purchases.setLogLevel(LogLevel.debug);

  /*
    - appUserID is nil, so an anonymous ID will be generated automatically by the Purchases SDK. Read more about Identifying Users here: https://docs.revenuecat.com/docs/user-ids

    - observerMode is false, so Purchases will automatically handle finishing transactions. Read more about Observer Mode here: https://docs.revenuecat.com/docs/observer-mode
    */
  PurchasesConfiguration configuration;

  // NOTE: appUserIDはAuthとかに合わして指定しておいた方が融通効きそう。
  // アナリクスのための管理やサブスクの共有とかをするならID指定は必須かも。
  if (StoreConfig.isForAmazonAppstore()) {
    configuration = AmazonConfiguration(StoreConfig.instance.apiKey)
      ..appUserID = null
      ..observerMode = false;
  } else if (StoreConfig.isForAppleStore()) {
    configuration = PurchasesConfiguration(appleApiKey)..appUserID = null;
  } else if (StoreConfig.isForGooglePlay()) {
    configuration = PurchasesConfiguration(googleApiKey)..appUserID = null;
  } else {
    configuration = PurchasesConfiguration(StoreConfig.instance.apiKey)
      ..appUserID = null
      ..observerMode = false;
  }
  await Purchases.configure(configuration);
  final offerings = await Purchases.getOfferings();
  debugPrint('offerings: $offerings');
  return;
}
