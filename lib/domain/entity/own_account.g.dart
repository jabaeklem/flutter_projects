// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'own_account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  final int typeId = 1;

  @override
  Profile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Profile(
      clubs: fields[8] as int,
      name: fields[0] as String,
      surname: fields[1] as String,
      dateOfBirth: fields[2] as String,
      number: fields[3] as String,
      gender: fields[6] as String,
      followings: fields[5] as int,
      followers: fields[4] as int,
      nickname: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Profile obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.surname)
      ..writeByte(2)
      ..write(obj.dateOfBirth)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.followers)
      ..writeByte(5)
      ..write(obj.followings)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.nickname)
      ..writeByte(8)
      ..write(obj.clubs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
