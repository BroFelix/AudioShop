import 'package:audioshop/app/res/colors.dart';
import 'package:audioshop/app/res/styles.dart';
import 'package:audioshop/app/widgets/green_button.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(FeatherIcons.chevronLeft),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Shopping Cart',
            style: AppTextStyle.appBarTextStyle,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(FeatherIcons.trash2),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * .7,
              width: constraints.maxWidth,
              child: ListView(
                padding: EdgeInsets.only(top: 16.0),
                children: [
                  Container(
                    height: 100.0,
                    width: constraints.maxWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Image.asset(
                            'assets/images/headphone.png',
                            height: 84.0,
                            width: 84.0,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(
                                'TMA-2 Comfort Wireless',
                                style: AppTextStyle.title1.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'USD 270',
                                style: AppTextStyle.title.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(12.0),
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(color: AppColors.grey),
                                    ),
                                    child: Icon(FeatherIcons.minus),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Text(
                                  '1',
                                  style: AppTextStyle.title1.copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(12.0),
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(color: AppColors.grey),
                                    ),
                                    child: Icon(FeatherIcons.plus),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FeatherIcons.trash2,
                              color: AppColors.darkGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total 2 Items',
                    style: AppTextStyle.title,
                  ),
                  Text(
                    'USD 295',
                    style: AppTextStyle.title1.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GreenButton(
                padding: EdgeInsets.only(left: 24.0, right: 48.0),
                height: constraints.maxHeight < 700 ? 120.h : 100.h,
                width: 400.0,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Proceed to Checkout',
                      style: AppTextStyle.buttonText.copyWith(color: AppColors.cleanWhite),
                    ),
                    Icon(
                      FeatherIcons.chevronRight,
                      color: AppColors.cleanWhite,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
