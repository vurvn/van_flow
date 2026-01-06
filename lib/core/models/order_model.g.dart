// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOrderModelCollection on Isar {
  IsarCollection<OrderModel> get orderModels => this.collection();
}

const OrderModelSchema = CollectionSchema(
  name: r'OrderModel',
  id: 3315151259962091397,
  properties: {
    r'distance': PropertySchema(
      id: 0,
      name: r'distance',
      type: IsarType.double,
    ),
    r'durationHours': PropertySchema(
      id: 1,
      name: r'durationHours',
      type: IsarType.double,
    ),
    r'isCompleted': PropertySchema(
      id: 2,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'netProfit': PropertySchema(
      id: 3,
      name: r'netProfit',
      type: IsarType.double,
    ),
    r'platform': PropertySchema(
      id: 4,
      name: r'platform',
      type: IsarType.string,
    ),
    r'revenue': PropertySchema(
      id: 5,
      name: r'revenue',
      type: IsarType.double,
    ),
    r'startDistrictId': PropertySchema(
      id: 6,
      name: r'startDistrictId',
      type: IsarType.string,
    ),
    r'startDistrictName': PropertySchema(
      id: 7,
      name: r'startDistrictName',
      type: IsarType.string,
    ),
    r'targetDistrictId': PropertySchema(
      id: 8,
      name: r'targetDistrictId',
      type: IsarType.string,
    ),
    r'targetDistrictName': PropertySchema(
      id: 9,
      name: r'targetDistrictName',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 10,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'wasChained': PropertySchema(
      id: 11,
      name: r'wasChained',
      type: IsarType.bool,
    )
  },
  estimateSize: _orderModelEstimateSize,
  serialize: _orderModelSerialize,
  deserialize: _orderModelDeserialize,
  deserializeProp: _orderModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _orderModelGetId,
  getLinks: _orderModelGetLinks,
  attach: _orderModelAttach,
  version: '3.1.0+1',
);

int _orderModelEstimateSize(
  OrderModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.platform.length * 3;
  {
    final value = object.startDistrictId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.startDistrictName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.targetDistrictId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.targetDistrictName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _orderModelSerialize(
  OrderModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.distance);
  writer.writeDouble(offsets[1], object.durationHours);
  writer.writeBool(offsets[2], object.isCompleted);
  writer.writeDouble(offsets[3], object.netProfit);
  writer.writeString(offsets[4], object.platform);
  writer.writeDouble(offsets[5], object.revenue);
  writer.writeString(offsets[6], object.startDistrictId);
  writer.writeString(offsets[7], object.startDistrictName);
  writer.writeString(offsets[8], object.targetDistrictId);
  writer.writeString(offsets[9], object.targetDistrictName);
  writer.writeDateTime(offsets[10], object.timestamp);
  writer.writeBool(offsets[11], object.wasChained);
}

OrderModel _orderModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OrderModel();
  object.distance = reader.readDouble(offsets[0]);
  object.durationHours = reader.readDoubleOrNull(offsets[1]);
  object.id = id;
  object.isCompleted = reader.readBool(offsets[2]);
  object.netProfit = reader.readDouble(offsets[3]);
  object.platform = reader.readString(offsets[4]);
  object.revenue = reader.readDouble(offsets[5]);
  object.startDistrictId = reader.readStringOrNull(offsets[6]);
  object.startDistrictName = reader.readStringOrNull(offsets[7]);
  object.targetDistrictId = reader.readStringOrNull(offsets[8]);
  object.targetDistrictName = reader.readStringOrNull(offsets[9]);
  object.timestamp = reader.readDateTime(offsets[10]);
  object.wasChained = reader.readBoolOrNull(offsets[11]);
  return object;
}

P _orderModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _orderModelGetId(OrderModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _orderModelGetLinks(OrderModel object) {
  return [];
}

void _orderModelAttach(IsarCollection<dynamic> col, Id id, OrderModel object) {
  object.id = id;
}

extension OrderModelQueryWhereSort
    on QueryBuilder<OrderModel, OrderModel, QWhere> {
  QueryBuilder<OrderModel, OrderModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OrderModelQueryWhere
    on QueryBuilder<OrderModel, OrderModel, QWhereClause> {
  QueryBuilder<OrderModel, OrderModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<OrderModel, OrderModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterWhereClause> idBetween(
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

extension OrderModelQueryFilter
    on QueryBuilder<OrderModel, OrderModel, QFilterCondition> {
  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> distanceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'distance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      distanceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'distance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> distanceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'distance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> distanceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'distance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      durationHoursIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'durationHours',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      durationHoursIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'durationHours',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      durationHoursEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      durationHoursGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      durationHoursLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      durationHoursBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> netProfitEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'netProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      netProfitGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'netProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> netProfitLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'netProfit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> netProfitBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'netProfit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> platformEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'platform',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      platformGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'platform',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> platformLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'platform',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> platformBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'platform',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      platformStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'platform',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> platformEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'platform',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> platformContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'platform',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> platformMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'platform',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      platformIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'platform',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      platformIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'platform',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> revenueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      revenueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> revenueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> revenueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revenue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDistrictId',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDistrictId',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDistrictId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDistrictId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDistrictId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDistrictId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'startDistrictId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'startDistrictId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'startDistrictId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'startDistrictId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDistrictId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'startDistrictId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDistrictName',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDistrictName',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDistrictName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDistrictName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDistrictName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDistrictName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'startDistrictName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'startDistrictName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'startDistrictName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'startDistrictName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDistrictName',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      startDistrictNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'startDistrictName',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'targetDistrictId',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'targetDistrictId',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetDistrictId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetDistrictId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetDistrictId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetDistrictId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'targetDistrictId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'targetDistrictId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'targetDistrictId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'targetDistrictId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetDistrictId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'targetDistrictId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'targetDistrictName',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'targetDistrictName',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetDistrictName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetDistrictName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetDistrictName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetDistrictName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'targetDistrictName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'targetDistrictName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'targetDistrictName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'targetDistrictName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetDistrictName',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      targetDistrictNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'targetDistrictName',
        value: '',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> timestampEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      wasChainedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wasChained',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition>
      wasChainedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wasChained',
      ));
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterFilterCondition> wasChainedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasChained',
        value: value,
      ));
    });
  }
}

extension OrderModelQueryObject
    on QueryBuilder<OrderModel, OrderModel, QFilterCondition> {}

extension OrderModelQueryLinks
    on QueryBuilder<OrderModel, OrderModel, QFilterCondition> {}

extension OrderModelQuerySortBy
    on QueryBuilder<OrderModel, OrderModel, QSortBy> {
  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distance', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distance', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByDurationHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationHours', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByDurationHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationHours', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByNetProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netProfit', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByNetProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netProfit', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByPlatform() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platform', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByPlatformDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platform', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenue', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenue', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByStartDistrictId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDistrictId', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy>
      sortByStartDistrictIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDistrictId', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByStartDistrictName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDistrictName', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy>
      sortByStartDistrictNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDistrictName', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByTargetDistrictId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetDistrictId', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy>
      sortByTargetDistrictIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetDistrictId', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy>
      sortByTargetDistrictName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetDistrictName', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy>
      sortByTargetDistrictNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetDistrictName', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByWasChained() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasChained', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> sortByWasChainedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasChained', Sort.desc);
    });
  }
}

extension OrderModelQuerySortThenBy
    on QueryBuilder<OrderModel, OrderModel, QSortThenBy> {
  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distance', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByDistanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distance', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByDurationHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationHours', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByDurationHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationHours', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByNetProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netProfit', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByNetProfitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netProfit', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByPlatform() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platform', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByPlatformDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platform', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenue', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenue', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByStartDistrictId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDistrictId', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy>
      thenByStartDistrictIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDistrictId', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByStartDistrictName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDistrictName', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy>
      thenByStartDistrictNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDistrictName', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByTargetDistrictId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetDistrictId', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy>
      thenByTargetDistrictIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetDistrictId', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy>
      thenByTargetDistrictName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetDistrictName', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy>
      thenByTargetDistrictNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetDistrictName', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByWasChained() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasChained', Sort.asc);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QAfterSortBy> thenByWasChainedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasChained', Sort.desc);
    });
  }
}

extension OrderModelQueryWhereDistinct
    on QueryBuilder<OrderModel, OrderModel, QDistinct> {
  QueryBuilder<OrderModel, OrderModel, QDistinct> distinctByDistance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distance');
    });
  }

  QueryBuilder<OrderModel, OrderModel, QDistinct> distinctByDurationHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationHours');
    });
  }

  QueryBuilder<OrderModel, OrderModel, QDistinct> distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<OrderModel, OrderModel, QDistinct> distinctByNetProfit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netProfit');
    });
  }

  QueryBuilder<OrderModel, OrderModel, QDistinct> distinctByPlatform(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'platform', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QDistinct> distinctByRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenue');
    });
  }

  QueryBuilder<OrderModel, OrderModel, QDistinct> distinctByStartDistrictId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDistrictId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QDistinct> distinctByStartDistrictName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDistrictName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QDistinct> distinctByTargetDistrictId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetDistrictId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QDistinct> distinctByTargetDistrictName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetDistrictName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderModel, OrderModel, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<OrderModel, OrderModel, QDistinct> distinctByWasChained() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasChained');
    });
  }
}

extension OrderModelQueryProperty
    on QueryBuilder<OrderModel, OrderModel, QQueryProperty> {
  QueryBuilder<OrderModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OrderModel, double, QQueryOperations> distanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distance');
    });
  }

  QueryBuilder<OrderModel, double?, QQueryOperations> durationHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationHours');
    });
  }

  QueryBuilder<OrderModel, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<OrderModel, double, QQueryOperations> netProfitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netProfit');
    });
  }

  QueryBuilder<OrderModel, String, QQueryOperations> platformProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'platform');
    });
  }

  QueryBuilder<OrderModel, double, QQueryOperations> revenueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenue');
    });
  }

  QueryBuilder<OrderModel, String?, QQueryOperations>
      startDistrictIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDistrictId');
    });
  }

  QueryBuilder<OrderModel, String?, QQueryOperations>
      startDistrictNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDistrictName');
    });
  }

  QueryBuilder<OrderModel, String?, QQueryOperations>
      targetDistrictIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetDistrictId');
    });
  }

  QueryBuilder<OrderModel, String?, QQueryOperations>
      targetDistrictNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetDistrictName');
    });
  }

  QueryBuilder<OrderModel, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<OrderModel, bool?, QQueryOperations> wasChainedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasChained');
    });
  }
}
