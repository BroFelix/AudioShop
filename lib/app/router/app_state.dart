import 'package:audioshop/app/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PageState {
  none,
  push,
  pushAll,
  pushWidget,
  pop,
  replace,
  replaceAll,
}

class PageAction {
  PageState state;
  PageConfig? page;
  List<PageConfig>? pages;
  Widget? child;

  PageAction({
    required this.state,
    required this.page,
    this.pages = null,
    this.child = null,
  });
}

class AppState extends ChangeNotifier {
  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;
  bool _splashFinished = false;

  bool get splashFinished => _splashFinished;
  final cartItems = [];
  String emailAddress = '';
  String password = '';
  PageAction _currentAction = PageAction(
    page: null,
    state: PageState.none,
  );

  PageAction get currentAction => _currentAction;

  void push(PageAction action) {
    _currentAction = action;
    notifyListeners();
  }

  AppState() {
    getLoggedInState();
  }

  void resetCurrentAction() {
    _currentAction = PageAction(
      page: null,
      state: PageState.none,
    );
  }

  void addToCart(String item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(String item) {
    cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  void setSplashFinished() {
    _splashFinished = true;
    if (_loggedIn)
      _currentAction = PageAction(
        state: PageState.replaceAll,
        page: homeConfig,
      );
    else
      _currentAction = PageAction(
        state: PageState.replaceAll,
        page: signInConfig,
      );
    notifyListeners();
  }

  void login() {
    _loggedIn = true;
    saveLoginState(loggedIn);
    _currentAction = PageAction(
      state: PageState.replaceAll,
      page: homeConfig,
    );
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    saveLoginState(loggedIn);
    _currentAction = PageAction(
      state: PageState.replaceAll,
      page: signInConfig,
    );
    notifyListeners();
  }

  void saveLoginState(bool loggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('LoggedInKey', loggedIn);
  }

  void getLoggedInState() async {
    final prefs = await SharedPreferences.getInstance();
    _loggedIn = prefs.getBool('LoggedInKey') ?? false;
  }
}
