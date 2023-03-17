// ignore_for_file: unused_element, prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:etimology/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../core/utils/size.dart';
import '../../models/dictionary_word_model.dart';

class CustomStar extends StatefulWidget {
  const CustomStar({
    super.key,
    required this.responsive,
    required this.viewModel,
    required this.model,
  });

  @override
  State<CustomStar> createState() => _CustomStarState();
  final DefaultResponsiveSizes responsive;
  final viewModel;
  final DictionaryModel model;
}

class _CustomStarState extends State<CustomStar> {
  int startIndex = 0;

  @override
  Widget build(BuildContext context) {
    Stream starCountStream =
        widget.viewModel.controller1.stream.asBroadcastStream();

    StreamSubscription streamSubscription = starCountStream.listen((value) {
      startIndex = value;
    });

    @override
    void dispose() {
      streamSubscription.cancel();
      super.dispose();
    }

    return FutureBuilder(
      //request SQL for query by name
      builder: (context, AsyncSnapshot snapshot) {
        List keys = [];
        try {
          for (int i = 0; i < Hive.box("SavedBox").length; i++) {
            DictionaryModel data = Hive.box("SavedBox").getAt(i);
            keys.add(data.kelime);
          }
          if (keys.isEmpty) {
            startIndex = 0;
          }
          if (keys.contains(widget.model.kelime)) {
            startIndex = 1;
          }
          return data(starCountStream);
        } catch (e) {
          startIndex = 0;
        }
        if (snapshot.hasData) {
          //if we had minium 1 word in SQL
          var unFilteredFav = snapshot.data[0]['fav'];
          if (unFilteredFav == null) {
            //if word is unFavorited
            startIndex = 0;
          } else {
            //if word favorited
            startIndex = unFilteredFav;
          }
          return data(starCountStream);
        } else {
          startIndex = 0;
          return data(starCountStream);
        }
      },
    );
  }

  StreamBuilder<dynamic> data(Stream<dynamic> starCountStream) {
    return StreamBuilder(
      stream: starCountStream,
      builder: (context, snapshot) {
        return SizedBox(
          height: 100,
          child: IconButton(
            onPressed: () {
              int state = 0;
              widget.viewModel.controller1.sink.add(startIndex == 0 ? 1 : 0);
              if (startIndex == 0) {
                Hive.box("SavedBox").add(widget.model);
              } else if (startIndex == 1) {
                List data = [];
                for (int i = 0; i < Hive.box("SavedBox").length; i++) {
                  data.add(Hive.box("SavedBox").getAt(i).kelime);
                }

                for (int i = 0; i < Hive.box("SavedBox").length; i++) {
                  var data = Hive.box("SavedBox").getAt(i);
                  if (data.kelime == widget.model.kelime) {
                    Hive.box("SavedBox").deleteAt(i);
                  } else {
                    print("Nothing");
                  }
                }
              }
            },
            icon: startIndex == 1
                ? const Icon(
                    Icons.bookmark,
                    color: UIColor.mainTheme,
                    size: 36,
                  )
                : const Icon(
                    Icons.bookmark_border_rounded,
                    size: 36,
                  ),
          ),
        );
      },
    );
  }
}
