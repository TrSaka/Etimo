import 'package:etimology/core/utils/size.dart';
import 'package:etimology/models/dictionary_word_model.dart';
import 'package:etimology/products/widgets/app_bar_title_widget.dart';
import 'package:etimology/products/widgets/star_widget.dart';
import 'package:etimology/products/view_model/word/word_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class WordInfoView extends StatefulWidget {
  final DictionaryModel data;
  const WordInfoView({super.key, required this.data});

  @override
  State<WordInfoView> createState() => _WordInfoViewState();
}

class _WordInfoViewState extends State<WordInfoView> {
  final WordInfoViewModel viewModel = WordInfoViewModel();
  @override
  void dispose() {
    viewModel.controller1.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Icon defaultIcon =
        const Icon(Icons.bookmark_border_rounded); // default unsaved
    WordInfoViewModel viewModel = WordInfoViewModel();
    var responsive = DefaultResponsiveSizes(context);
    final word = widget.data;

    List keys = [];

    try {
      for (int i = 0; i < Hive.box("SavedBox").length; i++) {
        DictionaryModel data = Hive.box("SavedBox").getAt(i);
        keys.add(data.kelime);
      }
      if (keys.isEmpty) {
        defaultIcon = defaultIcon;
      }
      if (keys.contains(widget.data.kelime)) {
        defaultIcon = Icon(Icons.bookmark_outlined);
      }
      defaultIcon = defaultIcon;
    } catch (e) {
      defaultIcon = defaultIcon;
    }

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const AppBarTitle(
            title: "Kelime",
            subtitle: "Sayfası",
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                ),
                CustomStar(
                    responsive: responsive, viewModel: viewModel, model: word),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  getText("", word.kelime.toUpperCase(), true),
                  getText("Ek:", word.ek, false),
                  getText("Kok:", word.kok, false),
                  getText("Tur:", word.tur, false),
                ],
              )),
            ),
          ],
        ));
  }

  Text getText(String type, String word, bool title) {
    return Text(
      "$type  $word",
      style: title == true
          ? GoogleFonts.itim(fontSize: 48, color: Colors.black87)
          : GoogleFonts.itim(fontSize: 40, color: Colors.black87),
    );
  }
}
