// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      id: json['id'] as int,
      title: json['title'] as String,
      mid: json['mid'] as String,
      sort: json['sort'] as int,
      status: json['status'] as int,
      dishes: (json['dishes'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mid': instance.mid,
      'sort': instance.sort,
      'status': instance.status,
      'dishes': instance.dishes,
    };
