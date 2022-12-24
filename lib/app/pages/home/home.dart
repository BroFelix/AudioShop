import 'package:audioshop/app/res/colors.dart';
import 'package:audioshop/app/res/styles.dart';
import 'package:audioshop/app/router/app_state.dart';
import 'package:audioshop/app/router/pages.dart';
import 'package:audioshop/app/widgets/featured_product.dart';
import 'package:audioshop/app/widgets/menu_icon_icons.dart';
import 'package:audioshop/app/widgets/product_card.dart';
import 'package:audioshop/app/widgets/header.dart';
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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<bool> _tabIsSelected = [true, false, false, false];
  late AppState appState;

  void toggle() => _animationController.isDismissed ? _animationController.forward() : _animationController.reverse();

  void toggleDrawer() {}

  @override
  Widget build(BuildContext context) {
    bool canBeDragged = false;
    double minDragStartEdge = 0.0;
    double maxDragStartEdge = MediaQuery.of(context).size.width * .1;
    double maxSlide = 90.0;

    final size = MediaQuery.of(context).size;
    final tabController = TabController(length: 4, vsync: this);
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    void onDragStart(DragStartDetails details) {
      bool isDragOpenFromLeft = _animationController.isDismissed && details.globalPosition.dx < minDragStartEdge;
      bool isDragClosedFromRight = _animationController.isCompleted && details.globalPosition.dx > maxDragStartEdge;
      canBeDragged = isDragOpenFromLeft || isDragClosedFromRight;
    }

    void onDragUpdate(DragUpdateDetails details) {
      if (canBeDragged) {
        double delta = details.primaryDelta! / maxSlide;
        _animationController.value += delta;
      }
    }

    void onDragEnd(DragEndDetails details) {
      if (_animationController.isDismissed || _animationController.isCompleted) {
        return;
      }
      if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
        double visualVelocity = details.velocity.pixelsPerSecond.dx / MediaQuery.of(context).size.width;
        _animationController.fling(velocity: visualVelocity);
      } else if (_animationController.value < 0.5) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    }

    appState = context.read<AppState>();
    return LayoutBuilder(
      builder: (context, constraints) => Material(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            double slide = maxSlide * _animationController.value;
            double scale = 1.0 - (_animationController.value * .4);
            return GestureDetector(
              onTap: toggleDrawer,
              onHorizontalDragStart: onDragStart,
              onHorizontalDragUpdate: onDragUpdate,
              onHorizontalDragEnd: onDragEnd,
              child: Stack(
                children: [
                  Container(
                    height: size.height,
                    width: size.width,
                    color: AppColors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * .185),
                        ListTile(
                          leading: const Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {},
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: .5,
                          indent: 64.0,
                          endIndent: size.width * .5,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Orders',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: .5,
                          indent: 64.0,
                          endIndent: size.width * .5,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(
                            Icons.local_offer_outlined,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Offer and Promo',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: .5,
                          indent: 64.0,
                          endIndent: size.width * .5,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(
                            Icons.sticky_note_2_outlined,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Privacy policy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: .5,
                          indent: 64.0,
                          endIndent: size.width * .5,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(
                            Icons.security,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Security',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            padding: const EdgeInsets.only(bottom: 64.0),
                            child: ListTile(
                              onTap: () {},
                              title: Row(
                                children: const [
                                  Text(
                                    'Sign-out',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_right_alt_sharp,
                                    color: Colors.white,
                                    size: 48.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(slide)
                      ..scale(scale),
                    alignment: Alignment.centerRight,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(-40, 50),
                            blurRadius: 5.0,
                            color: AppColors.shade,
                          ),
                        ],
                      ),
                      child: Scaffold(
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
                            onPressed: () {
                              toggle();
                            },
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
                                appState.push(PageAction(
                                  state: PageState.push,
                                  page: profileConfig,
                                ));
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
                            onTapProduct: () => appState.push(PageAction(
                              state: PageState.push,
                              page: exploreConfig,
                            )),
                            onTapSearch: () => appState.push(PageAction(
                              state: PageState.push,
                              page: searchConfig,
                            )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
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
          _buildCardapp(constraints, onTapProduct),
        ],
      );

  Widget _buildCardapp(BoxConstraints constraints, VoidCallback onTapProduct) {
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
          _tabScrollapp(),
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
                    style: AppTextStyle.title1.copyWith(color: AppColors.darkGrey),
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

  Widget _tabScrollapp() {
    return SingleChildScrollView(
        padding: EdgeInsets.only(left: 18.0),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Headerapp(
              title: 'Headphone',
              selected: _tabIsSelected[0],
              onPressed: () => setState(() {
                _tabIsSelected = [false, false, false, false];
                _tabIsSelected[0] = true;
              }),
            ),
            Headerapp(
              title: 'Headband',
              selected: _tabIsSelected[1],
              onPressed: () => setState(() {
                _tabIsSelected = [false, false, false, false];
                _tabIsSelected[1] = true;
              }),
            ),
            Headerapp(
              title: 'Earbuds',
              selected: _tabIsSelected[2],
              onPressed: () => setState(() {
                _tabIsSelected = [false, false, false, false];
                _tabIsSelected[2] = true;
              }),
            ),
            Headerapp(
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
                    appState.push(PageAction(
                      state: PageState.push,
                      page: detailConfig,
                    ));
                  },
                  title: 'TMA-2 HD Wireless',
                  imageUrl: 'assets/images/headphone.png',
                  price: 350,
                  first: index == 0,
                  last: index == 2,
                )));
  }
}
