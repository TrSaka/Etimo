import 'package:etimology/core/utils/colors.dart';
import 'package:etimology/core/utils/size.dart';
import 'package:etimology/models/dictionary_word_model.dart';
import 'package:etimology/products/routes/app_route.gr.dart';
import 'package:etimology/products/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SavedView extends StatefulWidget {
  const SavedView({super.key});

  @override
  State<SavedView> createState() => _SavedViewState();
}

class _SavedViewState extends State<SavedView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // if (Hive.isBoxOpen("SavedBox") == true) Hive.box("SavedBox").close();
    super.dispose();
  }

  void openBox() async {
    if (Hive.isBoxOpen("SavedBox") == false) Hive.openBox("SavedBox");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: SizedBox(
                child: FutureBuilder(
                    future: Hive.openBox("SavedBox"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      debugPrint(snapshot.data.toString());

                      if (snapshot.connectionState == ConnectionState.done) {
                        List data = [];
                        for (int i = 0; i < Hive.box("SavedBox").length; i++) {
                          data.add(Hive.box("SavedBox").getAt(i));
                        }

                        if (data.isNotEmpty) {
                          return ValueListenableBuilder(
                              valueListenable:
                                  Hive.box("SavedBox").listenable(),
                              builder: (context, value, child) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: Hive.box("SavedBox").length,
                                  itemBuilder: (context, index) {
                                    DictionaryModel data =
                                        Hive.box("SavedBox").getAt(index);
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              DefaultResponsiveSizes(context)
                                                      .kSpacesize *
                                                  2),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              height: DefaultResponsiveSizes(
                                                          context)
                                                      .kSpacesize *
                                                  2),
                                          InkWell(
                                            onTap: () {
                                              NavRoute(
                                                      WordInfoRoute(data: data))
                                                  .toPush(context);
                                            },
                                            child: Container(
                                              height: 175,
                                              width: DefaultResponsiveSizes(
                                                      context)
                                                  .kDefaultWidth,
                                              decoration: BoxDecoration(
                                                color: UIColor.favColor,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 25,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {
                                                              Hive.box(
                                                                      "SavedBox")
                                                                  .deleteAt(
                                                                      index);

                                                              setState(() {});
                                                            },
                                                            icon: const Icon(
                                                              Icons
                                                                  .close_rounded,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    data.kelime.toUpperCase(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayLarge,
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          DefaultResponsiveSizes(
                                                                      context)
                                                                  .kSpacesize *
                                                              3),
                                                  Text("Kök: ${data.kok}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium),
                                                  Text("Kök Türü: ${data.tur}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium),
                                                  Text("Ek: -${data.ek}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              });
                        } else {
                          return const NotFoundWidget();
                        }
                      } else {
                        return const NotFoundWidget();
                      }
                    }),
              ),
            )),
      ),
    );
  }
}

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: DefaultResponsiveSizes(context).kSpacesize * 2,
            ),
            const Text(
              "Kaydedilenler",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w800,
                  fontSize: 36),
            ),
            const Text("Kaydettiğin bir sözcük bulamadım"),
            SizedBox(
                height:
                    DefaultResponsiveSizes(context).kDefaultNormalHeight / 3),
            SizedBox(
              height: DefaultResponsiveSizes(context).kDefaultHeight / 2,
              child: SvgPicture.asset(
                "assets/images/not_found.svg",
              ),
            ),
          ],
        ));
  }
}
