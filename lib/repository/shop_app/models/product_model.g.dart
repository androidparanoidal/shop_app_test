// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      aData: json['aData'] == null
          ? null
          : AData.fromJson(json['aData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'aData': instance.aData,
    };

AData _$ADataFromJson(Map<String, dynamic> json) => AData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      photo: (json['photo'] as List<dynamic>?)
          ?.map((e) => BigPhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] == null
          ? null
          : Descriptions.fromJson(json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ADataToJson(AData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'photo': instance.photo,
      'description': instance.description,
    };

BigPhoto _$BigPhotoFromJson(Map<String, dynamic> json) => BigPhoto(
      basicColors: json['basicColors'] == null
          ? null
          : BasicColors.fromJson(json['basicColors'] as Map<String, dynamic>),
      big: json['big'] as String?,
    );

Map<String, dynamic> _$BigPhotoToJson(BigPhoto instance) => <String, dynamic>{
      'basicColors': instance.basicColors,
      'big': instance.big,
    };

BasicColors _$BasicColorsFromJson(Map<String, dynamic> json) => BasicColors(
      colors:
          (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BasicColorsToJson(BasicColors instance) =>
    <String, dynamic>{
      'colors': instance.colors,
    };

Descriptions _$DescriptionsFromJson(Map<String, dynamic> json) => Descriptions(
      text: json['text'] as String?,
    );

Map<String, dynamic> _$DescriptionsToJson(Descriptions instance) =>
    <String, dynamic>{
      'text': instance.text,
    };
