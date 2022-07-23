import 'package:ecommerce/res/colors.dart';
import 'package:ecommerce/res/styles.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductView extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int price;
  final double rate;
  final int reviews;
  final VoidCallback onPressed;

  const ProductView({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.reviews,
    required this.rate,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: AppColors.cleanWhite,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  imageUrl,
                  height: constraints.maxHeight > 700 ? 180.h : 150.h,
                  width: 220.w,
                  alignment: Alignment.center,
                ),
              ),
              Text(
                title,
                style: AppTextStyle.title,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 2.0),
              Text(
                'USD $price',
                style:
                    AppTextStyle.subTitle.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(
                      Icons.star,
                      size: 14.0,
                      color: AppColors.yellow,
                    ),
                    Text(
                      '$rate',
                      style: AppTextStyle.subTitle,
                    ),
                  ]),
                  Text(
                    '$reviews Reviews',
                    style: AppTextStyle.subTitle,
                  ),
                  ContextMenu(
                    items: [
                      PopupMenuItem(
                        child: Text('Add to cart'),
                        value: 'add_to_cart',
                      ),
                      PopupMenuItem(
                        child: Text('Add to wishlist'),
                        value: 'add_to_wishlist',
                      ),
                      PopupMenuItem(
                        child: Text('Share'),
                        value: 'share',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContextMenu extends StatelessWidget {
  final List<PopupMenuEntry> items;

  const ContextMenu({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 16.0,
      padding: EdgeInsets.zero,
      alignment: Alignment.centerRight,
      onPressed: () {
        final RenderBox button = context.findRenderObject()! as RenderBox;
        final RenderBox overlay = Navigator.of(context)
            .overlay!
            .context
            .findRenderObject()! as RenderBox;
        final Offset offset;
        // switch (widget.position) {
        //   case PopupMenuPosition.over:
        //     offset = widget.offset;
        //     break;
        //   case PopupMenuPosition.under:
        //     offset = Offset(0.0, button.size.height - (widget.padding.vertical / 2)) + widget.offset;
        //     break;
        // }
        offset = Offset(0.0, button.size.height - 24.0);
        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(
            button.localToGlobal(offset, ancestor: overlay),
            button.localToGlobal(button.size.bottomRight(Offset.zero) + offset,
                ancestor: overlay),
          ),
          Offset.zero & overlay.size,
        );
        showMenu(
          context: context,
          position: position,
          items: items,
        );
      },
      icon: Icon(FeatherIcons.moreVertical),
    );
  }
}
