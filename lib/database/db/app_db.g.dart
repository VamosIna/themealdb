// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $FavoriteTable extends Favorite
    with TableInfo<$FavoriteTable, FavoriteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _mealsIdMeta =
      const VerificationMeta('mealsId');
  @override
  late final GeneratedColumn<String> mealsId = GeneratedColumn<String>(
      'meals_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mealsNameMeta =
      const VerificationMeta('mealsName');
  @override
  late final GeneratedColumn<String> mealsName = GeneratedColumn<String>(
      'meals_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mealsThumbnailMeta =
      const VerificationMeta('mealsThumbnail');
  @override
  late final GeneratedColumn<String> mealsThumbnail = GeneratedColumn<String>(
      'meals_thumbnail', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mealsAreaMeta =
      const VerificationMeta('mealsArea');
  @override
  late final GeneratedColumn<String> mealsArea = GeneratedColumn<String>(
      'meals_area', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mealsInstructionMeta =
      const VerificationMeta('mealsInstruction');
  @override
  late final GeneratedColumn<String> mealsInstruction = GeneratedColumn<String>(
      'meals_instruction', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mealsCategoryMeta =
      const VerificationMeta('mealsCategory');
  @override
  late final GeneratedColumn<String> mealsCategory = GeneratedColumn<String>(
      'meals_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        mealsId,
        mealsName,
        mealsThumbnail,
        mealsArea,
        mealsInstruction,
        mealsCategory
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('meals_id')) {
      context.handle(_mealsIdMeta,
          mealsId.isAcceptableOrUnknown(data['meals_id']!, _mealsIdMeta));
    } else if (isInserting) {
      context.missing(_mealsIdMeta);
    }
    if (data.containsKey('meals_name')) {
      context.handle(_mealsNameMeta,
          mealsName.isAcceptableOrUnknown(data['meals_name']!, _mealsNameMeta));
    } else if (isInserting) {
      context.missing(_mealsNameMeta);
    }
    if (data.containsKey('meals_thumbnail')) {
      context.handle(
          _mealsThumbnailMeta,
          mealsThumbnail.isAcceptableOrUnknown(
              data['meals_thumbnail']!, _mealsThumbnailMeta));
    } else if (isInserting) {
      context.missing(_mealsThumbnailMeta);
    }
    if (data.containsKey('meals_area')) {
      context.handle(_mealsAreaMeta,
          mealsArea.isAcceptableOrUnknown(data['meals_area']!, _mealsAreaMeta));
    } else if (isInserting) {
      context.missing(_mealsAreaMeta);
    }
    if (data.containsKey('meals_instruction')) {
      context.handle(
          _mealsInstructionMeta,
          mealsInstruction.isAcceptableOrUnknown(
              data['meals_instruction']!, _mealsInstructionMeta));
    } else if (isInserting) {
      context.missing(_mealsInstructionMeta);
    }
    if (data.containsKey('meals_category')) {
      context.handle(
          _mealsCategoryMeta,
          mealsCategory.isAcceptableOrUnknown(
              data['meals_category']!, _mealsCategoryMeta));
    } else if (isInserting) {
      context.missing(_mealsCategoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mealsId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meals_id'])!,
      mealsName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meals_name'])!,
      mealsThumbnail: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}meals_thumbnail'])!,
      mealsArea: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meals_area'])!,
      mealsInstruction: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}meals_instruction'])!,
      mealsCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meals_category'])!,
    );
  }

  @override
  $FavoriteTable createAlias(String alias) {
    return $FavoriteTable(attachedDatabase, alias);
  }
}

class FavoriteData extends DataClass implements Insertable<FavoriteData> {
  final int id;
  final String mealsId;
  final String mealsName;
  final String mealsThumbnail;
  final String mealsArea;
  final String mealsInstruction;
  final String mealsCategory;
  const FavoriteData(
      {required this.id,
      required this.mealsId,
      required this.mealsName,
      required this.mealsThumbnail,
      required this.mealsArea,
      required this.mealsInstruction,
      required this.mealsCategory});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['meals_id'] = Variable<String>(mealsId);
    map['meals_name'] = Variable<String>(mealsName);
    map['meals_thumbnail'] = Variable<String>(mealsThumbnail);
    map['meals_area'] = Variable<String>(mealsArea);
    map['meals_instruction'] = Variable<String>(mealsInstruction);
    map['meals_category'] = Variable<String>(mealsCategory);
    return map;
  }

  FavoriteCompanion toCompanion(bool nullToAbsent) {
    return FavoriteCompanion(
      id: Value(id),
      mealsId: Value(mealsId),
      mealsName: Value(mealsName),
      mealsThumbnail: Value(mealsThumbnail),
      mealsArea: Value(mealsArea),
      mealsInstruction: Value(mealsInstruction),
      mealsCategory: Value(mealsCategory),
    );
  }

  factory FavoriteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteData(
      id: serializer.fromJson<int>(json['id']),
      mealsId: serializer.fromJson<String>(json['mealsId']),
      mealsName: serializer.fromJson<String>(json['mealsName']),
      mealsThumbnail: serializer.fromJson<String>(json['mealsThumbnail']),
      mealsArea: serializer.fromJson<String>(json['mealsArea']),
      mealsInstruction: serializer.fromJson<String>(json['mealsInstruction']),
      mealsCategory: serializer.fromJson<String>(json['mealsCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mealsId': serializer.toJson<String>(mealsId),
      'mealsName': serializer.toJson<String>(mealsName),
      'mealsThumbnail': serializer.toJson<String>(mealsThumbnail),
      'mealsArea': serializer.toJson<String>(mealsArea),
      'mealsInstruction': serializer.toJson<String>(mealsInstruction),
      'mealsCategory': serializer.toJson<String>(mealsCategory),
    };
  }

  FavoriteData copyWith(
          {int? id,
          String? mealsId,
          String? mealsName,
          String? mealsThumbnail,
          String? mealsArea,
          String? mealsInstruction,
          String? mealsCategory}) =>
      FavoriteData(
        id: id ?? this.id,
        mealsId: mealsId ?? this.mealsId,
        mealsName: mealsName ?? this.mealsName,
        mealsThumbnail: mealsThumbnail ?? this.mealsThumbnail,
        mealsArea: mealsArea ?? this.mealsArea,
        mealsInstruction: mealsInstruction ?? this.mealsInstruction,
        mealsCategory: mealsCategory ?? this.mealsCategory,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteData(')
          ..write('id: $id, ')
          ..write('mealsId: $mealsId, ')
          ..write('mealsName: $mealsName, ')
          ..write('mealsThumbnail: $mealsThumbnail, ')
          ..write('mealsArea: $mealsArea, ')
          ..write('mealsInstruction: $mealsInstruction, ')
          ..write('mealsCategory: $mealsCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mealsId, mealsName, mealsThumbnail,
      mealsArea, mealsInstruction, mealsCategory);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteData &&
          other.id == this.id &&
          other.mealsId == this.mealsId &&
          other.mealsName == this.mealsName &&
          other.mealsThumbnail == this.mealsThumbnail &&
          other.mealsArea == this.mealsArea &&
          other.mealsInstruction == this.mealsInstruction &&
          other.mealsCategory == this.mealsCategory);
}

class FavoriteCompanion extends UpdateCompanion<FavoriteData> {
  final Value<int> id;
  final Value<String> mealsId;
  final Value<String> mealsName;
  final Value<String> mealsThumbnail;
  final Value<String> mealsArea;
  final Value<String> mealsInstruction;
  final Value<String> mealsCategory;
  const FavoriteCompanion({
    this.id = const Value.absent(),
    this.mealsId = const Value.absent(),
    this.mealsName = const Value.absent(),
    this.mealsThumbnail = const Value.absent(),
    this.mealsArea = const Value.absent(),
    this.mealsInstruction = const Value.absent(),
    this.mealsCategory = const Value.absent(),
  });
  FavoriteCompanion.insert({
    this.id = const Value.absent(),
    required String mealsId,
    required String mealsName,
    required String mealsThumbnail,
    required String mealsArea,
    required String mealsInstruction,
    required String mealsCategory,
  })  : mealsId = Value(mealsId),
        mealsName = Value(mealsName),
        mealsThumbnail = Value(mealsThumbnail),
        mealsArea = Value(mealsArea),
        mealsInstruction = Value(mealsInstruction),
        mealsCategory = Value(mealsCategory);
  static Insertable<FavoriteData> custom({
    Expression<int>? id,
    Expression<String>? mealsId,
    Expression<String>? mealsName,
    Expression<String>? mealsThumbnail,
    Expression<String>? mealsArea,
    Expression<String>? mealsInstruction,
    Expression<String>? mealsCategory,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mealsId != null) 'meals_id': mealsId,
      if (mealsName != null) 'meals_name': mealsName,
      if (mealsThumbnail != null) 'meals_thumbnail': mealsThumbnail,
      if (mealsArea != null) 'meals_area': mealsArea,
      if (mealsInstruction != null) 'meals_instruction': mealsInstruction,
      if (mealsCategory != null) 'meals_category': mealsCategory,
    });
  }

  FavoriteCompanion copyWith(
      {Value<int>? id,
      Value<String>? mealsId,
      Value<String>? mealsName,
      Value<String>? mealsThumbnail,
      Value<String>? mealsArea,
      Value<String>? mealsInstruction,
      Value<String>? mealsCategory}) {
    return FavoriteCompanion(
      id: id ?? this.id,
      mealsId: mealsId ?? this.mealsId,
      mealsName: mealsName ?? this.mealsName,
      mealsThumbnail: mealsThumbnail ?? this.mealsThumbnail,
      mealsArea: mealsArea ?? this.mealsArea,
      mealsInstruction: mealsInstruction ?? this.mealsInstruction,
      mealsCategory: mealsCategory ?? this.mealsCategory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mealsId.present) {
      map['meals_id'] = Variable<String>(mealsId.value);
    }
    if (mealsName.present) {
      map['meals_name'] = Variable<String>(mealsName.value);
    }
    if (mealsThumbnail.present) {
      map['meals_thumbnail'] = Variable<String>(mealsThumbnail.value);
    }
    if (mealsArea.present) {
      map['meals_area'] = Variable<String>(mealsArea.value);
    }
    if (mealsInstruction.present) {
      map['meals_instruction'] = Variable<String>(mealsInstruction.value);
    }
    if (mealsCategory.present) {
      map['meals_category'] = Variable<String>(mealsCategory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteCompanion(')
          ..write('id: $id, ')
          ..write('mealsId: $mealsId, ')
          ..write('mealsName: $mealsName, ')
          ..write('mealsThumbnail: $mealsThumbnail, ')
          ..write('mealsArea: $mealsArea, ')
          ..write('mealsInstruction: $mealsInstruction, ')
          ..write('mealsCategory: $mealsCategory')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $FavoriteTable favorite = $FavoriteTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favorite];
}
