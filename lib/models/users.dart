import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final List<dynamic>? data;

  UserData({this.data});

  factory UserData.fromJson(Map<String, dynamic> result) {
    return UserData(data: result['data']);
  }

  @override
  List<Object?> get props => [data];
}

class User extends Equatable {
  final int? id;
  final String? name;
  final String? gender;
  final String? status;

  User({this.id, this.name, this.gender, this.status});

  factory User.fromJson(Map<String, dynamic> result) {
    return User(
        id: result['id'],
        name: result['name'],
        gender: result['gender'],
        status: result['status']);
  }

  @override
  List<Object?> get props => [id, name, gender, status];
}
