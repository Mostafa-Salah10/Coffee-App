import 'package:coffee_app/core/constants/hive_constants.dart';
import 'package:coffee_app/core/database/cache/hive_service.dart';
import 'package:coffee_app/core/utils/app_strings.dart';
import 'package:coffee_app/features/auth/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final GlobalKey<FormState> signUpKey = GlobalKey();
  final GlobalKey<FormState> signInKey = GlobalKey();
  String phoneNumber = '';
  String pass = '';
  String confirmPass = '';
  bool isSecure = true;

  void togglePassIcon() {
    isSecure = !isSecure;
    emit(AuthTogglePassIcon());
  }

  Future<void> createUserWithPhoneNumberAndPass() async {
    emit(AuthSignOrSigbInLoadingState());
    try {
      if (pass != confirmPass) {
        emit(
          AuthSignOrSigbInFailureState(errorMessage: AppStrings.passNotMatch),
        );
        return;
      }
      List<UserModel> users = _getUsersFromDB().cast<UserModel>();
      _checkUser(users);
    } catch (e) {
      emit(AuthSignOrSigbInFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> signInUserWithPhoneNumberAndPass() async {
    emit(AuthSignOrSigbInLoadingState());
    try {
      List<UserModel> users = _getUsersFromDB().cast<UserModel>();
      _checkUserLogin(users);
    } catch (e) {
      emit(AuthSignOrSigbInFailureState(errorMessage: e.toString()));
    }
  }

  void _checkUser(List<UserModel> users) {
    for (var user in users) {
      if (user.phoneNumber == phoneNumber) {
        emit(AuthSignOrSigbInFailureState(errorMessage: AppStrings.userExist));
        return;
      } else {
        _addUserToDB(users);
      }
    }
    _addUserToDB(users);
  }

  void _addUserToDB(List<UserModel> users) {
    users.add(UserModel(phoneNumber: phoneNumber, password: pass));
    HiveService.put(
      boxName: HiveConstants.boxName,
      key: HiveConstants.userList,
      value: users,
    );
    emit(AuthSignOrSigbInSuccessState());
  }

  void _checkUserLogin(List<UserModel> users) {
    for (var user in users) {
      if (user.phoneNumber == phoneNumber && user.password == pass) {
        emit(AuthSignOrSigbInSuccessState());
        return;
      } else {
        emit(AuthSignOrSigbInFailureState(errorMessage: AppStrings.checkPhone));
        return;
      }
    }
    emit(AuthSignOrSigbInFailureState(errorMessage: AppStrings.checkPhone));
  }

  List<dynamic> _getUsersFromDB() {
    return List.from(
      HiveService.get(
        boxName: HiveConstants.boxName,
        key: HiveConstants.userList,
        defaultValue: [],
      ),
    );
  }
}
