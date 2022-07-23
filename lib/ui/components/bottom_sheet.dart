import 'package:ecommerce/res/colors.dart';
import 'package:ecommerce/res/styles.dart';
import 'package:ecommerce/ui/components/header.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterBottomSheet extends StatefulWidget {
  final height;
  FilterBottomSheet({Key? key, required this.height}) : super(key: key);
  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  var _tabIsSelected = List.generate(4, (index) => false);
  var _sortSelected = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.whiteOne,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filter', style: AppTextStyle.header0),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(FeatherIcons.x),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text(
              'Categories',
              style: AppTextStyle.title1.copyWith(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          _tabScrollView(),
          SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text(
              'Sort By',
              style: AppTextStyle.title1.copyWith(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16.0,
              runSpacing: 12.0,
              children: [
                InkWell(
                  onTap: () {
                    _sortSelected.setAll(0, [false, false, false, false, false, false]);
                    setState(() {
                      _sortSelected[0] = true;
                    });
                  },
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: _sortSelected[0] ? AppColors.green : AppColors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: !_sortSelected[0]
                          ? Border.all(color: AppColors.grey, width: 1.0)
                          : Border.all(color: AppColors.green, width: 1.0),
                    ),
                    child: Text(
                      'Popularity',
                      style: AppTextStyle.title.copyWith(color: _sortSelected[0] ? AppColors.white : AppColors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _sortSelected.setAll(0, [false, false, false, false, false, false]);
                    setState(() {
                      _sortSelected[1] = true;
                    });
                  },
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: _sortSelected[1] ? AppColors.green : AppColors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border:
                          !_sortSelected[1] ? Border.all(color: AppColors.grey, width: 1.0) : Border.all(color: AppColors.grey, width: 1.0),
                    ),
                    child: Text(
                      'Newest',
                      style: AppTextStyle.title.copyWith(color: _sortSelected[1] ? AppColors.white : AppColors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _sortSelected.setAll(0, [false, false, false, false, false, false]);
                    setState(() {
                      _sortSelected[2] = true;
                    });
                  },
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: _sortSelected[2] ? AppColors.green : AppColors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border:
                          !_sortSelected[2] ? Border.all(color: AppColors.grey, width: 1.0) : Border.all(color: AppColors.grey, width: 1.0),
                    ),
                    child: Text(
                      'Oldest',
                      style: AppTextStyle.title.copyWith(color: _sortSelected[2] ? AppColors.white : AppColors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _sortSelected.setAll(0, [false, false, false, false, false, false]);
                    setState(() {
                      _sortSelected[3] = true;
                    });
                  },
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: _sortSelected[3] ? AppColors.green : AppColors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border:
                          !_sortSelected[3] ? Border.all(color: AppColors.grey, width: 1.0) : Border.all(color: AppColors.grey, width: 1.0),
                    ),
                    child: Text(
                      'High Price',
                      style: AppTextStyle.title.copyWith(color: _sortSelected[3] ? AppColors.white : AppColors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _sortSelected.setAll(0, [false, false, false, false, false, false]);
                    setState(() {
                      _sortSelected[4] = true;
                    });
                  },
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: _sortSelected[4] ? AppColors.green : AppColors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border:
                          !_sortSelected[4] ? Border.all(color: AppColors.grey, width: 1.0) : Border.all(color: AppColors.grey, width: 1.0),
                    ),
                    child: Text(
                      'Low Price',
                      style: AppTextStyle.title.copyWith(color: _sortSelected[4] ? AppColors.white : AppColors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _sortSelected.setAll(0, [false, false, false, false, false, false]);
                    setState(() {
                      _sortSelected[5] = true;
                    });
                  },
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: _sortSelected[5] ? AppColors.green : AppColors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border:
                          !_sortSelected[5] ? Border.all(color: AppColors.grey, width: 1.0) : Border.all(color: AppColors.grey, width: 1.0),
                    ),
                    child: Text(
                      'Review',
                      style: AppTextStyle.title.copyWith(color: _sortSelected[5] ? AppColors.white : AppColors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text(
              'Price Range',
              style: AppTextStyle.title1.copyWith(color: AppColors.black),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0, right: 18.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Min Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Max Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                left: 18.0,
                right: 18.0,
                bottom: defaultTargetPlatform == TargetPlatform.iOS ? 48.0 : 16.0,
              ),
              child: MaterialButton(
                height: 100.h,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: AppColors.green,
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Apply Filter',
                  style: AppTextStyle.buttonText.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabScrollView() => SingleChildScrollView(
        padding: EdgeInsets.only(left: 18.0),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderView(
              title: 'Headphone',
              selected: _tabIsSelected[0],
              onPressed: () {
                _tabIsSelected.setAll(0, [false, false, false, false]);
                setState(() => _tabIsSelected[0] = true);
              },
            ),
            HeaderView(
              title: 'Headband',
              selected: _tabIsSelected[1],
              onPressed: () {
                _tabIsSelected.setAll(0, [false, false, false, false]);
                setState(() => _tabIsSelected[1] = true);
              },
            ),
            HeaderView(
              title: 'Earbuds',
              selected: _tabIsSelected[2],
              onPressed: () {
                _tabIsSelected.setAll(0, [false, false, false, false]);
                setState(() => _tabIsSelected[2] = true);
              },
            ),
            HeaderView(
              title: 'Cable',
              selected: _tabIsSelected[3],
              onPressed: () {
                _tabIsSelected.setAll(0, [false, false, false, false]);
                setState(() => _tabIsSelected[3] = true);
              },
            ),
          ],
        ),
      );
}
