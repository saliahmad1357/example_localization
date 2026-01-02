// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frequencyTotalIsar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFrequencyTotalIsarCollection on Isar {
  IsarCollection<FrequencyTotalIsar> get frequencyTotalIsars =>
      this.collection();
}

const FrequencyTotalIsarSchema = CollectionSchema(
  name: r'FrequencyTotalIsar',
  id: -8864225128720537794,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'frequencyId': PropertySchema(
      id: 2,
      name: r'frequencyId',
      type: IsarType.long,
    ),
    r'frequencyName': PropertySchema(
      id: 3,
      name: r'frequencyName',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 4,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'maxPossibleScore': PropertySchema(
      id: 5,
      name: r'maxPossibleScore',
      type: IsarType.long,
    ),
    r'percentage': PropertySchema(
      id: 6,
      name: r'percentage',
      type: IsarType.double,
    ),
    r'periodLabel': PropertySchema(
      id: 7,
      name: r'periodLabel',
      type: IsarType.string,
    ),
    r'totalScore': PropertySchema(
      id: 8,
      name: r'totalScore',
      type: IsarType.long,
    ),
    r'totalTasks': PropertySchema(
      id: 9,
      name: r'totalTasks',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 11,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _frequencyTotalIsarEstimateSize,
  serialize: _frequencyTotalIsarSerialize,
  deserialize: _frequencyTotalIsarDeserialize,
  deserializeProp: _frequencyTotalIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _frequencyTotalIsarGetId,
  getLinks: _frequencyTotalIsarGetLinks,
  attach: _frequencyTotalIsarAttach,
  version: '3.1.0+1',
);

int _frequencyTotalIsarEstimateSize(
  FrequencyTotalIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.frequencyName.length * 3;
  bytesCount += 3 + object.periodLabel.length * 3;
  return bytesCount;
}

void _frequencyTotalIsarSerialize(
  FrequencyTotalIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeLong(offsets[2], object.frequencyId);
  writer.writeString(offsets[3], object.frequencyName);
  writer.writeBool(offsets[4], object.isSynced);
  writer.writeLong(offsets[5], object.maxPossibleScore);
  writer.writeDouble(offsets[6], object.percentage);
  writer.writeString(offsets[7], object.periodLabel);
  writer.writeLong(offsets[8], object.totalScore);
  writer.writeLong(offsets[9], object.totalTasks);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeLong(offsets[11], object.userId);
}

FrequencyTotalIsar _frequencyTotalIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FrequencyTotalIsar();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.frequencyId = reader.readLong(offsets[2]);
  object.frequencyName = reader.readString(offsets[3]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[4]);
  object.maxPossibleScore = reader.readLong(offsets[5]);
  object.percentage = reader.readDouble(offsets[6]);
  object.periodLabel = reader.readString(offsets[7]);
  object.totalScore = reader.readLong(offsets[8]);
  object.totalTasks = reader.readLong(offsets[9]);
  object.updatedAt = reader.readDateTime(offsets[10]);
  object.userId = reader.readLong(offsets[11]);
  return object;
}

P _frequencyTotalIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _frequencyTotalIsarGetId(FrequencyTotalIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _frequencyTotalIsarGetLinks(
    FrequencyTotalIsar object) {
  return [];
}

void _frequencyTotalIsarAttach(
    IsarCollection<dynamic> col, Id id, FrequencyTotalIsar object) {
  object.id = id;
}

extension FrequencyTotalIsarQueryWhereSort
    on QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QWhere> {
  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FrequencyTotalIsarQueryWhere
    on QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QWhereClause> {
  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterWhereClause>
      idBetween(
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

extension FrequencyTotalIsarQueryFilter
    on QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QFilterCondition> {
  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      createdAtGreaterThan(
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      createdAtLessThan(
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      createdAtBetween(
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      frequencyIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frequencyId',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      frequencyIdLessThan(
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      frequencyIdBetween(
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      frequencyNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frequencyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      frequencyNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frequencyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      frequencyNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frequencyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      frequencyNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frequencyName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      frequencyNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frequencyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      frequencyNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frequencyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      frequencyNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frequencyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      frequencyNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frequencyName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      frequencyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frequencyName',
        value: '',
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      frequencyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frequencyName',
        value: '',
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      maxPossibleScoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxPossibleScore',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      maxPossibleScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxPossibleScore',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      maxPossibleScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxPossibleScore',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      maxPossibleScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxPossibleScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      percentageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'percentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      percentageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'percentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      percentageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'percentage',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      percentageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'percentage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      periodLabelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'periodLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      periodLabelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'periodLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      periodLabelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'periodLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      periodLabelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'periodLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      periodLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'periodLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      periodLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'periodLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      periodLabelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'periodLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      periodLabelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'periodLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      periodLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'periodLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      periodLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'periodLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      totalScoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalScore',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      totalScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalScore',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      totalScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalScore',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      totalScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      totalTasksEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalTasks',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      totalTasksGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalTasks',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      totalTasksLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalTasks',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      totalTasksBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalTasks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      updatedAtGreaterThan(
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      updatedAtLessThan(
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      updatedAtBetween(
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      userIdGreaterThan(
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      userIdLessThan(
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

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterFilterCondition>
      userIdBetween(
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

extension FrequencyTotalIsarQueryObject
    on QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QFilterCondition> {}

extension FrequencyTotalIsarQueryLinks
    on QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QFilterCondition> {}

extension FrequencyTotalIsarQuerySortBy
    on QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QSortBy> {
  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByFrequencyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyId', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByFrequencyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyId', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByFrequencyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyName', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByFrequencyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyName', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByMaxPossibleScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxPossibleScore', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByMaxPossibleScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxPossibleScore', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'percentage', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'percentage', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByPeriodLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodLabel', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByPeriodLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodLabel', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByTotalScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScore', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByTotalScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScore', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByTotalTasks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTasks', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByTotalTasksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTasks', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension FrequencyTotalIsarQuerySortThenBy
    on QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QSortThenBy> {
  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByFrequencyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyId', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByFrequencyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyId', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByFrequencyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyName', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByFrequencyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frequencyName', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByMaxPossibleScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxPossibleScore', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByMaxPossibleScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxPossibleScore', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'percentage', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByPercentageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'percentage', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByPeriodLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodLabel', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByPeriodLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'periodLabel', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByTotalScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScore', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByTotalScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScore', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByTotalTasks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTasks', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByTotalTasksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTasks', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension FrequencyTotalIsarQueryWhereDistinct
    on QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QDistinct> {
  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QDistinct>
      distinctByFrequencyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frequencyId');
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QDistinct>
      distinctByFrequencyName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frequencyName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QDistinct>
      distinctByMaxPossibleScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxPossibleScore');
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QDistinct>
      distinctByPercentage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'percentage');
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QDistinct>
      distinctByPeriodLabel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'periodLabel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QDistinct>
      distinctByTotalScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalScore');
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QDistinct>
      distinctByTotalTasks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTasks');
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension FrequencyTotalIsarQueryProperty
    on QueryBuilder<FrequencyTotalIsar, FrequencyTotalIsar, QQueryProperty> {
  QueryBuilder<FrequencyTotalIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FrequencyTotalIsar, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<FrequencyTotalIsar, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<FrequencyTotalIsar, int, QQueryOperations>
      frequencyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frequencyId');
    });
  }

  QueryBuilder<FrequencyTotalIsar, String, QQueryOperations>
      frequencyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frequencyName');
    });
  }

  QueryBuilder<FrequencyTotalIsar, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<FrequencyTotalIsar, int, QQueryOperations>
      maxPossibleScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxPossibleScore');
    });
  }

  QueryBuilder<FrequencyTotalIsar, double, QQueryOperations>
      percentageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'percentage');
    });
  }

  QueryBuilder<FrequencyTotalIsar, String, QQueryOperations>
      periodLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'periodLabel');
    });
  }

  QueryBuilder<FrequencyTotalIsar, int, QQueryOperations> totalScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalScore');
    });
  }

  QueryBuilder<FrequencyTotalIsar, int, QQueryOperations> totalTasksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTasks');
    });
  }

  QueryBuilder<FrequencyTotalIsar, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<FrequencyTotalIsar, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
