extension ImageExtension on String {
  String get toPng => "asset/image/${this}.png";
  String get toLottie => "asset/lotties/${this}.svg";
  String get toSVG => "asset/svg/${this}.svg";
  String get toJPG => "asset/image/${this}.jpg";
  String get toJSON => "asset/lottie/${this}.json";
}
