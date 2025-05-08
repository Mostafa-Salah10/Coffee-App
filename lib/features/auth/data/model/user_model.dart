import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String phoneNumber;
  final String password;

  const UserModel({required this.phoneNumber, required this.password});

  UserModel copyWith({String? phoneNumber, String? password}) {
    return UserModel(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [phoneNumber, password];
}
