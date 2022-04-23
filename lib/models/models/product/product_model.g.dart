// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      categorie: json['categorie'] as int,
      img: json['img'] as String,
      description: json['description'] as String,
      isMenu: json['is_menu'] as int,
      price: json['price'] as String,
      status: json['status'] as int,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'categorie': instance.categorie,
      'img': instance.img,
      'description': instance.description,
      'is_menu': instance.isMenu,
      'price': instance.price,
      'status': instance.status,
    };
