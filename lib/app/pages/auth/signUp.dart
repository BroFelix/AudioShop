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

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const route = '/signUp';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _formKey = GlobalKey<FormState>();
  late AppState appState;
  String email = '';
  String password = '';

  String? _emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 1500),
        content: Text('Field required to be filled'),
      ));
      return '';
    }
    if (value.contains(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'))) {
      return null;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 1500),
      content: Text(
        'Plese enter valid email address!',
      ),
    ));
    return '';
  }

  String? _passwordValidation(String? value) {
    if (value!.isEmpty || value.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        content: Text('Password should be at least length of 8'),
      ));
      return '';
    }
    if (!value.contains(RegExp(r'[A-Za-z0-9]'))) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          'PPassword should lower case, Upper case and number',
        ),
      ));
      return '';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.read<AppState>();

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
                  padding: EdgeInsets.only(
                    top: 120.h,
                    bottom: 4.h,
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
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          validator: _emailValidation,
                          onSaved: (newValue) => email = newValue!,
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
                        const SizedBox(height: 8.0),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          validator: _passwordValidation,
                          onSaved: (newValue) => password = newValue!,
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
                    onPressed: _signUp,
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
                      child: Image.asset('assets/icons/apple.png'),
                      onPressed: () {},
                    ),
                    SizedBox(width: 18.0),
                    MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      height: 65,
                      minWidth: 65,
                      color: AppColors.cleanWhite,
                      child: Image.asset('assets/icons/facebook.png'),
                      onPressed: () {
                        // AuthService.instance.signUpFacebook();
                      },
                    ),
                    SizedBox(width: 18.0),
                    MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      height: 65,
                      minWidth: 65,
                      color: AppColors.cleanWhite,
                      child: Image.asset('assets/icons/google.png'),
                      onPressed: () {
                        AuthService.instance.signUpWithGoogle().then((value) {
                          appState.push(PageAction(
                            state: PageState.replace,
                            page: homeConfig,
                          ));
                        }).onError((error, stackTrace) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(milliseconds: 1500),
                            content: Text(error.toString()),
                          ));
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18.0,
                ),
                RichText(
                  text: TextSpan(
                    style: AppTextStyle.title0.copyWith(color: AppColors.white, fontWeight: FontWeight.w400),
                    text: 'If you have an account? ',
                    children: [
                      TextSpan(
                        text: 'Sign In here',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            appState.push(PageAction(
                              state: PageState.replace,
                              page: signInConfig,
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

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      AuthService.instance.mailSignUp(email, password).then((value) {
        appState.push(PageAction(
          state: PageState.replace,
          page: homeConfig,
        ));
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 1500),
          content: Text('SignUp failed! Please try again!'),
        ));
      });
    }
  }
}
