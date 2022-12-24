import 'package:audioshop/app/pages/auth/signIn.dart';
import 'package:audioshop/app/res/colors.dart';
import 'package:audioshop/app/router/app_state.dart';
import 'package:audioshop/app/router/pages.dart';
import 'package:audioshop/data/service/auth_service.dart';
import 'package:audioshop/app/res/styles.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context);

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(FeatherIcons.chevronLeft),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Profile',
            style: AppTextStyle.appBarTextStyle,
          ),
        ),
        body: ListView(children: [
          Container(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 16.0,
              bottom: 16.0,
            ),
            child: Row(children: [
              Image.asset(
                'assets/images/avatar.png',
                height: 72.0,
                width: 72.0,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 24),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Andrea Hirata',
                  style: AppTextStyle.appBarTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'hirata@gmail.com',
                  style: AppTextStyle.title.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
              ]),
            ]),
          ),
          Divider(
            color: AppColors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'General',
              style: AppTextStyle.title,
            ),
          ),
          Column(children: [
            ListTile(
              title: Text('Edit Profile'),
              onTap: () {},
            ),
            Divider(
              height: 0,
              color: AppColors.grey,
            ),
            ListTile(
              title: Text('Notifications'),
              onTap: () {},
            ),
            Divider(
              height: 0,
              color: AppColors.grey,
            ),
            ListTile(
              title: Text('Whishlist'),
              onTap: () {},
            ),
            Divider(
              height: 0,
              color: AppColors.grey,
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 24.0,
              bottom: 24.0,
            ),
            child: Text(
              'Legal',
              style: AppTextStyle.title,
            ),
          ),
          Column(children: [
            ListTile(
              title: Text('Terms of Use'),
              onTap: () {},
            ),
            Divider(
              height: 0,
              color: AppColors.grey,
            ),
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {},
            ),
            Divider(
              height: 0,
              color: AppColors.grey,
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 24.0,
              bottom: 24.0,
            ),
            child: Text(
              'Personal',
              style: AppTextStyle.title,
            ),
          ),
          Column(children: [
            ListTile(
              title: Text('Report a Bug'),
              onTap: () {},
            ),
            Divider(
              height: 0,
              color: AppColors.grey,
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                AuthService.instance.signOut();
                appState.push(PageAction(
                  state: PageState.replaceAll,
                  page: signInConfig,
                ));
              },
            ),
            Divider(
              height: 0,
              color: AppColors.grey,
            ),
          ]),
        ]),
      );
    });
  }
}
