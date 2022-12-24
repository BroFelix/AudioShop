import 'package:audioshop/app/router/router_delegate.dart';
import 'package:flutter/material.dart';

class AppBackButtonDispatcher extends RootBackButtonDispatcher {
  final AppRouterDelegate _routerDelegate;

  AppBackButtonDispatcher(this._routerDelegate) : super();

  Future<bool> didPopRoute() {
    return _routerDelegate.popRoute();
  }
}
