import 'package:etimology/core/utils/size.dart';
import 'package:etimology/products/view_model/about/about_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/rate_me_widget.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  AboutViewModel viewModel = AboutViewModel();
  @override
  void dispose() {
    viewModel.controller1.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DefaultResponsiveSizes responsive = DefaultResponsiveSizes(context);
    ThemeData currentTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsive.kSpacesize * 2),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: responsive.kDefaultNormalHeight / 8),
                Text(
                  viewModel.titleText,
                  style: currentTheme.textTheme.titleLarge,
                ),
                const Divider(color: Colors.grey, thickness: 2),
                SizedBox(height: responsive.kSpacesize),
                CustomRate(responsive: responsive, viewModel: viewModel),
                SizedBox(height: responsive.kSpacesize),
                Text(
                  viewModel.mainText,
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(fontSize: 24),
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: responsive.kSpacesize * 2),
                Text(
                  viewModel.creditText,
                  style: currentTheme.textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
