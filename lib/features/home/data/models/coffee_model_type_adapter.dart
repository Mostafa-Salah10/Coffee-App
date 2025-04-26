import 'package:coffee_app/core/enums/coffee_size_enum.dart';
import 'package:coffee_app/features/home/data/models/coffee_model.dart';
import 'package:hive/hive.dart';

class CoffeeModelTypeAdapter extends TypeAdapter<CoffeeModel> {
  @override
  CoffeeModel read(BinaryReader reader) {
    return CoffeeModel(
      imagePath: reader.readString(),
      categoryName: reader.readString(),
      description: reader.readString(),
      coffeeSize: reader.readList().cast<CoffeeSize>(),
      rate: reader.readDouble(),
      volume: reader.readDouble(),
      price: reader.readDouble(),
      quantity: reader.readInt(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, CoffeeModel obj) {
    writer.writeString(obj.imagePath);
    writer.writeString(obj.categoryName);
    writer.writeString(obj.description);
    writer.writeList(obj.coffeeSize);
    writer.writeDouble(obj.rate);
    writer.writeDouble(obj.volume);
    writer.writeDouble(obj.price);
    writer.writeInt(obj.quantity);
  }
}
