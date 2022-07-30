import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/res/colors.dart';
import 'package:ecommerce/res/styles.dart';
import 'package:ecommerce/router/app_state.dart';
import 'package:ecommerce/router/pages.dart';
import 'package:ecommerce/ui/components/comment.dart';
import 'package:ecommerce/ui/components/green_button.dart';
import 'package:ecommerce/ui/components/line_decoration.dart';
import 'package:ecommerce/ui/components/product_card.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late final controller = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    final appState = context.read<AppState>();
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(FeatherIcons.chevronLeft),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(FeatherIcons.shoppingCart),
              onPressed: () {
                appState.currentAction = PageAction(
                  state: PageState.addPage,
                  page: cartConfig,
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          primary: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  'USD 350',
                  style: AppTextStyle.title1.copyWith(
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  'TMA-2\nHD Wireless',
                  style: AppTextStyle.header,
                ),
              ),
              TabBar(
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.symmetric(horizontal: 24.0),
                indicatorPadding: EdgeInsets.all(4.0),
                controller: controller,
                indicatorColor: AppColors.green,
                isScrollable: true,
                labelStyle:
                    AppTextStyle.title1.copyWith(fontWeight: FontWeight.w500),
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.black,
                unselectedLabelStyle:
                    AppTextStyle.title1.copyWith(fontWeight: FontWeight.w500),
                indicator: LineDecoration(
                  color: AppColors.green,
                  thickness: 4.0,
                  width: 12.0,
                ),
                tabs: [
                  Tab(text: 'Overview'),
                  Tab(text: 'Features'),
                  Tab(text: 'Specifications'),
                ],
              ),
              Container(
                height: constraints.maxHeight * 0.64,
                child: TabBarView(
                  viewportFraction: 1.0,
                  controller: controller,
                  children: [
                    SizedBox(
                      height: 1100.0,
                      child: ListView(
                        primary: false,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 4.0),
                        children: [
                          CarouselSlider(
                            items: [
                              Container(
                                padding: EdgeInsets.all(24.0),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: AppColors.white,
                                ),
                                child: Image.asset(
                                  'assets/images/headphone_large.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Image.asset('assets/images/pads.png'),
                            ],
                            options: CarouselOptions(
                              height: 400.0,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.9,
                              enableInfiniteScroll: false,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24.0, right: 24.0, top: 32.0),
                            child: Text(
                              'Reviews (102)',
                              style: AppTextStyle.title1,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          SizedBox(
                            height: 300.0,
                            width: constraints.maxWidth,
                            child: ListView(
                              primary: false,
                              children: [
                                CommentView(),
                              ],
                            ),
                          ),
                          Container(
                            color: AppColors.white,
                            height: 340.h,
                            padding: EdgeInsets.symmetric(vertical: 24.0),
                            width: constraints.maxWidth,
                            child: ListView(
                              primary: false,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(left: 24.0),
                              scrollDirection: Axis.horizontal,
                              children: [
                                ProductCard(
                                  title: 'TMA-2 HD Wireless',
                                  imageUrl: 'assets/images/headphone.png',
                                  price: 350,
                                  first: true,
                                  last: false,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: AppColors.cleanWhite,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 24.0,
                            ),
                            child: GreenButton(
                              height:
                                  constraints.maxHeight < 700 ? 120.h : 100.h,
                              width: double.infinity,
                              text: 'Add To Cart',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 800.h,
                      width: constraints.maxWidth,
                      child: ListView(
                        padding:
                            EdgeInsets.only(left: 24.0, top: 4.0, right: 24.0),
                        primary: false,
                        children: [
                          Text(
                            'Highly Detailed Audio',
                            style: AppTextStyle.title1
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.',
                            style: AppTextStyle.title,
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.',
                            style: AppTextStyle.title,
                          ),
                          ProductItem(),
                          ProductItem(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            child: GreenButton(
                              height:
                                  constraints.maxHeight < 700 ? 120.h : 100.h,
                              width: 400,
                              onPressed: () {},
                              text: 'Add To Cart',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(color: Colors.amberAccent),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              'assets/images/headphone.png',
              height: 128.0,
              width: 128.0,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'APTX HD WIRELESS\nAUDIO',
                style:
                    AppTextStyle.title1.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              SizedBox(
                width: 395.w,
                child: Text(
                  'The Aptx® HD codec transmits 24-bit hi-res audio, equal to or better than CD quality.',
                  style: AppTextStyle.title,
                  overflow: TextOverflow.visible,
                  softWrap: true,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
