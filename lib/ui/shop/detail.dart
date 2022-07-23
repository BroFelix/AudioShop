import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/res/colors.dart';
import 'package:ecommerce/res/styles.dart';
import 'package:ecommerce/ui/components/line_decoration.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {
  late final controller = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FeatherIcons.chevronLeft),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(FeatherIcons.shoppingCart),
            onPressed: () {},
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
              labelStyle: AppTextStyle.title1.copyWith(fontWeight: FontWeight.w500),
              labelColor: AppColors.black,
              unselectedLabelColor: AppColors.black,
              unselectedLabelStyle: AppTextStyle.title1.copyWith(fontWeight: FontWeight.w500),
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
            SizedBox(height: 16.0),
            SizedBox(
              height: 600.0,
              child: TabBarView(
                controller: controller,
                children: [
                  ListView(
                    primary: false,
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
                          viewportFraction: 0.8,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0),
                        child: Text(
                          'Reviews (102)',
                          style: AppTextStyle.title1,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.amber,
                  ),
                  Container(
                    color: Colors.amberAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
