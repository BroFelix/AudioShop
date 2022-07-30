import 'package:ecommerce/res/colors.dart';
import 'package:ecommerce/res/styles.dart';
import 'package:ecommerce/router/app_state.dart';
import 'package:ecommerce/router/pages.dart';
import 'package:ecommerce/ui/components/green_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const route = '/signUp';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appState = context.read<AppState>();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset('assets/images/background.png').image,
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 90.0,
                      bottom: 16,
                    ),
                    child: Text(
                      'Audio',
                      style: AppTextStyle.header.copyWith(color: AppColors.white),
                    ),
                  ),
                  Text(
                    'It\'s modular and designed to last',
                    style: AppTextStyle.title0.copyWith(color: AppColors.white),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail_outline_rounded,
                                color: AppColors.lightGrey,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(color: AppColors.lightGrey),
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: AppColors.lightGrey,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: AppColors.lightGrey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 24.0,
                      bottom: 24.0,
                    ),
                    child: GreenButton(
                      height: constraints.maxHeight < 700 ? 120.h : 100.h,
                      width: 400,
                      text: 'Sign Up',
                      onPressed: () {
                        appState.currentAction = PageAction(
                          state: PageState.replace,
                          page: homeConfig,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        height: 65,
                        minWidth: 65,
                        color: AppColors.cleanWhite,
                        child: Image.asset("assets/icons/apple.png"),
                        onPressed: () {},
                      ),
                      SizedBox(width: 18.0),
                      MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        height: 65,
                        minWidth: 65,
                        color: AppColors.cleanWhite,
                        child: Image.asset("assets/icons/facebook.png"),
                        onPressed: () {},
                      ),
                      SizedBox(width: 18.0),
                      MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        height: 65,
                        minWidth: 65,
                        color: AppColors.cleanWhite,
                        child: Image.asset("assets/icons/google.png"),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  RichText(
                    text: TextSpan(
                      style: AppTextStyle.title0.copyWith(color: AppColors.white, fontWeight: FontWeight.w400),
                      text: "If you have an account? ",
                      children: [
                        TextSpan(
                          text: "Sign In here",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              appState.currentAction = PageAction(
                                state: PageState.replace,
                                page: signInConfig,
                              );
                            },
                          style: GoogleFonts.dmSans(
                            shadows: [
                              Shadow(
                                color: Colors.green[300]!,
                                offset: Offset(0, -1),
                              ),
                            ],
                            color: Colors.transparent,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.green[300],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
