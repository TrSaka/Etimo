import 'dart:async';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:etimology/products/view/about/about_view.dart';
import 'package:etimology/products/view/info/info_view.dart';
import 'package:etimology/products/view/question/question_view.dart';
import 'package:etimology/products/view/saved/saved_view.dart';
import 'package:etimology/products/view/search/search_view.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';

class MenuViewModel {
  String appBarText = "ETIMO";
  String appBarSubtext = "Sözcük Kökü Sözlüğü";

  int indexPage = 2;
  List<dynamic> screensOfApplication = const [
    AboutView(),
    InfoView(),
    SearchView(),
    SavedView(),
    QuestionView(),
  ];

  StreamController<int> controller = StreamController<int>.broadcast();

  Widget customNavigationBar() {
    return CurvedNavigationBar(
        index: indexPage,
        backgroundColor: Colors.transparent,
        color: UIColor.mainTheme,
        buttonBackgroundColor: UIColor.mainTheme,
        onTap: ((index) {
          debugPrint("Page Index: $index");
          controller.sink.add(index);
        }),
        animationDuration: const Duration(milliseconds: 200),
        items: const [
          Icon(Icons.more_horiz_rounded, color: UIColor.white),
          Icon(Icons.fork_right_rounded, color: UIColor.white),
          Icon(Icons.search, color: UIColor.white),
          Icon(Icons.bookmark_border_rounded, color: UIColor.white),
          Icon(Icons.question_mark_rounded, color: UIColor.white),
        ]);
  }
}
