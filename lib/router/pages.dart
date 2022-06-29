import 'package:ecommerce/router/app_state.dart';

const String splashPath = '/splash';
const String signInPath = '/signIn';
const String signUpPath = '/signUp';
const String homePath = '/home';
const String searchPath = '/search';

enum Pages {
  splash,
  signIn,
  signUp,
  home,
  search,
}

class PageConfiguration {
  final String key;
  final String path;
  final Pages uiPage;
  PageAction? currentPageAction;

  PageConfiguration({
    required this.key,
    required this.path,
    required this.uiPage,
    this.currentPageAction,
  });
}

PageConfiguration splashConfig =
    PageConfiguration(key: 'Splash', path: splashPath, uiPage: Pages.splash);
PageConfiguration signInConfig =
    PageConfiguration(key: 'SignIn', path: signInPath, uiPage: Pages.signIn);
PageConfiguration signUpConfig =
    PageConfiguration(key: 'SignUp', path: signUpPath, uiPage: Pages.signUp);
PageConfiguration homeConfig = PageConfiguration(key: 'Home', path: homePath, uiPage: Pages.home);
PageConfiguration searchConfig =
    PageConfiguration(key: 'Search', path: searchPath, uiPage: Pages.search);
