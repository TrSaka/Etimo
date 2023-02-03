// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../models/dictionary_word_model.dart' as _i6;
import '../view/info/info_view.dart' as _i2;
import '../view/menu/menu_view.dart' as _i1;
import '../view/word/word_view.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MenuRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MenuView(),
      );
    },
    InfoRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.InfoView(),
      );
    },
    WordInfoRoute.name: (routeData) {
      final args = routeData.argsAs<WordInfoRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.WordInfoView(
          key: args.key,
          data: args.data,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/menu_view',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          MenuRoute.name,
          path: '/menu_view',
        ),
        _i4.RouteConfig(
          InfoRoute.name,
          path: '/info_view',
        ),
        _i4.RouteConfig(
          WordInfoRoute.name,
          path: '/word_info_biew',
        ),
      ];
}

/// generated route for
/// [_i1.MenuView]
class MenuRoute extends _i4.PageRouteInfo<void> {
  const MenuRoute()
      : super(
          MenuRoute.name,
          path: '/menu_view',
        );

  static const String name = 'MenuRoute';
}

/// generated route for
/// [_i2.InfoView]
class InfoRoute extends _i4.PageRouteInfo<void> {
  const InfoRoute()
      : super(
          InfoRoute.name,
          path: '/info_view',
        );

  static const String name = 'InfoRoute';
}

/// generated route for
/// [_i3.WordInfoView]
class WordInfoRoute extends _i4.PageRouteInfo<WordInfoRouteArgs> {
  WordInfoRoute({
    _i5.Key? key,
    required _i6.DictionaryModel data,
  }) : super(
          WordInfoRoute.name,
          path: '/word_info_biew',
          args: WordInfoRouteArgs(
            key: key,
            data: data,
          ),
        );

  static const String name = 'WordInfoRoute';
}

class WordInfoRouteArgs {
  const WordInfoRouteArgs({
    this.key,
    required this.data,
  });

  final _i5.Key? key;

  final _i6.DictionaryModel data;

  @override
  String toString() {
    return 'WordInfoRouteArgs{key: $key, data: $data}';
  }
}
