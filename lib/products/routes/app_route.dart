import 'package:auto_route/auto_route.dart';
import 'package:etimology/products/view/info/info_view.dart';
import 'package:etimology/products/view/menu/menu_view.dart';
import 'package:etimology/products/view/word/word_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    CustomRoute(
        page: MenuView,
        initial: true,
        path: "/menu_view",
        transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute(
        page: InfoView,
        initial: false,
        path: "/info_view",
        transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute(
        page: WordInfoView,
        initial: false,
        path: "/word_info_biew",
        transitionsBuilder: TransitionsBuilders.slideLeft),
  ],
)
// extend the generated private router
class $AppRouter {}
