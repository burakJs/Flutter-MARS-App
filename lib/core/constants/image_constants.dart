class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance => _instance ??= ImageConstants._init();
  ImageConstants._init();

  String get girl => 'barbie'.toPng.imageWithPath;
}

extension ImageConstantsExtension on String {
  String get imageWithPath => 'assets/$this';
  String get toPng => '$this.png';
}
