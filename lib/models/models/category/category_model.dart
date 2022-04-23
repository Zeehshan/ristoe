import 'package:freezed_annotation/freezed_annotation.dart';

import '../models.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory CategoryModel(
      {required int id,
      required String title,
      required String mid,
      required int sort,
      required int status,
      required List<ProductModel> dishes}) = _CategoryModel;

  factory CategoryModel.fromJson(json) => _$CategoryModelFromJson(json);
}
