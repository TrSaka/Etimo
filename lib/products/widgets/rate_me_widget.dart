// ignore_for_file: unused_element

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/size.dart';
import '../view_model/about/about_view_model.dart';

class CustomRate extends StatefulWidget {
  const CustomRate(
      {super.key, required this.responsive, required this.viewModel});

  @override
  State<CustomRate> createState() => _CustomRateState();
  final DefaultResponsiveSizes responsive;
  final AboutViewModel viewModel;
}

class _CustomRateState extends State<CustomRate> {
  int startIndex = 1;

  @override
  Widget build(BuildContext context) {
    Stream starCountStream =
        widget.viewModel.controller1.stream.asBroadcastStream();

    starCountStream.listen(
      (event) {
        event = startIndex;
      },
    );

    StreamSubscription streamSubscription = starCountStream.listen((value) {
      startIndex = value;
    });

    @override
    void dispose() {
      streamSubscription.cancel();
      super.dispose();
    }

    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: ((context) {
              return StreamBuilder(
                  stream: starCountStream,
                  builder: ((context, snapshot) {
                    return AlertDialog(
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.send),
                        ),
                      ],
                      title: Text(
                        widget.viewModel.rateUsText,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      content: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              starIcon(1),
                              starIcon(2),
                              starIcon(3),
                              starIcon(4),
                              starIcon(5),
                            ],
                          ),
                        ),
                      ),
                    );
                  }));
            }));
      },
      child: Container(
        decoration: BoxDecoration(
          color: UIColor.mainTheme,
          borderRadius: BorderRadius.circular(10),
        ),
        height: widget.responsive.kDefaultSmallHeight / 2,
        width: widget.responsive.kDefaultSmallWidth * 5,
        child: Center(
          child: Text(
            widget.viewModel.rateUsText,
            style: GoogleFonts.akshar(
                textStyle: const TextStyle(color: UIColor.white, fontSize: 16)),
          ),
        ),
      ),
    );
  }

  SizedBox starIcon(int number) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              widget.viewModel.controller1.sink.add(number);
            },
            icon: startIndex >= number
                ? const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                : const Icon(Icons.star_border),
          ),
          Text(number.toString()),
        ],
      ),
    );
  }
}
