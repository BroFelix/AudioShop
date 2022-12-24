import 'package:audioshop/app/pages/auth/forgot_password.dart';
import 'package:audioshop/app/pages/auth/signUp.dart';
import 'package:audioshop/data/service/auth_service.dart';
import 'package:audioshop/app/res/colors.dart';
import 'package:audioshop/app/res/styles.dart';
import 'package:audioshop/app/router/app_state.dart';
import 'package:audioshop/app/router/pages.dart';
import 'package:audioshop/app/widgets/green_button.dart';
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
  String mail = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    appState = context.read<AppState>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
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
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: _emailValidation,
                          onSaved: (newValue) => mail = newValue!,
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
                            hintText: 'Email',
                            hintStyle: TextStyle(color: AppColors.lightGrey),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextFormField(
                          validator: _passwordValidation,
                          onSaved: (newValue) => password = newValue!,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
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
                            hintText: 'Password',
                            hintStyle: TextStyle(color: AppColors.lightGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Forgot Password',
                    style: AppTextStyle.title.copyWith(color: AppColors.white),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ),
                        );
                      },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GreenButton(
                    height: constraints.maxHeight < 700 ? 120.h : 100.h,
                    width: double.infinity,
                    text: 'Sign In',
                    onPressed: _onSignIn,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: AppTextStyle.title0.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                    text: "Don\'t have any account? ",
                    children: [
                      TextSpan(
                        text: 'Sign Up here',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            appState.push(PageAction(
                              state: PageState.replace,
                              page: signUpConfig,
                              child: SignUpPage(),
                            ));
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
                  height: 48.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String? _emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Field required to be filled')));
      return '';
    }
    if (value.contains(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'))) return null;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 500),
      content: Text(
        'Plese enter valid email address!',
      ),
    ));
    return '';
  }

  String? _passwordValidation(String? value) {
    if (value!.isEmpty || value.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 1500),
        content: Text('Password should be at least length of 8'),
      ));
      return '';
    }
    if (!value.contains(RegExp(r'[A-Za-z0-9]'))) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        content: Text('PPassword should lower case, Upper case and number'),
      ));
      return '';
    }
    return null;
  }

  void _onSignIn() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      AuthService.instance.mailSignIn(mail, password).then((value) {
        print(value);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 1500),
          content: Text(value.name),
        ));
        appState.push(PageAction(
          state: PageState.replace,
          page: homeConfig,
        ));
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 1500),
          content: Text('Wrong email or password! Please check it and try again!'),
        ));
      });
    }
  }
}
