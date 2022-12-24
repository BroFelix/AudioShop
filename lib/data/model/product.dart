import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';
part 'product.g.dart';

@Freezed()
class ProductModel with _$ProductModel {
  // final String imageUrl;
  // final String productName;
  // final double rate;
  // final int reapps;
  // final double price;

  const factory ProductModel({
    required String imageUrl,
    required String productName,
    required double rate,
    required int reviews,
    required double price,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
