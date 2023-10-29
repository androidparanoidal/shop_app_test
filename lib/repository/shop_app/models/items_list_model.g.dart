// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsList _$ItemsListFromJson(Map<String, dynamic> json) => ItemsList(
      aProduct: (json['aProduct'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsListToJson(ItemsList instance) => <String, dynamic>{
      'aProduct': instance.aProduct,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      photos: (json['photos'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'photos': instance.photos,
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      basicColor:
          BasicColor.fromJson(json['basicColor'] as Map<String, dynamic>),
      big: json['big'] as String,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'basicColor': instance.basicColor,
      'big': instance.big,
    };

BasicColor _$BasicColorFromJson(Map<String, dynamic> json) => BasicColor(
      colors:
          (json['colors'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BasicColorToJson(BasicColor instance) =>
    <String, dynamic>{
      'colors': instance.colors,
    };
