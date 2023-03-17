
import 'package:etimology/core/utils/colors.dart';
import 'package:etimology/models/dictionary_word_model.dart';
import 'package:etimology/products/routes/app_route.gr.dart';
import 'package:etimology/products/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import '../../core/utils/size.dart';

var change = Colors.grey[350];

class KeyItem extends StatelessWidget {
  const KeyItem({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final DictionaryModel data;
  final int index;
//add view model and also you must add admin dashboard also you must add keyword page and question true or false
  @override
  Widget build(BuildContext context) {
    List keys = [];
    return FutureBuilder(
      builder: (context, snapshot) {
        try {
          for (int i = 0; i < Hive.box("SavedBox").length; i++) {
            DictionaryModel data = Hive.box("SavedBox").getAt(i);
            keys.add(data.kelime);
          }
          if (keys.isEmpty) {
            return widget(context, false);
          }
          if (keys.contains(data.kelime)) {
            return widget(context, true);
          }
          return widget(context, false);
        } catch (e) {
          return widget(context, false);
        }
      },
    );
  }

  Padding widget(BuildContext context, bool favorite) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Slidable(
            startActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: ((context) async {
                    if (favorite == true) {
                      Hive.box("SavedBox").deleteAt(index);
                      // await SQLSerivce.deleteNote(data);
                    } else {
                      final model = DictionaryModel(
                        kelime: data.kelime,
                        ek: data.ek,
                        kok: data.kok,
                        tur: data.tur,
                        fav: 1,
                      );

                      if (Hive.isBoxOpen("SavedBox") == true) {
                        Hive.box("SavedBox").add(model);
                        debugPrint("created Data");
                      } else {
                        await Hive.openBox("SavedBox")
                            .then((value) => Hive.box("SavedBox").add(model));
                      }
                    }
                  }),
                  backgroundColor: favorite == true
                      ? UIColor.deleteFromFavColor
                      : UIColor.favColor,
                  icon: favorite == true
                      ? Icons.delete_outline_rounded
                      : Icons.bookmark_border_rounded,
                )
              ],
            ),
            child: Center(
              child: InkWell(
                onTap: () {
                  NavRoute(WordInfoRoute(data: data)).toPush(context);
                },
                child: Container(
                  width: DefaultResponsiveSizes(context).kDefaultWidth - 20,
                  height: 60,
                  decoration: BoxDecoration(
                    color:
                        favorite == true ? UIColor.favColor : UIColor.greyColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                    data.kelime,
                    style: TextStyle(
                      fontSize: 22,
                      color: favorite == true ? Colors.white : Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
