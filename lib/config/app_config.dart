enum Flavor {
  STAGING,
  DEVELOPMENT,
  PRODUCTION,
}

class AppConfig {
  static Flavor? appFlavor;

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'http://localhost:8000';
      case Flavor.PRODUCTION:
        return '';
      case Flavor.STAGING:
        return '';
      default:
        return '';
    }
  }

  static String get apiKey {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return '12345678';
      case Flavor.PRODUCTION:
        return '';
      case Flavor.STAGING:
        return '';
      default:
        return '';
    }
  }

  static String aboutUsUrl = "https://gogrown.chmod.live/";
  static String termsUsUrl = "http://www.africau.edu/images/default/sample.pdf";
  static String privacyUsUrl =
      "http://www.africau.edu/images/default/sample.pdf";
}


 const double kDefaultPadding = 20;
