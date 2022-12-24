import 'package:audioshop/app/router/app_state.dart';

const String splashPath = '/splash';
const String signInPath = '/signIn';
const String signUpPath = '/signUp';
const String homePath = '/home';
const String searchPath = '/search';
const String explorePath = '/explore';
const String detailPath = '/detail';
const String cartPath = '/cart';
const String profilePath = '/profile';

enum PagesEnum {
  splash,
  signIn,
  signUp,
  home,
  search,
  explore,
  detail,
  cart,
  profile,
}

class PageConfig {
  final String key;
  final String path;
  final PagesEnum page;
  PageAction? currentPageAction;

  PageConfig({
    required this.key,
    required this.path,
    required this.page,
    this.currentPageAction,
  });
}

PageConfig splashConfig = PageConfig(
  key: 'Splash',
  path: splashPath,
  page: PagesEnum.splash,
);
PageConfig signInConfig = PageConfig(
  key: 'SignIn',
  path: signInPath,
  page: PagesEnum.signIn,
);
PageConfig signUpConfig = PageConfig(
  key: 'SignUp',
  path: signUpPath,
  page: PagesEnum.signUp,
);
PageConfig homeConfig = PageConfig(
  key: 'Home',
  path: homePath,
  page: PagesEnum.home,
);
PageConfig searchConfig = PageConfig(
  key: 'Search',
  path: searchPath,
  page: PagesEnum.search,
);
PageConfig exploreConfig = PageConfig(
  key: 'Explore',
  path: explorePath,
  page: PagesEnum.explore,
);
PageConfig detailConfig = PageConfig(
  key: 'Detail',
  path: detailPath,
  page: PagesEnum.detail,
);
PageConfig cartConfig = PageConfig(
  key: 'Cart',
  path: cartPath,
  page: PagesEnum.cart,
);
PageConfig profileConfig = PageConfig(
  key: 'Profile',
  path: profilePath,
  page: PagesEnum.profile,
);
