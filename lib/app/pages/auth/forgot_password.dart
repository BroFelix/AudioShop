import 'package:audioshop/app/widgets/green_button.dart';
import 'package:audioshop/data/service/auth_service.dart';
import 'package:audioshop/app/res/colors.dart';
import 'package:audioshop/app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  String email = '';

  @override
  Widget build(BuildContext context) {
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
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
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
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GreenButton(
                    height: constraints.maxHeight < 700 ? 120.h : 100.h,
                    width: double.infinity,
                    text: 'Reset Password',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        AuthService.instance.resetPassword(email);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                )
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
    if (value.contains(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'))) {
      return null;
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 500),
      content: Text(
        'Plese enter valid email address!',
      ),
    ));
    return '';
  }
}
