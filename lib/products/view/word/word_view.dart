import 'package:etimology/core/utils/size.dart';
import 'package:etimology/models/dictionary_word_model.dart';
import 'package:etimology/products/widgets/app_bar_title_widget.dart';
import 'package:etimology/products/widgets/star_widget.dart';
import 'package:etimology/products/view_model/word/word_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    WordInfoViewModel viewModel = WordInfoViewModel();
    var responsive = DefaultResponsiveSizes(context);
    final word = widget.data;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const AppBarTitle(
            title: "Kelime",
            subtitle: "...",
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
                  responsive: responsive,
                  viewModel: viewModel,
                  model: word,
                ),
              ],
            ),
            Center(
                child: Column(
              children: [
                Text(
                  widget.data.kelime.toUpperCase(),
                  style: GoogleFonts.itim(fontSize: 48, color: Colors.black87),
                ),
                Text(
                  "Ek : ${word.ek}",
                  style: GoogleFonts.itim(fontSize: 40, color: Colors.black87),
                ),
                Text(
                  "Kök : ${word.kok}",
                  style: GoogleFonts.itim(fontSize: 40, color: Colors.black87),
                ),
                Text(
                  "Tür : ${word.tur}",
                  style: GoogleFonts.itim(fontSize: 40, color: Colors.black87),
                ),
              ],
            )),
          ],
        ));
  }
}
