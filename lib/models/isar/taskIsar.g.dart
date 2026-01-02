// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskIsar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskIsarCollection on Isar {
  IsarCollection<TaskIsar> get taskIsars => this.collection();
}

const TaskIsarSchema = CollectionSchema(
  name: r'TaskIsar',
  id: 656882633111093395,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dayOfMonth': PropertySchema(
      id: 1,
      name: r'dayOfMonth',
      type: IsarType.long,
    ),
    r'dayOfWeek': PropertySchema(
      id: 2,
      name: r'dayOfWeek',
      type: IsarType.long,
    ),
    r'descriptionAr': PropertySchema(
      id: 3,
      name: r'descriptionAr',
      type: IsarType.string,
    ),
    r'descriptionEn': PropertySchema(
      id: 4,
      name: r'descriptionEn',
      type: IsarType.string,
    ),
    r'descriptionUr': PropertySchema(
      id: 5,
      name: r'descriptionUr',
      type: IsarType.string,
    ),
    r'endTime': PropertySchema(
      id: 6,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'frequencyId': PropertySchema(
      id: 7,
      name: r'frequencyId',
      type: IsarType.long,
    ),
    r'hour': PropertySchema(
      id: 8,
      name: r'hour',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 9,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isSynced': PropertySchema(
      id: 10,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'minute': PropertySchema(
      id: 11,
      name: r'minute',
      type: IsarType.long,
    ),
    r'startTime': PropertySchema(
      id: 12,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'titleAr': PropertySchema(
      id: 13,
      name: r'titleAr',
      type: IsarType.string,
    ),
    r'titleEn': PropertySchema(
      id: 14,
      name: r'titleEn',
      type: IsarType.string,
    ),
    r'titleUr': PropertySchema(
      id: 15,
      name: r'titleUr',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 16,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 17,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _taskIsarEstimateSize,
  serialize: _taskIsarSerialize,
  deserialize: _taskIsarDeserialize,
  deserializeProp: _taskIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _taskIsarGetId,
  getLinks: _taskIsarGetLinks,
  attach: _taskIsarAttach,
  version: '3.1.0+1',
);

int _taskIsarEstimateSize(
  TaskIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.descriptionAr.length * 3;
  bytesCount += 3 + object.descriptionEn.length * 3;
  bytesCount += 3 + object.descriptionUr.length * 3;
  bytesCount += 3 + object.titleAr.length * 3;
  bytesCount += 3 + object.titleEn.length * 3;
  bytesCount += 3 + object.titleUr.length * 3;
  return bytesCount;
}

void _taskIsarSerialize(
  TaskIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.dayOfMonth);
  writer.writeLong(offsets[2], object.dayOfWeek);
  writer.writeString(offsets[3], object.descriptionAr);
  writer.writeString(offsets[4], object.descriptionEn);
  writer.writeString(offsets[5], object.descriptionUr);
  writer.writeDateTime(offsets[6], object.endTime);
  writer.writeLong(offsets[7], object.frequencyId);
  writer.writeLong(offsets[8], object.hour);
  writer.writeBool(offsets[9], object.isActive);
  writer.writeBool(offsets[10], object.isSynced);
  writer.writeLong(offsets[11], object.minute);
  writer.writeDateTime(offsets[12], object.startTime);
  writer.writeString(offsets[13], object.titleAr);
  writer.writeString(offsets[14], object.titleEn);
  writer.writeString(offsets[15], object.titleUr);
  writer.writeDateTime(offsets[16], object.updatedAt);
  writer.writeLong(offsets[17], object.userId);
}

TaskIsar _taskIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaskIsar();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.dayOfMonth = reader.readLongOrNull(offsets[1]);
  object.dayOfWeek = reader.readLongOrNull(offsets[2]);
  object.descriptionAr = reader.readString(offsets[3]);
  object.descriptionEn = reader.readString(offsets[4]);
  object.descriptionUr = reader.readString(offsets[5]);
  object.endTime = reader.readDateTime(offsets[6]);
  object.frequencyId = reader.readLong(offsets[7]);
  object.hour = reader.readLong(offsets[8]);
  object.id = id;
  object.isActive = reader.readBool(offsets[9]);
  object.isSynced = reader.readBool(offsets[10]);
  object.minute = reader.readLong(offsets[11]);
  object.startTime = reader.readDateTime(offsets[12]);
  object.titleAr = reader.readString(offsets[13]);
  object.titleEn = reader.readString(offsets[14]);
  object.titleUr = reader.readString(offsets[15]);
  object.updatedAt = reader.readDateTime(offsets[16]);
  object.userId = reader.readLong(offsets[17]);
  return object;
}

P _taskIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDateTime(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taskIsarGetId(TaskIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskIsarGetLinks(TaskIsar object) {
  return [];
}

void _taskIsarAttach(IsarCollection<dynamic> col, Id id, TaskIsar object) {
  object.id = id;
}

extension TaskIsarQueryWhereSort on QueryBuilder<TaskIsar, TaskIsar, QWhere> {
  QueryBuilder<TaskIsar, TaskIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaskIsarQueryWhere on QueryBuilder<TaskIsar, TaskIsar, QWhereClause> {
  QueryBuilder<TaskIsar, TaskIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskIsarQueryFilter
    on QueryBuilder<TaskIsar, TaskIsar, QFilterCondition> {
  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> dayOfMonthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dayOfMonth',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      dayOfMonthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dayOfMonth',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> dayOfMonthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> dayOfMonthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> dayOfMonthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> dayOfMonthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayOfMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> dayOfWeekIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dayOfWeek',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> dayOfWeekIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dayOfWeek',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> dayOfWeekEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dayOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> dayOfWeekGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dayOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> dayOfWeekLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dayOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> dayOfWeekBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dayOfWeek',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionArEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptionAr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      descriptionArGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descriptionAr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionArLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descriptionAr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionArBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descriptionAr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      descriptionArStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descriptionAr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionArEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descriptionAr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionArContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descriptionAr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionArMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descriptionAr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      descriptionArIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptionAr',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      descriptionArIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descriptionAr',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionEnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      descriptionEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descriptionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descriptionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descriptionEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      descriptionEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descriptionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descriptionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionEnContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descriptionEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionEnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descriptionEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      descriptionEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptionEn',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      descriptionEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descriptionEn',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionUrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptionUr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      descriptionUrGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descriptionUr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionUrLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descriptionUr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionUrBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descriptionUr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      descriptionUrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descriptionUr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionUrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descriptionUr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionUrContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descriptionUr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> descriptionUrMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descriptionUr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      descriptionUrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descriptionUr',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      descriptionUrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descriptionUr',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> endTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> endTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> endTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> endTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> frequencyIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frequencyId',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition>
      frequencyIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frequencyId',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> frequencyIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frequencyId',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> frequencyIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frequencyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> hourEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hour',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> hourGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hour',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> hourLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hour',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> hourBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> isActiveEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> minuteEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minute',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> minuteGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minute',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> minuteLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minute',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> minuteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> startTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleArEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleAr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleArGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titleAr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleArLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titleAr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleArBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titleAr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleArStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titleAr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleArEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titleAr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleArContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titleAr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleArMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titleAr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleArIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleAr',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleArIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titleAr',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleEnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titleEn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleEnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleEnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleEnContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titleEn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleEnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titleEn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleEn',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titleEn',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleUrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleUr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleUrGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titleUr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleUrLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titleUr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleUrBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titleUr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleUrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titleUr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleUrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titleUr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleUrContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titleUr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleUrMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titleUr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleUrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleUr',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> titleUrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titleUr',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> userIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterFilterCondition> userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskIsarQueryObject
    on QueryBuilder<TaskIsar, TaskIsar, QFilterCondition> {}

extension TaskIsarQueryLinks
    on QueryBuilder<TaskIsar, TaskIsar, QFilterCondition> {}

extension TaskIsarQuerySortBy on QueryBuilder<TaskIsar, TaskIsar, QSortBy> {
  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfMonth', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByDayOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfMonth', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByDescriptionAr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionAr', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByDescriptionArDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionAr', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByDescriptionEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionEn', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByDescriptionEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionEn', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByDescriptionUr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionUr', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByDescriptionUrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionUr', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByFrequencyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyId', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByFrequencyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyId', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minute', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minute', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByTitleAr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleAr', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByTitleArDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleAr', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByTitleEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByTitleEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByTitleUr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleUr', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByTitleUrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleUr', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension TaskIsarQuerySortThenBy
    on QueryBuilder<TaskIsar, TaskIsar, QSortThenBy> {
  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfMonth', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByDayOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfMonth', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByDescriptionAr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionAr', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByDescriptionArDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionAr', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByDescriptionEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionEn', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByDescriptionEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionEn', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByDescriptionUr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionUr', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByDescriptionUrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionUr', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByFrequencyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyId', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByFrequencyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyId', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hour', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minute', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minute', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByTitleAr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleAr', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByTitleArDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleAr', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByTitleEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByTitleEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByTitleUr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleUr', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByTitleUrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleUr', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension TaskIsarQueryWhereDistinct
    on QueryBuilder<TaskIsar, TaskIsar, QDistinct> {
  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayOfMonth');
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dayOfWeek');
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByDescriptionAr(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descriptionAr',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByDescriptionEn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descriptionEn',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByDescriptionUr(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descriptionUr',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByFrequencyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frequencyId');
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hour');
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minute');
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByTitleAr(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleAr', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByTitleEn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleEn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByTitleUr(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleUr', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TaskIsar, TaskIsar, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension TaskIsarQueryProperty
    on QueryBuilder<TaskIsar, TaskIsar, QQueryProperty> {
  QueryBuilder<TaskIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaskIsar, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TaskIsar, int?, QQueryOperations> dayOfMonthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayOfMonth');
    });
  }

  QueryBuilder<TaskIsar, int?, QQueryOperations> dayOfWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dayOfWeek');
    });
  }

  QueryBuilder<TaskIsar, String, QQueryOperations> descriptionArProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptionAr');
    });
  }

  QueryBuilder<TaskIsar, String, QQueryOperations> descriptionEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptionEn');
    });
  }

  QueryBuilder<TaskIsar, String, QQueryOperations> descriptionUrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptionUr');
    });
  }

  QueryBuilder<TaskIsar, DateTime, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<TaskIsar, int, QQueryOperations> frequencyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frequencyId');
    });
  }

  QueryBuilder<TaskIsar, int, QQueryOperations> hourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hour');
    });
  }

  QueryBuilder<TaskIsar, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<TaskIsar, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<TaskIsar, int, QQueryOperations> minuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minute');
    });
  }

  QueryBuilder<TaskIsar, DateTime, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<TaskIsar, String, QQueryOperations> titleArProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleAr');
    });
  }

  QueryBuilder<TaskIsar, String, QQueryOperations> titleEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleEn');
    });
  }

  QueryBuilder<TaskIsar, String, QQueryOperations> titleUrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleUr');
    });
  }

  QueryBuilder<TaskIsar, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TaskIsar, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
