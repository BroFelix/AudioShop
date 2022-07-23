import 'package:ecommerce/data/model/product.dart';
import 'package:ecommerce/res/colors.dart';
import 'package:ecommerce/res/styles.dart';
import 'package:ecommerce/ui/components/recent_search_item.dart';
import 'package:ecommerce/ui/components/search_list_item.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const route = '/search';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isFieldEmpty = true;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    FeatherIcons.chevronLeft,
                    size: 24.0,
                  ),
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
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          if (value.isNotEmpty) setState(() => _isFieldEmpty = false);
                          if (value.isEmpty) setState(() => _isFieldEmpty = true);
                        },
                        cursorColor: AppColors.lightGrey,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            FeatherIcons.search,
                            color: AppColors.lightGrey,
                          ),
                          iconColor: AppColors.lightGrey,
                          hintText: 'Search headphone',
                          isDense: true,
                          focusColor: AppColors.lightGrey,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: AppColors.lightGrey),
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
                      visible: _isFieldEmpty,
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
                      child: Container(
                        padding: EdgeInsets.only(top: 8.0),
                        height: constraints.maxHeight * .7,
                        width: constraints.maxWidth,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          itemCount: 3,
                          itemBuilder: (context, index) => RecentSearchItem(
                            title: 'Cable',
                            onTapped: () {},
                            onDelete: () {},
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !_isFieldEmpty,
                      child: Container(
                        padding: EdgeInsets.only(top: 8.0),
                        height: constraints.maxHeight * .75,
                        width: constraints.maxWidth,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          itemCount: 3,
                          itemBuilder: (context, index) => SearchListItem(
                            onTapped: () {},
                            product: ProductModel(
                              imageUrl: 'https://picsum.photos/200/200',
                              price: 270,
                              productName: 'TWS-200',
                              reviews: 86,
                              rate: 4.6,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
