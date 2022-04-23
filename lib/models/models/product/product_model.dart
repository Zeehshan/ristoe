import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ProductModel(
      {required int id,
      required String code,
      required String name,
      required int categorie,
      required String img,
      required String description,
      required int isMenu,
      required String price,
      required int status}) = _ProductModel;

  factory ProductModel.fromJson(json) => _$ProductModelFromJson(json);
}
