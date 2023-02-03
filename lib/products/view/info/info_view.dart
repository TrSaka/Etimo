// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:etimology/products/view_model/info/info_view_model.dart';
import 'package:flutter/material.dart';

import 'package:etimology/core/utils/size.dart';

import '../../widgets/item_widget.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var viewModel = InfoViewModel();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizer(context, 2),
              Center(
                child: Text("Yapım Ekleri",
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              const Divider(color: Colors.grey, thickness: 2),
              sizer(context, 1),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.ii,
                      style: theme.textTheme.titleSmall,
                    ),
                    sizer(context, 1),
                    const Text(
                        "İsim soylu sözcüklerden yeni isim soylu sözcük yapan eklerdir."),
                    sizer(context, 1),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              children: const [
                                ItemWidget(text: "el: söz-el"),
                                ItemWidget(text: "siz: su-suz"),
                                ItemWidget(text: "ci: göz-cü"),
                                ItemWidget(text: "su: çocuk-su"),
                                ItemWidget(
                                    text:
                                        "ce: Türk-çe (Eşitlik hâl\n eki ile karıştırmayın.)"),
                                ItemWidget(text: "daş: karın-daş = kardeş"),
                                ItemWidget(text: "inci: üç-üncü"),
                                ItemWidget(text: "lık: şeker-lik"),
                                ItemWidget(text: "li: köy-lü"),
                                ItemWidget(text: "da/de: göz-de"),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              children: const [
                                ItemWidget(text: "er: üç-er"),
                                ItemWidget(text: "ki: yarın-ki"),
                                ItemWidget(text: "msi: ekşi-msi"),
                                ItemWidget(text: "cil: ev-cil"),
                                ItemWidget(text: "şın/cın: sarı-şın"),
                                ItemWidget(text: "sal: kum-sal"),
                                ItemWidget(text: "ıt: yaş-ıt"),
                                ItemWidget(text: "ceğiz: kız-cağız"),
                                ItemWidget(text: "cik: tepe-cik"),
                                ItemWidget(text: "ti: esin-ti"),
                                ItemWidget(text: "z: yalın-z"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              sizer(context, 3),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "İsimden fiil yapan yapım ekleri",
                      style: theme.textTheme.titleSmall,
                    ),
                    sizer(context, 1),
                    const Text(
                        "İsim soylu sözcüklerden yeni bir fiil yapan eklerdir."),
                    sizer(context, 1),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              children: const [
                                ItemWidget(text: "le: baş-la"),
                                ItemWidget(text: "l: doğru-l"),
                                ItemWidget(text: "da: fısıl-da"),
                                ItemWidget(text: "kır: fış-kır"),
                                ItemWidget(text: "laş: şaka-laş"),
                                ItemWidget(text: "se: garip-se"),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              children: const [
                                ItemWidget(text: "al: az-al"),
                                ItemWidget(text: "a: kan-a"),
                                ItemWidget(text: "at: yön-et"),
                                ItemWidget(text: "lan: ev-len"),
                                ItemWidget(text: "(a)r: mor-ar"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              sizer(context, 3),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fiilden isim yapan yapım ekleri",
                      style: theme.textTheme.titleSmall,
                    ),
                    sizer(context, 1),
                    const Text(
                        "Fiil soylu sözcüklerden yeni bir isim yapan eklerdir."),
                    sizer(context, 1),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              children: const [
                                ItemWidget(text: "im: seç-im"),
                                ItemWidget(text: "gın: dal-gın"),
                                ItemWidget(text: "ici: yırt-ıcı"),
                                ItemWidget(text: "ecek: yak-acak"),
                                ItemWidget(text: "laş: şaka-laş"),
                                ItemWidget(text: "ga: böl-ge"),
                                ItemWidget(text: "gıç: bil-giç"),
                                ItemWidget(text: "ın: yığ-ın"),
                                ItemWidget(text: "ıntı: es-inti"),
                                ItemWidget(text: "maca: bul-maca"),
                                ItemWidget(text: "anak: gel-enek"),
                                ItemWidget(text: "ıt: geç-it"),
                                ItemWidget(text: "mak: çak-mak"),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              children: const [
                                ItemWidget(text: "gi: ver-gi"),
                                ItemWidget(text: "i: yaz-i"),
                                ItemWidget(text: "ca: düşün-ce"),
                                ItemWidget(text: "ak: yat-ak"),
                                ItemWidget(text: "gan: çalış-kan"),
                                ItemWidget(text: "ik: kes-ik"),
                                ItemWidget(text: "nç: gül-ünç"),
                                ItemWidget(text: "(e)r: gel-ir"),
                                ItemWidget(text: "sel: gör-sel"),
                                ItemWidget(text: "ış: dik-iş"),
                                ItemWidget(text: "ma: dondur-ma"),
                                ItemWidget(text: "tı: belir-ti"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              sizer(context, 3),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fiilden fiil yapan yapım ekleri",
                      style: theme.textTheme.titleSmall,
                    ),
                    sizer(context, 1),
                    const Text(
                        "Fiil soylu sözcüklerden yeni bir fiil yapan eklerdir."),
                    sizer(context, 1),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              children: const [
                                ItemWidget(text: "t: yürü-t"),
                                ItemWidget(text: "dır: yaz-dır"),
                                ItemWidget(text: "(ı)n: sil-in"),
                                ItemWidget(text: "ı: kaz-ı"),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              children: const [
                                ItemWidget(text: "(a)r: kop-ar"),
                                ItemWidget(text: "(ı)l: at-ıl"),
                                ItemWidget(text: "ele: kov-ala"),
                                ItemWidget(text: "msa: an-ımsa"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row doubleItemWidget(
    String text1,
    String text2,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemWidget(text: text1),
        const SizedBox(width: 40),
        ItemWidget(text: text2),
      ],
    );
  }

  SizedBox sizer(BuildContext context, double x) {
    return SizedBox(height: DefaultResponsiveSizes(context).kSpacesize * x);
  }
}
