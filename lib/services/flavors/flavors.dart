enum Flavor {
  prod,
  stg,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'BKD';
      case Flavor.stg:
        return 'Stg BKD';
      case Flavor.dev:
        return 'Dev BKD';
      default:
        return 'title';
    }
  }
}
