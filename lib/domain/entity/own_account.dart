
import 'package:hive_flutter/hive_flutter.dart';
part 'own_account.g.dart';
@HiveType(typeId: 1)
class Profile extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String surname;
  @HiveField(2)
  String dateOfBirth;
  @HiveField(3)
  String number;
  @HiveField(4)
  int followers;
  @HiveField(5)
  int followings;
  @HiveField(6)
  String gender;
  @HiveField(7)
  String nickname;
  @HiveField(8)
  int clubs;
  Profile({
    required this.clubs,
    required this.name,
    required this.surname,
    required this.dateOfBirth,
    required this.number,
    required this.gender,
    required this.followings,
    required this.followers,
    required this.nickname,
  });
}