// ignore_for_file: unused_element, prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:etimology/core/services/sql_service.dart';
import 'package:etimology/core/utils/colors.dart';
import 'package:flutter/material.dart';
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
  late int startIndex;

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
      future:
          SQLSerivce.getByName(widget.model), //request SQL for query by name
      builder: (context, AsyncSnapshot snapshot) {
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
              widget.viewModel.controller1.sink.add(startIndex == 0 ? 1 : 0);
              if (startIndex == 0) {
                SQLSerivce.saveWord(DictionaryModel(
                  kelime: widget.model.kelime,
                  ek: widget.model.ek,
                  kok: widget.model.kok,
                  tur: widget.model.tur,
                  fav: 1,
                ));
              } else if (startIndex == 1) {
                SQLSerivce.deleteNote(widget.model);
              }
            },
            icon: startIndex == 1
                ? const Icon(
                    Icons.favorite_rounded,
                    color: UIColor.redColor,
                    size: 36,
                  )
                : const Icon(
                    Icons.favorite_outline_rounded,
                    size: 36,
                  ),
          ),
        );
      },
    );
  }
}
