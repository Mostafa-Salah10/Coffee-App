import 'package:coffee_app/core/constants/hive_constants.dart';
import 'package:coffee_app/core/enums/coffee_size_enum.dart';
import 'package:coffee_app/features/auth/data/model/user_type_adapter.dart';
import 'package:coffee_app/features/home/data/models/category_model_type_adapter.dart';
import 'package:coffee_app/features/home/data/models/coffee_model_type_adapter.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    //register adapters in Project
    Hive.registerAdapter(CategoryModelTypeAdapter());
    Hive.registerAdapter(CoffeeSizeAdapter());
    Hive.registerAdapter(CoffeeModelTypeAdapter());
    Hive.registerAdapter(UserModelAdapter());
    //open box here
    await openBox(boxName: HiveConstants.boxName);
  }

  static Future<void> openBox({required String boxName}) async {
    await Hive.openBox(boxName);
  }

  static Box getBox({required String boxName}) {
    return Hive.box(boxName);
  }

  static Future<void> put({
    required String boxName,
    required String key,
    dynamic value,
  }) async {
    final box = getBox(boxName: boxName);
    await box.put(key, value);
  }

  static dynamic get({
    required String boxName,
    required String key,
    dynamic defaultValue,
  }) {
    final box = getBox(boxName: boxName);
    return box.get(key, defaultValue: defaultValue);
  }

  static Future<void> delete({
    required String boxName,
    required String key,
  }) async {
    final box = getBox(boxName: boxName);
    await box.delete(key);
  }

  static Future<void> putAll({
    required String boxName,
    required Map<String, dynamic> map,
  }) async {
    final box = getBox(boxName: boxName);
    await box.putAll(map);
  }

  static Future<void> deleteAll({
    required String boxName,
    required List<String> keys,
  }) async {
    final box = getBox(boxName: boxName);
    await box.deleteAll(keys);
  }

  static Future<void> clear({required String boxName}) async {
    //remove all values of this box
    final box = getBox(boxName: boxName);
    await box.clear();
  }

  static Future<void> deleteFromDisk(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }
}
