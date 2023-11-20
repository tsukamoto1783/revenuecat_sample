import 'package:flutter_dotenv/flutter_dotenv.dart';

//TO DO: add the entitlement ID from the RevenueCat dashboard that is activated upon successful in-app purchase for the duration of the purchase.
// 存在しない値でも購入はエラーにはならない。offeringsの時にエラーハンドリング入れるのが良さそう
const entitlementID = 'Pro_version';

//TO DO: add your subscription terms and conditions
const footerText =
    """Don't forget to add your subscription terms and conditions. 

Read more about this here: https://www.revenuecat.com/blog/schedule-2-section-3-8-b""";

//TO DO: add the Apple API key for your app from the RevenueCat dashboard: https://app.revenuecat.com
final appleApiKey = dotenv.env['APPLE_API_KEY']!;

//TO DO: add the Google API key for your app from the RevenueCat dashboard: https://app.revenuecat.com
final googleApiKey = dotenv.env['GOOGLE_API_KEY']!;

//TO DO: add the Amazon API key for your app from the RevenueCat dashboard: https://app.revenuecat.com
const amazonApiKey = 'amazon_api_key';
