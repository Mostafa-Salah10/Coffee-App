import 'package:coffee_app/features/home/data/models/category_model.dart';
import 'package:hive/hive.dart';

class CategoryModelTypeAdapter extends TypeAdapter<CategoryModel> {
  @override
  CategoryModel read(BinaryReader reader) {
    return CategoryModel(name: reader.readString(), image: reader.readString());
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.image);
  }
}
