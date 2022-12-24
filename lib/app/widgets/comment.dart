import 'package:audioshop/app/res/colors.dart';
import 'package:audioshop/app/res/styles.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class Commentapp extends StatelessWidget {
  const Commentapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/300',
                ),
              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Madelina',
                    style: AppTextStyle.title1.copyWith(fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Icon(
                          FeatherIcons.star,
                          color: AppColors.yellow,
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: AppTextStyle.title,
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.all(4.0),
                  child: Image.asset(
                    'assets/images/headphone.png',
                    height: 72.0,
                    width: 72.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Image.asset(
                    'assets/images/headphone.png',
                    height: 72.0,
                    width: 72.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Image.asset(
                    'assets/images/headphone.png',
                    height: 72.0,
                    width: 72.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
