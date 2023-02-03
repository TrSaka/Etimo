import 'dart:async';

class AboutViewModel {
  String titleText = "Hakkında";
  String creditText =
      "Bu uygulama Etimologlar tarafından Teknofest 2023 için tasarlanmıştır";
  String rateUsText = "Uygulamamızı değerlendirin";
  String mainText =
      "Türk dilinin gelişimi köklerinin kesin biçimi olmasıyla başlamış,düşünce ürünlerinin sergilenmesiyle genişlemiştir. Bir dil, yalnızca kökleriyle değil, o köklerle üretilen düşünce ürünleriyle varlığını sürdürebilir. Sözcüğün kökünü bilmeden düşündüğünü sanan bir kimse, sadece kendisini kandırır. Çünkü sözcüğün kökünü bilmeden nitelikli bir düşünme eylemi gerçekleşemez. Yani düşünmek dile sağlanır ve dil, düşünmekle güç kazanır.\nBiz de bu bilinçle yola çıktık ve tespit etmekte zorlandığımız Türkçe sözcük kökleri için bir sözlük uygulaması geliştirdik. Arama motoru ile araştırdığımız sözcük kökü sonuçlarında ki bilgi kirliliğinin önüne geçmek ve sizlere zaman kazandırmak uygulamamızın temel amacıdır.";

  StreamController controller1 = StreamController.broadcast();
}
