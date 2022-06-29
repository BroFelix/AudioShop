import 'dart:async';

import 'package:ecommerce/router/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AppState appState;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;
    Timer(const Duration(seconds: 2), () => appState.setSplashFinished());
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;

    return ColoredBox(
      color: Colors.red,
    );
  }
}
