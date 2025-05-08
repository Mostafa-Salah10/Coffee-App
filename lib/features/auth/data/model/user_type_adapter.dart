import 'package:coffee_app/features/auth/data/model/user_model.dart';
import 'package:hive/hive.dart';

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 20;

  @override
  UserModel read(BinaryReader reader) {
    return UserModel(
      phoneNumber: reader.readString(),
      password: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.writeString(obj.phoneNumber);
    writer.writeString(obj.password);
  }
}
