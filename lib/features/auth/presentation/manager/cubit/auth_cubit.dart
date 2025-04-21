import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final GlobalKey<FormState> signUpKey = GlobalKey();
  final GlobalKey<FormState> signInKey = GlobalKey();

  bool isSecure = true;

  void togglePassIcon() {
    isSecure = !isSecure;
    emit(AuthTogglePassIcon());
  }
}
