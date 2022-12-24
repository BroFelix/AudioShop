import 'package:audioshop/app/pages/profile/profile.dart';
import 'package:audioshop/app/pages/splash/splash.dart';
import 'package:audioshop/app/router/app_state.dart';
import 'package:audioshop/app/router/pages.dart';
import 'package:audioshop/app/router/transition_delegate.dart';
import 'package:audioshop/app/pages/auth/signIn.dart';
import 'package:audioshop/app/pages/auth/signUp.dart';
import 'package:audioshop/app/pages/home/home.dart';

import 'package:audioshop/app/pages/search/search.dart';
import 'package:audioshop/app/pages/shop/cart.dart';
import 'package:audioshop/app/pages/product/product.dart';
import 'package:audioshop/app/pages/shop/explore.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouterDelegate extends RouterDelegate<PageConfig> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState>? _navigatorKey;

  final List<Page> _pages = [];

  final AppState appState;

  final TransitionDelegate<void> _transitionDelegate;

  List<MaterialPage> get pages => List.unmodifiable(_pages);

  int numPages() => pages.length;

  PageConfig get currentConfiguration => _pages.last.arguments as PageConfig;

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  AppRouterDelegate(this.appState)
      : _transitionDelegate = TransitionAnimationDelegate(),
        _navigatorKey = GlobalKey() {
    appState.addListener(() => notifyListeners());
  }

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        transitionDelegate: _transitionDelegate,
        onPopPage: _onPopPage,
        pages: buildPages(),
      );

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) return false;
    if (canPop()) {
      pop();
      return true;
    } else
      return false;
  }

  void _removePage(Page? page) {
    if (page != null) _pages.remove(page);
  }

  void pop() {
    if (canPop()) _removePage(_pages.last);
  }

  bool canPop() => _pages.length > 1;

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  MaterialPage _createPage(Widget child, PageConfig configuration) => MaterialPage(
        key: ValueKey(configuration.key),
        name: configuration.path,
        arguments: configuration,
        child: child,
      );

  void _addPageData(Widget child, PageConfig configuration) => _pages.add(_createPage(child, configuration));

  void pushPage(PageConfig? configuration) {
    final shouldAddPage = _pages.isEmpty || (_pages.last.arguments as PageConfig).page != configuration?.page;
    if (!shouldAddPage) return;
    switch (configuration?.page) {
      case PagesEnum.splash:
        _addPageData(SplashPage(), splashConfig);
        break;
      case PagesEnum.signIn:
        _addPageData(SignInPage(), signInConfig);
        break;
      case PagesEnum.signUp:
        _addPageData(SignUpPage(), signUpConfig);
        break;
      case PagesEnum.home:
        _addPageData(HomePage(), homeConfig);
        break;
      case PagesEnum.search:
        _addPageData(SearchPage(), searchConfig);
        break;
      case PagesEnum.explore:
        _addPageData(ExplorePage(), exploreConfig);
        break;
      case PagesEnum.detail:
        _addPageData(ProductDetailPage(), detailConfig);
        break;
      case PagesEnum.cart:
        _addPageData(CartPage(), cartConfig);
        break;
      case PagesEnum.profile:
        _addPageData(ProfilePage(), profileConfig);
        break;
      default:
        break;
    }
  }

  void replace(PageConfig? newRoute) {
    if (newRoute == null) return;
    if (_pages.isNotEmpty) _removePage(_pages.last);
    pushPage(newRoute);
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
  }

  void replaceAll(PageConfig? newRoute) {
    if (newRoute != null) setNewRoutePath(newRoute);
  }

  void push(PageConfig? newRoute) {
    if (newRoute != null) pushPage(newRoute);
  }

  void pushWidget(Widget? child, PageConfig? newRoute) {
    if (child == null || newRoute == null) return;
    _addPageData(child, newRoute);
  }

  void pushAll(List<PageConfig>? routes) {
    if (routes == null) return;
    _pages.clear();
    for (var route in routes) {
      pushPage(route);
    }
  }

  @override
  Future<void> setNewRoutePath(PageConfig? configuration) {
    final shouldAddPage = _pages.isEmpty || (_pages.last.arguments as PageConfig).page != configuration?.page;
    if (shouldAddPage) {
      _pages.clear();
      pushPage(configuration);
    }
    return SynchronousFuture(null);
  }

  void _setPageAction(PageAction action) {
    switch (action.page?.page) {
      case PagesEnum.splash:
        splashConfig.currentPageAction = action;
        break;
      case PagesEnum.signIn:
        signInConfig.currentPageAction = action;
        break;
      case PagesEnum.signUp:
        signUpConfig.currentPageAction = action;
        break;
      case PagesEnum.home:
        homeConfig.currentPageAction = action;
        break;
      case PagesEnum.search:
        searchConfig.currentPageAction = action;
        break;
      case PagesEnum.explore:
        exploreConfig.currentPageAction = action;
        break;
      case PagesEnum.detail:
        detailConfig.currentPageAction = action;
        break;
      case PagesEnum.cart:
        detailConfig.currentPageAction = action;
        break;
      case PagesEnum.profile:
        detailConfig.currentPageAction = action;
        break;
      default:
        break;
    }
  }

  List<Page> buildPages() {
    if (!appState.splashFinished)
      replaceAll(splashConfig);
    else
      switch (appState.currentAction.state) {
        case PageState.none:
          break;
        case PageState.push:
          _setPageAction(appState.currentAction);
          pushPage(appState.currentAction.page);
          break;
        case PageState.pushAll:
          pushAll(appState.currentAction.pages);
          break;
        case PageState.pushWidget:
          _setPageAction(appState.currentAction);
          pushWidget(appState.currentAction.child, appState.currentAction.page);
          break;
        case PageState.pop:
          pop();
          break;
        case PageState.replace:
          _setPageAction(appState.currentAction);
          replace(appState.currentAction.page);
          break;
        case PageState.replaceAll:
          _setPageAction(appState.currentAction);
          replaceAll(appState.currentAction.page);
          break;
      }
    appState.resetCurrentAction();
    return List.of(_pages);
  }
}
