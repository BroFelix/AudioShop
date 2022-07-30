import 'package:ecommerce/res/colors.dart';
import 'package:ecommerce/res/styles.dart';
import 'package:ecommerce/router/app_state.dart';
import 'package:ecommerce/router/pages.dart';
import 'package:ecommerce/ui/components/bottom_sheet.dart';
import 'package:ecommerce/ui/components/product_view.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<bool> _selectedCategories = List.generate(4, (index) => false);

  GlobalKey _gridKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context);
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
          actions: [
            IconButton(
              onPressed: () {
                appState.currentAction = PageAction(
                  state: PageState.addPage,
                  page: cartConfig,
                );
              },
              icon: Icon(FeatherIcons.shoppingCart),
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                'Headphone',
                style: AppTextStyle.title1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                "TMA Wireless",
                style: AppTextStyle.header0,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 18.0, top: 16.0),
              child: Row(
                children: [
                  Builder(
                    builder: (BuildContext context) => InkWell(
                      onTap: () {
                        final height = _gridKey.currentContext!.size!.height;
                        _selectedCategories
                            .setAll(0, [false, false, false, false]);
                        setState(() =>
                            _selectedCategories[0] = !_selectedCategories[0]);
                        showBottomSheet<void>(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          )),
                          elevation: 3.0,
                          context: context,
                          builder: (BuildContext context) =>
                              FilterBottomSheet(height: height),
                        );
                      },
                      borderRadius: BorderRadius.circular(10.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: _selectedCategories[0]
                              ? Border.all(color: AppColors.grey)
                              : null,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(FeatherIcons.sliders),
                              SizedBox(width: 8.0),
                              Text(
                                'Filter',
                                style: AppTextStyle.title,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  InkWell(
                    onTap: () {
                      _selectedCategories
                          .setAll(0, [false, false, false, false]);
                      setState(() =>
                          _selectedCategories[1] = !_selectedCategories[1]);
                    },
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: _selectedCategories[1]
                            ? Border.all(color: AppColors.grey)
                            : null,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Popularity',
                        style: AppTextStyle.title,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  InkWell(
                    onTap: () {
                      _selectedCategories
                          .setAll(0, [false, false, false, false]);
                      setState(() =>
                          _selectedCategories[2] = !_selectedCategories[2]);
                    },
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: _selectedCategories[2]
                            ? Border.all(color: AppColors.grey)
                            : null,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Newest',
                        style: AppTextStyle.title,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  InkWell(
                    onTap: () {
                      _selectedCategories
                          .setAll(0, [false, false, false, false]);
                      setState(() =>
                          _selectedCategories[3] = !_selectedCategories[3]);
                    },
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: _selectedCategories[3]
                            ? Border.all(color: AppColors.grey)
                            : null,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Most Expensive',
                        style: AppTextStyle.title,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Expanded(
              key: _gridKey,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: GridView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: constraints.maxHeight > 700 ? 310.h : 350.h,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                  ),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) => ProductView(
                    onPressed: () {
                      appState.currentAction = PageAction(
                        state: PageState.addPage,
                        page: detailConfig,
                      );
                    },
                    title: 'TMA-2 HD Wireless',
                    imageUrl: 'assets/images/headphone.png',
                    price: 350,
                    reviews: 89,
                    rate: 5.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
