// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_profile.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDistrictProfileCollection on Isar {
  IsarCollection<DistrictProfile> get districtProfiles => this.collection();
}

const DistrictProfileSchema = CollectionSchema(
  name: r'DistrictProfile',
  id: 6755764631731161869,
  properties: {
    r'avgIncomePerKm': PropertySchema(
      id: 0,
      name: r'avgIncomePerKm',
      type: IsarType.double,
    ),
    r'avgWaitingMinutes': PropertySchema(
      id: 1,
      name: r'avgWaitingMinutes',
      type: IsarType.long,
    ),
    r'chainProbability': PropertySchema(
      id: 2,
      name: r'chainProbability',
      type: IsarType.double,
    ),
    r'districtId': PropertySchema(
      id: 3,
      name: r'districtId',
      type: IsarType.string,
    ),
    r'hasTimeRestriction': PropertySchema(
      id: 4,
      name: r'hasTimeRestriction',
      type: IsarType.bool,
    ),
    r'isVanFriendly': PropertySchema(
      id: 5,
      name: r'isVanFriendly',
      type: IsarType.bool,
    ),
    r'orderCount': PropertySchema(
      id: 6,
      name: r'orderCount',
      type: IsarType.long,
    ),
    r'totalHours': PropertySchema(
      id: 7,
      name: r'totalHours',
      type: IsarType.double,
    ),
    r'totalIncome': PropertySchema(
      id: 8,
      name: r'totalIncome',
      type: IsarType.double,
    ),
    r'totalKm': PropertySchema(
      id: 9,
      name: r'totalKm',
      type: IsarType.double,
    )
  },
  estimateSize: _districtProfileEstimateSize,
  serialize: _districtProfileSerialize,
  deserialize: _districtProfileDeserialize,
  deserializeProp: _districtProfileDeserializeProp,
  idName: r'id',
  indexes: {
    r'districtId': IndexSchema(
      id: 5760119831242892647,
      name: r'districtId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'districtId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _districtProfileGetId,
  getLinks: _districtProfileGetLinks,
  attach: _districtProfileAttach,
  version: '3.1.0+1',
);

int _districtProfileEstimateSize(
  DistrictProfile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.districtId.length * 3;
  return bytesCount;
}

void _districtProfileSerialize(
  DistrictProfile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.avgIncomePerKm);
  writer.writeLong(offsets[1], object.avgWaitingMinutes);
  writer.writeDouble(offsets[2], object.chainProbability);
  writer.writeString(offsets[3], object.districtId);
  writer.writeBool(offsets[4], object.hasTimeRestriction);
  writer.writeBool(offsets[5], object.isVanFriendly);
  writer.writeLong(offsets[6], object.orderCount);
  writer.writeDouble(offsets[7], object.totalHours);
  writer.writeDouble(offsets[8], object.totalIncome);
  writer.writeDouble(offsets[9], object.totalKm);
}

DistrictProfile _districtProfileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DistrictProfile();
  object.avgIncomePerKm = reader.readDouble(offsets[0]);
  object.avgWaitingMinutes = reader.readLong(offsets[1]);
  object.chainProbability = reader.readDouble(offsets[2]);
  object.districtId = reader.readString(offsets[3]);
  object.hasTimeRestriction = reader.readBool(offsets[4]);
  object.id = id;
  object.isVanFriendly = reader.readBool(offsets[5]);
  object.orderCount = reader.readLong(offsets[6]);
  object.totalHours = reader.readDouble(offsets[7]);
  object.totalIncome = reader.readDouble(offsets[8]);
  object.totalKm = reader.readDouble(offsets[9]);
  return object;
}

P _districtProfileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _districtProfileGetId(DistrictProfile object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _districtProfileGetLinks(DistrictProfile object) {
  return [];
}

void _districtProfileAttach(
    IsarCollection<dynamic> col, Id id, DistrictProfile object) {
  object.id = id;
}

extension DistrictProfileByIndex on IsarCollection<DistrictProfile> {
  Future<DistrictProfile?> getByDistrictId(String districtId) {
    return getByIndex(r'districtId', [districtId]);
  }

  DistrictProfile? getByDistrictIdSync(String districtId) {
    return getByIndexSync(r'districtId', [districtId]);
  }

  Future<bool> deleteByDistrictId(String districtId) {
    return deleteByIndex(r'districtId', [districtId]);
  }

  bool deleteByDistrictIdSync(String districtId) {
    return deleteByIndexSync(r'districtId', [districtId]);
  }

  Future<List<DistrictProfile?>> getAllByDistrictId(
      List<String> districtIdValues) {
    final values = districtIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'districtId', values);
  }

  List<DistrictProfile?> getAllByDistrictIdSync(List<String> districtIdValues) {
    final values = districtIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'districtId', values);
  }

  Future<int> deleteAllByDistrictId(List<String> districtIdValues) {
    final values = districtIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'districtId', values);
  }

  int deleteAllByDistrictIdSync(List<String> districtIdValues) {
    final values = districtIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'districtId', values);
  }

  Future<Id> putByDistrictId(DistrictProfile object) {
    return putByIndex(r'districtId', object);
  }

  Id putByDistrictIdSync(DistrictProfile object, {bool saveLinks = true}) {
    return putByIndexSync(r'districtId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDistrictId(List<DistrictProfile> objects) {
    return putAllByIndex(r'districtId', objects);
  }

  List<Id> putAllByDistrictIdSync(List<DistrictProfile> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'districtId', objects, saveLinks: saveLinks);
  }
}

extension DistrictProfileQueryWhereSort
    on QueryBuilder<DistrictProfile, DistrictProfile, QWhere> {
  QueryBuilder<DistrictProfile, DistrictProfile, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DistrictProfileQueryWhere
    on QueryBuilder<DistrictProfile, DistrictProfile, QWhereClause> {
  QueryBuilder<DistrictProfile, DistrictProfile, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterWhereClause>
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

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterWhereClause> idBetween(
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

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterWhereClause>
      districtIdEqualTo(String districtId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'districtId',
        value: [districtId],
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterWhereClause>
      districtIdNotEqualTo(String districtId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'districtId',
              lower: [],
              upper: [districtId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'districtId',
              lower: [districtId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'districtId',
              lower: [districtId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'districtId',
              lower: [],
              upper: [districtId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension DistrictProfileQueryFilter
    on QueryBuilder<DistrictProfile, DistrictProfile, QFilterCondition> {
  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      avgIncomePerKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avgIncomePerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      avgIncomePerKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avgIncomePerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      avgIncomePerKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avgIncomePerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      avgIncomePerKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avgIncomePerKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      avgWaitingMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avgWaitingMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      avgWaitingMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avgWaitingMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      avgWaitingMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avgWaitingMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      avgWaitingMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avgWaitingMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      chainProbabilityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chainProbability',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      chainProbabilityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chainProbability',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      chainProbabilityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chainProbability',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      chainProbabilityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chainProbability',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      districtIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'districtId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      districtIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'districtId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      districtIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'districtId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      districtIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'districtId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      districtIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'districtId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      districtIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'districtId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      districtIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'districtId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      districtIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'districtId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      districtIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'districtId',
        value: '',
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      districtIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'districtId',
        value: '',
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      hasTimeRestrictionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasTimeRestriction',
        value: value,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
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

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
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

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
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

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      isVanFriendlyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isVanFriendly',
        value: value,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      orderCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      orderCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      orderCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      orderCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      totalHoursEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      totalHoursGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      totalHoursLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      totalHoursBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      totalIncomeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalIncome',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      totalIncomeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalIncome',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      totalIncomeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalIncome',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      totalIncomeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalIncome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      totalKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      totalKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      totalKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterFilterCondition>
      totalKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension DistrictProfileQueryObject
    on QueryBuilder<DistrictProfile, DistrictProfile, QFilterCondition> {}

extension DistrictProfileQueryLinks
    on QueryBuilder<DistrictProfile, DistrictProfile, QFilterCondition> {}

extension DistrictProfileQuerySortBy
    on QueryBuilder<DistrictProfile, DistrictProfile, QSortBy> {
  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByAvgIncomePerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgIncomePerKm', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByAvgIncomePerKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgIncomePerKm', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByAvgWaitingMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgWaitingMinutes', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByAvgWaitingMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgWaitingMinutes', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByChainProbability() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainProbability', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByChainProbabilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainProbability', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByDistrictId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'districtId', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByDistrictIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'districtId', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByHasTimeRestriction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTimeRestriction', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByHasTimeRestrictionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTimeRestriction', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByIsVanFriendly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVanFriendly', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByIsVanFriendlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVanFriendly', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByOrderCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCount', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByOrderCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCount', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByTotalHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHours', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByTotalHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHours', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByTotalIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIncome', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByTotalIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIncome', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy> sortByTotalKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKm', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      sortByTotalKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKm', Sort.desc);
    });
  }
}

extension DistrictProfileQuerySortThenBy
    on QueryBuilder<DistrictProfile, DistrictProfile, QSortThenBy> {
  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByAvgIncomePerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgIncomePerKm', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByAvgIncomePerKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgIncomePerKm', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByAvgWaitingMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgWaitingMinutes', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByAvgWaitingMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avgWaitingMinutes', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByChainProbability() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainProbability', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByChainProbabilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainProbability', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByDistrictId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'districtId', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByDistrictIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'districtId', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByHasTimeRestriction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTimeRestriction', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByHasTimeRestrictionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTimeRestriction', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByIsVanFriendly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVanFriendly', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByIsVanFriendlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVanFriendly', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByOrderCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCount', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByOrderCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCount', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByTotalHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHours', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByTotalHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHours', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByTotalIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIncome', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByTotalIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIncome', Sort.desc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy> thenByTotalKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKm', Sort.asc);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QAfterSortBy>
      thenByTotalKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKm', Sort.desc);
    });
  }
}

extension DistrictProfileQueryWhereDistinct
    on QueryBuilder<DistrictProfile, DistrictProfile, QDistinct> {
  QueryBuilder<DistrictProfile, DistrictProfile, QDistinct>
      distinctByAvgIncomePerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avgIncomePerKm');
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QDistinct>
      distinctByAvgWaitingMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avgWaitingMinutes');
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QDistinct>
      distinctByChainProbability() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chainProbability');
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QDistinct>
      distinctByDistrictId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'districtId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QDistinct>
      distinctByHasTimeRestriction() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasTimeRestriction');
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QDistinct>
      distinctByIsVanFriendly() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isVanFriendly');
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QDistinct>
      distinctByOrderCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderCount');
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QDistinct>
      distinctByTotalHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalHours');
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QDistinct>
      distinctByTotalIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalIncome');
    });
  }

  QueryBuilder<DistrictProfile, DistrictProfile, QDistinct>
      distinctByTotalKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalKm');
    });
  }
}

extension DistrictProfileQueryProperty
    on QueryBuilder<DistrictProfile, DistrictProfile, QQueryProperty> {
  QueryBuilder<DistrictProfile, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DistrictProfile, double, QQueryOperations>
      avgIncomePerKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avgIncomePerKm');
    });
  }

  QueryBuilder<DistrictProfile, int, QQueryOperations>
      avgWaitingMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avgWaitingMinutes');
    });
  }

  QueryBuilder<DistrictProfile, double, QQueryOperations>
      chainProbabilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chainProbability');
    });
  }

  QueryBuilder<DistrictProfile, String, QQueryOperations> districtIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'districtId');
    });
  }

  QueryBuilder<DistrictProfile, bool, QQueryOperations>
      hasTimeRestrictionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasTimeRestriction');
    });
  }

  QueryBuilder<DistrictProfile, bool, QQueryOperations>
      isVanFriendlyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isVanFriendly');
    });
  }

  QueryBuilder<DistrictProfile, int, QQueryOperations> orderCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderCount');
    });
  }

  QueryBuilder<DistrictProfile, double, QQueryOperations> totalHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalHours');
    });
  }

  QueryBuilder<DistrictProfile, double, QQueryOperations>
      totalIncomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalIncome');
    });
  }

  QueryBuilder<DistrictProfile, double, QQueryOperations> totalKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalKm');
    });
  }
}
