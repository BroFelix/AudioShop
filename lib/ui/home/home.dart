import 'package:ecommerce/res/colors.dart';
import 'package:ecommerce/res/styles.dart';
import 'package:ecommerce/router/app_state.dart';
import 'package:ecommerce/router/pages.dart';
import 'package:ecommerce/ui/components/featured_product.dart';
import 'package:ecommerce/ui/components/menu_icon_icons.dart';
import 'package:ecommerce/ui/components/product_card.dart';
import 'package:ecommerce/ui/components/header.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<bool> _tabIsSelected = [true, false, false, false];
  late AppState appState;

  @override
  Widget build(BuildContext context) {
    appState = context.read<AppState>();
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.cleanWhite,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.cleanWhite,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              MenuIcon.menu_variant,
              color: Colors.black,
            ),
            onPressed: null,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/app_icon.png',
                height: 48.h,
                width: 48.w,
              ),
              const SizedBox(width: 12),
              Text(
                'Audio',
                style: AppTextStyle.header.copyWith(color: Colors.black),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                appState.currentAction = PageAction(
                  state: PageState.addPage,
                  page: profileConfig,
                );
              },
              icon: CircleAvatar(
                child: Image.asset(
                  'assets/images/avatar.png',
                  height: 32,
                  width: 32,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: _buildBody(
            constraints: constraints,
            onTapProduct: () => appState.currentAction = PageAction(
              state: PageState.addPage,
              page: exploreConfig,
            ),
            onTapSearch: () => appState.currentAction = PageAction(
              state: PageState.addPage,
              page: searchConfig,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody({
    required BoxConstraints constraints,
    required VoidCallback onTapSearch,
    required VoidCallback onTapProduct,
  }) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              'Hi, Andrea',
              style: AppTextStyle.title.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              'What are you looking for today?',
              style: AppTextStyle.header.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: TextField(
              readOnly: true,
              onTap: onTapSearch,
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  FeatherIcons.search,
                  color: AppColors.lightGrey,
                ),
                hintText: 'Search headphone',
                hintStyle: AppTextStyle.searchField,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGrey),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          _buildCardView(constraints, onTapProduct),
        ],
      );

  Widget _buildCardView(BoxConstraints constraints, VoidCallback onTapProduct) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      decoration: BoxDecoration(
        color: AppColors.whiteOne,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          _tabScrollView(),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: FeaturedProduct(
              title: 'TMA-2\nModular\nHeadphone',
              imageUrl: 'assets/images/headphone.png',
              onPressed: onTapProduct,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 16.0,
              bottom: 8.0,
              right: 24.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured Products',
                  style: AppTextStyle.title1,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'See All',
                    style:
                        AppTextStyle.title1.copyWith(color: AppColors.darkGrey),
                  ),
                ),
              ],
            ),
          ),
          _buildLowerPart(constraints),
        ],
      ),
    );
  }

  Widget _tabScrollView() {
    return SingleChildScrollView(
        padding: EdgeInsets.only(left: 18.0),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderView(
              title: 'Headphone',
              selected: _tabIsSelected[0],
              onPressed: () => setState(() {
                _tabIsSelected = [false, false, false, false];
                _tabIsSelected[0] = true;
              }),
            ),
            HeaderView(
              title: 'Headband',
              selected: _tabIsSelected[1],
              onPressed: () => setState(() {
                _tabIsSelected = [false, false, false, false];
                _tabIsSelected[1] = true;
              }),
            ),
            HeaderView(
              title: 'Earbuds',
              selected: _tabIsSelected[2],
              onPressed: () => setState(() {
                _tabIsSelected = [false, false, false, false];
                _tabIsSelected[2] = true;
              }),
            ),
            HeaderView(
              title: 'Cable',
              selected: _tabIsSelected[3],
              onPressed: () => setState(() {
                _tabIsSelected = [false, false, false, false];
                _tabIsSelected[3] = true;
              }),
            ),
          ],
        ));
  }

  Widget _buildLowerPart(BoxConstraints constraints) {
    return SizedBox(
        height: 320.h,
        width: constraints.maxWidth,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => ProductCard(
                  onPressed: () {
                    appState.currentAction = PageAction(
                      state: PageState.addPage,
                      page: detailConfig,
                    );
                  },
                  title: "TMA-2 HD Wireless",
                  imageUrl: 'assets/images/headphone.png',
                  price: 350,
                  first: index == 0,
                  last: index == 2,
                )));
  }
}
