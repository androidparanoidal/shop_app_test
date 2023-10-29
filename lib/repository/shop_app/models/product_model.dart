import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  Product({required this.aData});
  final AData aData;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class AData {
  AData({
    required this.id,
    required this.name,
    required this.price,
    required this.photos,
    required this.descriptions,
  });
  final int id;
  final String name;
  final int price;
  final List<Photo> photos;
  final Descriptions descriptions;

  factory AData.fromJson(Map<String, dynamic> json) => _$ADataFromJson(json);

  Map<String, dynamic> toJson() => _$ADataToJson(this);
}

@JsonSerializable()
class Photo {
  Photo({
    required this.basicColor,
    required this.big,
  });

  final BasicColor basicColor;
  final String big;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@JsonSerializable()
class BasicColor {
  BasicColor({
    required this.colors,
  });

  final List<String> colors;

  factory BasicColor.fromJson(Map<String, dynamic> json) =>
      _$BasicColorFromJson(json);

  Map<String, dynamic> toJson() => _$BasicColorToJson(this);
}

@JsonSerializable()
class Descriptions {
  Descriptions({
    required this.text,
  });

  final String text;

  factory Descriptions.fromJson(Map<String, dynamic> json) =>
      _$DescriptionsFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionsToJson(this);
}
