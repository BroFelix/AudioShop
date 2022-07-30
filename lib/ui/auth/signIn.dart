import 'package:ecommerce/res/colors.dart';
import 'package:ecommerce/res/styles.dart';
import 'package:ecommerce/router/app_state.dart';
import 'package:ecommerce/router/pages.dart';
import 'package:ecommerce/ui/auth/signUp.dart';
import 'package:ecommerce/ui/components/green_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  static const route = '/signIn';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var _formKey = GlobalKey<FormState>();
  late AppState appState;

  @override
  Widget build(BuildContext context) {
    appState = context.read<AppState>();
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
                    padding: EdgeInsets.only(top: 120.h, bottom: 4.h),
                    child: Text(
                      'Audio',
                      style: AppTextStyle.header.copyWith(color: AppColors.white),
                    ),
                  ),
                  Text(
                    'It\'s modular and designed to last',
                    style: AppTextStyle.title0.copyWith(color: AppColors.white),
                  ),
                  Expanded(child: Container()),
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
                          SizedBox(height: 12.h),
                          TextFormField(
                            obscureText: true,
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
                  Text(
                    "Forgot Password",
                    style: AppTextStyle.title.copyWith(color: AppColors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: GreenButton(
                      height: constraints.maxHeight < 700 ? 120.h : 100.h,
                      width: double.infinity,
                      text: 'Sign In',
                      onPressed: () {
                        appState.currentAction = PageAction(
                          state: PageState.replace,
                          page: homeConfig,
                        );
                      },
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: AppTextStyle.title0.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                      text: "Don\'t have any account? ",
                      children: [
                        TextSpan(
                          text: "Sign Up here",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              appState.currentAction = PageAction(
                                state: PageState.replace,
                                page: signUpConfig,
                                child: SignUpPage(),
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
                    height: 18.0,
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
