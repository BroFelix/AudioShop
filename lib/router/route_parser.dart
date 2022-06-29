import 'package:ecommerce/router/pages.dart';
import 'package:flutter/material.dart';

class RouteParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
    // TODO: implement parseRouteInformation
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
      default:
        return splashConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.splash:
        return const RouteInformation(location: splashPath);
      case Pages.signIn:
        return const RouteInformation(location: signInPath);
      case Pages.signUp:
        return const RouteInformation(location: signUpPath);
      case Pages.home:
        return const RouteInformation(location: homePath);
      case Pages.search:
        return const RouteInformation(location: searchPath);
      default:
        return const RouteInformation(location: splashPath);
    }
  }
}
