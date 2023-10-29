// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      aData: AData.fromJson(json['aData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'aData': instance.aData,
    };

AData _$ADataFromJson(Map<String, dynamic> json) => AData(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      photos: (json['photos'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      descriptions:
          Descriptions.fromJson(json['descriptions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ADataToJson(AData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'photos': instance.photos,
      'descriptions': instance.descriptions,
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

Descriptions _$DescriptionsFromJson(Map<String, dynamic> json) => Descriptions(
      text: json['text'] as String,
    );

Map<String, dynamic> _$DescriptionsToJson(Descriptions instance) =>
    <String, dynamic>{
      'text': instance.text,
    };
