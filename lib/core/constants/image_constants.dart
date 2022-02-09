class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance => _instance ??= ImageConstants._init();
  ImageConstants._init();

  String get girl => 'barbie'.toPng.imageWithPath;
  String get pink => 'pink'.toPng.imageWithPath;
  String get coconat => 'coconat'.toPng.imageWithPath;
  String get neo => 'neo'.toPng.imageWithPath;
  String get sherbet1 => 'sherbet-1'.toPng.imageWithPath;
  String get sherbet2 => 'sherbet-2'.toPng.imageWithPath;
  String get vanilla => 'vanilla'.toPng.imageWithPath;
}

extension ImageConstantsExtension on String {
  String get imageWithPath => 'assets/$this';
  String get toPng => '$this.png';
}
