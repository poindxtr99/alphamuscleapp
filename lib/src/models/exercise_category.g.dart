// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseCategoryAdapter extends TypeAdapter<ExerciseCategory> {
  @override
  final int typeId = 2;

  @override
  ExerciseCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseCategory(
      fields[0] as String,
      (fields[1] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseCategory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.exercises);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
