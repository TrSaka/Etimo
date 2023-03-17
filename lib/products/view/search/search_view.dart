// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:etimology/core/utils/colors.dart';
import 'package:etimology/models/dictionary_word_model.dart';
import 'package:etimology/products/routes/app_route.gr.dart';
import 'package:etimology/products/routes/route.dart';
import 'package:etimology/products/view_model/search/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import '../../widgets/search_bar_widget.dart';
import '../../widgets/search_key_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var viewModel = SearchViewModel();

  @override
  void initState() {
    Hive.openBox("SavedBox");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.controller.close();

  }

  @override
  Widget build(BuildContext context) {
    Stream searchBarStream = viewModel.controller.stream.asBroadcastStream();
    //initalized stream in build !

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title:
            SearchBar(viewModel: viewModel, searchBarStream: searchBarStream),
      ),
      body: StreamBuilder2(
          //listen 2 stream without use in in :=) avoid use complex streams
          streams: StreamTuple2(
            viewModel.firebaseStream,
            searchBarStream,
          ),
          builder: ((context, snapshots) {
            if (snapshots.snapshot2.hasData == true) {}

            return (snapshots.snapshot1.connectionState ==
                    ConnectionState.waiting)
                ? const Center(
                    //Connection Error : Takes Forever ! maybe I can add popup
                    child: loading(),
                  ) //while loading send us a animation but generally it is not shows.
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshots.snapshot1.data!.docs.length,
                    itemBuilder: (context, index) {
                      //the data which came from listviewbuilder
                      Map<String, dynamic> value =
                          snapshots.snapshot1.data!.docs[index].data();

                      //lets change our value to our Model !
                      DictionaryModel data = viewModel.convertData(value);

                      //if our textformfield is empty
                      if (viewModel.name.isEmpty) {
                        return word(
                          data: data,
                          index: index,
                        );
                      }

                      if (value['kelime'] //try to find word which typed
                          .toString()
                          .toLowerCase()
                          .startsWith(viewModel.name.toLowerCase())) {
                        return word(data: data, index: index);
                      }

                      return const SizedBox(); //just for null safety :)
                    },
                  );
          })),
    );
  }
}

class loading extends StatelessWidget {
  const loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        CircularProgressIndicator(color: UIColor.mainTheme),
        SizedBox(height: 25),
        Center(
          child: Text(
            "Yükleniyor...\n Eğer bu işlem uzun sürerse lütfen internetinizi kontrol ediniz :)",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class word extends StatelessWidget {
  const word({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final DictionaryModel data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavRoute(WordInfoRoute(data: data));
      },
      child: KeyItem(data: data, index: index),
    );
  }
}
