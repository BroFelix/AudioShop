import 'package:ecommerce/res/colors.dart';
import 'package:ecommerce/res/styles.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const route = '/search';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _isThereHistory = false;
  bool _isFieldEmpty = true;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FeatherIcons.chevronLeft),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Search',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FeatherIcons.shoppingCart),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                if (value.isNotEmpty) setState(() => _isFieldEmpty = false);
              },
              cursorColor: AppColors.lightGrey,
              decoration: InputDecoration(
                prefixIcon: Icon(FeatherIcons.search),
                iconColor: AppColors.lightGrey,
                hintText: 'Search headphone',
                isDense: true,
                focusColor: AppColors.lightGrey,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: AppColors.lightGrey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: AppColors.lightGrey,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: !_isThereHistory,
            child: Container(
              padding: EdgeInsets.only(left: 18.0, top: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Latest search',
                style: AppTextStyle.title.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Visibility(
            visible: _isFieldEmpty,
            child: SizedBox(
              height: 400.0,
              width: mediaQuery.size.width,
              child: ListView.builder(
                itemCount: 0,
                itemBuilder: (context, index) => Container(),
              ),
            ),
          ),
          Visibility(
            visible: !_isFieldEmpty,
            child: SizedBox(
              height: 400.0,
              width: mediaQuery.size.width,
              child: ListView.builder(
                itemCount: 0,
                itemBuilder: (context, index) => Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
