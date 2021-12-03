import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  AdState(this.initialization);
  Future<InitializationStatus> initialization;

  String get bannerAdUnitId => Platform.isAndroid
      ? "ca-app-pub-5904874307460907/8899853720"
      : "ca-app-pub-3940256099942544/6300978111";

  BannerAdListener get adListener => _adListener;

  BannerAdListener _adListener = BannerAdListener(
    onAdLoaded: (ad) => print('Ad Loaded: ${ad.adUnitId}.'),
    onAdClosed: (ad) => print('Ad Closed: ${ad.adUnitId}.'),
    onAdFailedToLoad: (ad, error) =>
        print('Ad Failed to Load: ${ad.adUnitId}, $error.'),
    onAdOpened: (ad) => print('Ad Opened: ${ad.adUnitId}.'),
  );
}

// "ca-app-pub-3940256099942544/6300978111"
// ca-app-pub-5904874307460907/5535323788
