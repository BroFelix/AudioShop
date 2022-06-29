import 'package:ecommerce/res/colors.dart';
import 'package:ecommerce/res/styles.dart';
import 'package:ecommerce/router/app_state.dart';
import 'package:ecommerce/router/back_button_dispatcher.dart';
import 'package:ecommerce/router/pages.dart';
import 'package:ecommerce/router/router_delegate.dart';
import 'package:ecommerce/router/route_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppState appState = AppState();
  AppRouterDelegate? delegate;
  final parser = RouteParser();
  BackButtonDispatcher? backButtonDispatcher;

  _MyAppState() {
    delegate = AppRouterDelegate(appState);
    delegate?.setNewRoutePath(splashConfig);
    backButtonDispatcher = AppBackButtonDispatcher(delegate!);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => appState,
      child: ScreenUtilInit(
        designSize: Size(750, 1334),
        builder: (context, child) => MaterialApp.router(
          // MaterialApp.router(
          title: 'Ecommerce',
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: AppColors.cleanWhite,
              elevation: 0,
              titleTextStyle: AppTextStyle.appBarTextStyle.copyWith(
                color: AppColors.black,
              ),
              iconTheme: IconThemeData(color: AppColors.black),
            ),
            scaffoldBackgroundColor: AppColors.cleanWhite,
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routerDelegate: delegate!,
          routeInformationParser: parser,
        ),
      ),
    );
  }
}
