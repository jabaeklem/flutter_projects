
import 'package:hive_flutter/hive_flutter.dart';
part 'account.g.dart';
@HiveType(typeId: 0)
class Account extends HiveObject{
 @HiveField(0)
 String name;
 @HiveField(1)
 String surname;
 @HiveField(2)
 String dateOfBirth;
 @HiveField(3)
 String number;
 @HiveField(4)
 String password;
 @HiveField(5)
 String gender;
 @HiveField(6)
 String nickname;
 Account({
  required this.name,
  required this.surname,
  required this.dateOfBirth,
  required this.number,
  required this.gender,
  required this.password,
  required this.nickname,
});
}