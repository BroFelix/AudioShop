import 'package:audioshop/app/res/styles.dart';
import 'package:audioshop/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchListItem extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTapped;

  SearchListItem({
    required this.product,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        height: 150.h,
        width: mediaQuery.size.width,
        // padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                product.imageUrl,
                height: 72.0,
                width: 72.0,
              ),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: AppTextStyle.title1,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'USD ${product.price}',
                    style: AppTextStyle.title,
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellowAccent,
                          ),
                          Text(
                            '${product.rate}',
                            style: AppTextStyle.title,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            '${product.reviews} Reviews',
                            style: AppTextStyle.title,
                          ),
                        ],
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text('Do it'),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('You pressed it'),
                                duration: const Duration(seconds: 1),
                              ));
                            },
                          ),
                        ],
                        child: Icon(Icons.more_vert),
                      ),
                    ],
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
