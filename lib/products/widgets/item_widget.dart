import 'package:etimology/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration:const  BoxDecoration(
                color: UIColor.favColor,
                shape: BoxShape.circle,
              ),
            ),
            Text("\t$text"),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
