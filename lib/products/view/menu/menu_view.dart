// ignore_for_file: unused_element
import 'dart:async';
import 'package:etimology/products/view_model/menu/menu_view_model.dart';
import 'package:flutter/material.dart';
import '../../widgets/app_bar_title_widget.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final viewModel = MenuViewModel();

  @override
  Widget build(BuildContext context) {
    int indexPage = 2;
    Stream stream = viewModel.controller.stream.asBroadcastStream();

    StreamSubscription streamSubscription = stream.listen((value) {
      debugPrint("Page Index => $value");
      indexPage = value;
    });

    @override
    void dispose() {
      streamSubscription.cancel();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          title: viewModel.appBarText,
          subtitle: viewModel.appBarSubtext,
        ),
      ),
      body: StreamBuilder(
          stream: stream,
          builder: ((context, AsyncSnapshot snapshot) {
            return viewModel.screensOfApplication[indexPage];
          })),
      bottomNavigationBar: viewModel.customNavigationBar(),
    );
  }
}
