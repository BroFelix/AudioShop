import 'dart:async';

import 'package:audioshop/app/router/app_state.dart';
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
  void didUpdateWidget(covariant SplashPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
  }

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
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/icons/app_icon.png',
        fit: BoxFit.contain,
        height: 64.0,
        width: 64.0,
      ),
    );
  }
}
