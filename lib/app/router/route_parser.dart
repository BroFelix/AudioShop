import 'package:audioshop/app/router/pages.dart';
import 'package:flutter/material.dart';

class RouteParser extends RouteInformationParser<PageConfig> {
  @override
  Future<PageConfig> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');
    if (uri.pathSegments.isEmpty) return splashConfig;
    final path = uri.pathSegments[0];
    switch (path) {
      case splashPath:
        return splashConfig;
      case signInPath:
        return signInConfig;
      case signUpPath:
        return signUpConfig;
      case homePath:
        return homeConfig;
      case searchPath:
        return searchConfig;
      case explorePath:
        return exploreConfig;
      case detailPath:
        return detailConfig;
      case cartPath:
        return cartConfig;
      case profilePath:
        return profileConfig;
      default:
        return splashConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfig configuration) {
    switch (configuration.page) {
      case PagesEnum.splash:
        return const RouteInformation(location: splashPath);
      case PagesEnum.signIn:
        return const RouteInformation(location: signInPath);
      case PagesEnum.signUp:
        return const RouteInformation(location: signUpPath);
      case PagesEnum.home:
        return const RouteInformation(location: homePath);
      case PagesEnum.search:
        return const RouteInformation(location: searchPath);
      case PagesEnum.explore:
        return const RouteInformation(location: explorePath);
      case PagesEnum.detail:
        return const RouteInformation(location: detailPath);
      case PagesEnum.cart:
        return const RouteInformation(location: cartPath);
      case PagesEnum.profile:
        return const RouteInformation(location: profilePath);
      default:
        return const RouteInformation(location: splashPath);
    }
  }
}
