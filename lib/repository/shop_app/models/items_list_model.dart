import 'package:json_annotation/json_annotation.dart';

part 'items_list_model.g.dart';

// ext eq
// add description

@JsonSerializable()
class ItemsList {
  ItemsList({required this.aProduct});
  List<Item> aProduct;

  factory ItemsList.fromJson(Map<String, dynamic> json) =>
      _$ItemsListFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsListToJson(this);
}

@JsonSerializable()
class Item {
  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.photos,
  });

  final int id;
  final String name;
  final int price;
  final List<Photo> photos;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
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
