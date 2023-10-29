import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  Product({this.aData});
  AData? aData;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class AData {
  AData({
    this.id,
    this.name,
    this.price,
    this.photo,
    this.description,
  });
  int? id;
  String? name;
  int? price;
  List<BigPhoto>? photo;
  Descriptions? description;

  factory AData.fromJson(Map<String, dynamic> json) => _$ADataFromJson(json);

  Map<String, dynamic> toJson() => _$ADataToJson(this);
}

@JsonSerializable()
class BigPhoto {
  BigPhoto({
    this.basicColors,
    this.big,
  });

  BasicColors? basicColors;
  String? big;

  factory BigPhoto.fromJson(Map<String, dynamic> json) =>
      _$BigPhotoFromJson(json);

  Map<String, dynamic> toJson() => _$BigPhotoToJson(this);
}

@JsonSerializable()
class BasicColors {
  BasicColors({
    this.colors,
  });

  List<String>? colors;

  factory BasicColors.fromJson(Map<String, dynamic> json) =>
      _$BasicColorsFromJson(json);

  Map<String, dynamic> toJson() => _$BasicColorsToJson(this);
}

@JsonSerializable()
class Descriptions {
  Descriptions({
    this.text,
  });

  String? text;

  factory Descriptions.fromJson(Map<String, dynamic> json) =>
      _$DescriptionsFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionsToJson(this);
}
