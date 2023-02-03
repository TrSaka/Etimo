import 'package:etimology/core/services/sql_service.dart';
import 'package:etimology/core/utils/colors.dart';
import 'package:etimology/models/dictionary_word_model.dart';
import 'package:etimology/products/routes/app_route.gr.dart';
import 'package:etimology/products/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../core/utils/size.dart';

var change = Colors.grey[350];

class KeyItem extends StatelessWidget {
  const KeyItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DictionaryModel data;
//add view model and also you must add admin dashboard also you must add keyword page and question true or false
  @override
  Widget build(BuildContext context) {
    SQLSerivce.getByName(data);

    return FutureBuilder(
      future: SQLSerivce.getByName(data),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return widget(context, true);
        } else {
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
                      await SQLSerivce.deleteNote(data);
                    } else {
                      await SQLSerivce.saveWord(DictionaryModel(
                        kelime: data.kelime,
                        ek: data.ek,
                        kok: data.kok,
                        tur: data.tur,
                        fav: 1,
                      ));
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
                    color: favorite == true
                        ? UIColor.favColor
                        : UIColor.greyColor,
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
