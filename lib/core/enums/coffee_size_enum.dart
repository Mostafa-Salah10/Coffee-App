import 'package:hive/hive.dart';

enum CoffeeSize { small, medium, large }

class CoffeeSizeAdapter extends TypeAdapter<CoffeeSize> {
  @override
  CoffeeSize read(BinaryReader reader) {
    return CoffeeSize.values[reader.readByte()];
  }

  @override
  final int typeId = 2;

  @override
  void write(BinaryWriter writer, CoffeeSize obj) {
    writer.writeByte(obj.index);
  }
}
