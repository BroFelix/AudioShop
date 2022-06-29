import 'package:ecommerce/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static final TextStyle appBarTextStyle = GoogleFonts.dmSans(
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle buttonText = GoogleFonts.dmSans(
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle header = GoogleFonts.dmSans(
    fontSize: 64.sp,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle subHeader = GoogleFonts.dmSans(
    fontSize: 24.sp,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle title = GoogleFonts.dmSans(
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle link = GoogleFonts.dmSans(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.green,
  );

  static final TextStyle linkText = GoogleFonts.dmSans(
    fontSize: 32.sp,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle headText = GoogleFonts.montserrat(
    fontSize: 48.sp,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle searchField = GoogleFonts.dmSans(
    fontSize: 24.sp,
  );

  static final TextStyle tabTitle = GoogleFonts.dmSans(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
  );
}