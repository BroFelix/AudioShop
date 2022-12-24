import 'dart:async';

import 'package:audioshop/app/res/colors.dart';
import 'package:audioshop/app/res/styles.dart';
import 'package:audioshop/firebase_options.dart';
import 'package:audioshop/app/router/app_state.dart';
import 'package:audioshop/app/router/back_button_dispatcher.dart';
import 'package:audioshop/app/router/pages.dart';
import 'package:audioshop/app/router/router_delegate.dart';
import 'package:audioshop/app/router/route_parser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // FlutterError.onError = (FlutterErrorDetails errorDetails) {
  // print('onError Exception: $errorDetails was caught by Flutter framework - redirect to Sentry or Firebase.');
  // };

  // await myErrorsHandler.initialize();
  // FlutterError.onError = (details) {
  // FlutterError.presentError(details);
  // myErrorsHandler.onErrorDetails(details);
  // };
  // PlatformDispatcher.instance.onError = (error, stack) {
  // myErrorsHandler.onError(error, stack);
  // return true;
  // };
  // CatcherOptions degubOptions = CatcherOptions(SilentReportMode(), [ConsoleHandler()]);
  // CatcherOptions releaseOptions = CatcherOptions(SilentReportMode(), [
  // EmailManualHandler(['farrukh.muhamedov@gmail.com'])
  // ]);
  // Catcher(
  // rootWidget: MyApp(),
  // debugConfig: degubOptions,
  // releaseConfig: releaseOptions,
  // navigatorKey: Catcher.navigatorKey,
  // );
  runZonedGuarded(() {
    runApp(MyApp());
  }, (error, stack) {
    print('Synchronous or Asynchronous Exception: $error (stack $stack) was caught in our custom zone - redirect to Sentry or Firebase.');
  });
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppState appState = AppState();
  final parser = RouteParser();
  late final AppRouterDelegate delegate;
  late final AppBackButtonDispatcher backButtonDispatcher;

  @override
  void initState() {
    delegate = AppRouterDelegate(appState);
    delegate.setNewRoutePath(splashConfig);
    backButtonDispatcher = AppBackButtonDispatcher(delegate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => appState,
      child: ScreenUtilInit(
        designSize: Size(750, 1334),
        builder: (context, child) => MaterialApp.router(
          builder: (context, widget) {
            Widget error = const Text('...rendering error...');
            if (widget is Scaffold || widget is Navigator) {
              error = Scaffold(body: Center(child: error));
            }
            ErrorWidget.builder = (errorDetails) => error;
            if (widget != null) return widget;
            throw ('widget is null');
          },
          debugShowCheckedModeBanner: false,
          title: 'Audio Commerce',
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
          backButtonDispatcher: backButtonDispatcher,
          routerDelegate: delegate,
          routeInformationParser: parser,
        ),
      ),
    );
  }
}
