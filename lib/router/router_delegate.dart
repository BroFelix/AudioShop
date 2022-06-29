import 'package:ecommerce/router/app_state.dart';
import 'package:ecommerce/router/pages.dart';
import 'package:ecommerce/router/transition_delegate.dart';
import 'package:ecommerce/ui/auth/signIn.dart';
import 'package:ecommerce/ui/auth/signUp.dart';
import 'package:ecommerce/ui/home/home.dart';
import 'package:ecommerce/ui/search/search.dart';
import 'package:ecommerce/ui/splash/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  List<Page> _pages = [];

  final GlobalKey<NavigatorState>? _navigatorKey;
  final AppState appState;

  final TransitionDelegate<void> _transitionDelegate;

  AppRouterDelegate(this.appState)
      : _transitionDelegate = TransitionAnimationDelegate(),
        _navigatorKey = GlobalKey() {
    appState.addListener(() => notifyListeners());
  }

  List<MaterialPage> get pages => List.unmodifiable(_pages);

  int numPages() => pages.length;

  PageConfiguration get currentConfiguration => _pages.last.arguments as PageConfiguration;

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

  bool canPop() {
    return _pages.length > 1;
  }

  MaterialPage _createPage(Widget child, PageConfiguration configuration) {
    return MaterialPage(
      key: ValueKey(configuration.key),
      name: configuration.path,
      arguments: configuration,
      child: child,
    );
  }

  void _addPageData(Widget child, PageConfiguration configuration) =>
      _pages.add(_createPage(child, configuration));

  void addPage(PageConfiguration? configuration) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage != configuration?.uiPage;
    if (shouldAddPage)
      switch (configuration?.uiPage) {
        case Pages.splash:
          // TODO: Handle this case.
          _addPageData(SplashPage(), splashConfig);
          break;
        case Pages.signIn:
          _addPageData(SignInPage(), signInConfig);
          break;
        case Pages.signUp:
          _addPageData(SignUpPage(), signUpConfig);
          break;
        case Pages.home:
          _addPageData(HomePage(), homeConfig);
          break;
        case Pages.search:
          _addPageData(SearchPage(), searchConfig);
          break;
        default:
          break;
      }
  }

  void replace(PageConfiguration? newRoute) {
    if (newRoute == null) return;
    if (_pages.isNotEmpty) _removePage(_pages.last);
    addPage(newRoute);
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
  }

  void replaceAll(PageConfiguration? newRoute) {
    if (newRoute != null) setNewRoutePath(newRoute);
  }

  void push(PageConfiguration newRoute) {
    addPage(newRoute);
  }

  void pushWidget(Widget? child, PageConfiguration? newRoute) {
    if (child != null && newRoute != null) _addPageData(child, newRoute);
  }

  void addAll(List<PageConfiguration>? routes) {
    _pages.clear();
    for (var route in routes ?? []) {
      addPage(route);
    }
  }

  void _setPageAction(PageAction action) {
    switch (action.page?.uiPage) {
      case Pages.splash:
        splashConfig.currentPageAction = action;
        break;
      case Pages.signIn:
        signInConfig.currentPageAction = action;
        break;
      case Pages.signUp:
        signUpConfig.currentPageAction = action;
        break;
      case Pages.home:
        homeConfig.currentPageAction = action;
        break;
      case Pages.search:
        searchConfig.currentPageAction = action;
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
        case PageState.addPage:
          _setPageAction(appState.currentAction);
          addPage(appState.currentAction.page);
          break;
        case PageState.addAll:
          addAll(appState.currentAction.pages);
          break;
        case PageState.addWidget:
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

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      transitionDelegate: _transitionDelegate,
      onPopPage: _onPopPage,
      pages: buildPages(),
    );
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage != configuration.uiPage;
    if (shouldAddPage) {
      _pages.clear();
      addPage(configuration);
    }
    return SynchronousFuture(null);
  }
}
