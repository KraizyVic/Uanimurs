// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWatchHistoryCollection on Isar {
  IsarCollection<WatchHistory> get watchHistorys => this.collection();
}

const WatchHistorySchema = CollectionSchema(
  name: r'WatchHistory',
  id: -8125359517487482628,
  properties: {
    r'anilistId': PropertySchema(
      id: 0,
      name: r'anilistId',
      type: IsarType.long,
    ),
    r'anime': PropertySchema(
      id: 1,
      name: r'anime',
      type: IsarType.object,
      target: r'Anime',
    ),
    r'image': PropertySchema(
      id: 2,
      name: r'image',
      type: IsarType.string,
    ),
    r'lastWatched': PropertySchema(
      id: 3,
      name: r'lastWatched',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'streamingLink': PropertySchema(
      id: 5,
      name: r'streamingLink',
      type: IsarType.object,
      target: r'StreamingLink',
    ),
    r'totalEpisodes': PropertySchema(
      id: 6,
      name: r'totalEpisodes',
      type: IsarType.long,
    ),
    r'totalTime': PropertySchema(
      id: 7,
      name: r'totalTime',
      type: IsarType.long,
    ),
    r'watchTime': PropertySchema(
      id: 8,
      name: r'watchTime',
      type: IsarType.long,
    ),
    r'watchedEpisodes': PropertySchema(
      id: 9,
      name: r'watchedEpisodes',
      type: IsarType.longList,
    ),
    r'watchingEpisode': PropertySchema(
      id: 10,
      name: r'watchingEpisode',
      type: IsarType.long,
    )
  },
  estimateSize: _watchHistoryEstimateSize,
  serialize: _watchHistorySerialize,
  deserialize: _watchHistoryDeserialize,
  deserializeProp: _watchHistoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Anime': AnimeSchema,
    r'SearchedAnimeEpisodes': SearchedAnimeEpisodesSchema,
    r'StreamingLink': StreamingLinkSchema,
    r'Track': TrackSchema,
    r'Tro': TroSchema,
    r'Source': SourceSchema
  },
  getId: _watchHistoryGetId,
  getLinks: _watchHistoryGetLinks,
  attach: _watchHistoryAttach,
  version: '3.1.8',
);

int _watchHistoryEstimateSize(
  WatchHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.anime;
    if (value != null) {
      bytesCount +=
          3 + AnimeSchema.estimateSize(value, allOffsets[Anime]!, allOffsets);
    }
  }
  {
    final value = object.image;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.streamingLink;
    if (value != null) {
      bytesCount += 3 +
          StreamingLinkSchema.estimateSize(
              value, allOffsets[StreamingLink]!, allOffsets);
    }
  }
  {
    final value = object.watchedEpisodes;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _watchHistorySerialize(
  WatchHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.anilistId);
  writer.writeObject<Anime>(
    offsets[1],
    allOffsets,
    AnimeSchema.serialize,
    object.anime,
  );
  writer.writeString(offsets[2], object.image);
  writer.writeDateTime(offsets[3], object.lastWatched);
  writer.writeString(offsets[4], object.name);
  writer.writeObject<StreamingLink>(
    offsets[5],
    allOffsets,
    StreamingLinkSchema.serialize,
    object.streamingLink,
  );
  writer.writeLong(offsets[6], object.totalEpisodes);
  writer.writeLong(offsets[7], object.totalTime);
  writer.writeLong(offsets[8], object.watchTime);
  writer.writeLongList(offsets[9], object.watchedEpisodes);
  writer.writeLong(offsets[10], object.watchingEpisode);
}

WatchHistory _watchHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WatchHistory(
    anilistId: reader.readLongOrNull(offsets[0]),
    anime: reader.readObjectOrNull<Anime>(
      offsets[1],
      AnimeSchema.deserialize,
      allOffsets,
    ),
    image: reader.readStringOrNull(offsets[2]),
    name: reader.readStringOrNull(offsets[4]),
    streamingLink: reader.readObjectOrNull<StreamingLink>(
      offsets[5],
      StreamingLinkSchema.deserialize,
      allOffsets,
    ),
    totalEpisodes: reader.readLongOrNull(offsets[6]),
    totalTime: reader.readLongOrNull(offsets[7]),
    watchTime: reader.readLongOrNull(offsets[8]),
    watchedEpisodes: reader.readLongList(offsets[9]),
    watchingEpisode: reader.readLongOrNull(offsets[10]),
  );
  object.id = id;
  object.lastWatched = reader.readDateTimeOrNull(offsets[3]);
  return object;
}

P _watchHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Anime>(
        offset,
        AnimeSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<StreamingLink>(
        offset,
        StreamingLinkSchema.deserialize,
        allOffsets,
      )) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongList(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _watchHistoryGetId(WatchHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _watchHistoryGetLinks(WatchHistory object) {
  return [];
}

void _watchHistoryAttach(
    IsarCollection<dynamic> col, Id id, WatchHistory object) {
  object.id = id;
}

extension WatchHistoryQueryWhereSort
    on QueryBuilder<WatchHistory, WatchHistory, QWhere> {
  QueryBuilder<WatchHistory, WatchHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WatchHistoryQueryWhere
    on QueryBuilder<WatchHistory, WatchHistory, QWhereClause> {
  QueryBuilder<WatchHistory, WatchHistory, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<WatchHistory, WatchHistory, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterWhereClause> idBetween(
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

extension WatchHistoryQueryFilter
    on QueryBuilder<WatchHistory, WatchHistory, QFilterCondition> {
  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      anilistIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'anilistId',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      anilistIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'anilistId',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      anilistIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'anilistId',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      anilistIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'anilistId',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      anilistIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'anilistId',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      anilistIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'anilistId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      animeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'anime',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      animeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'anime',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> imageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      imageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> imageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> imageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'image',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      imageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> imageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> imageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'image',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> imageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'image',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      imageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      imageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'image',
        value: '',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      lastWatchedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWatched',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      lastWatchedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWatched',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      lastWatchedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWatched',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      lastWatchedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastWatched',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      lastWatchedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastWatched',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      lastWatchedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastWatched',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      streamingLinkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'streamingLink',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      streamingLinkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'streamingLink',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      totalEpisodesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalEpisodes',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      totalEpisodesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalEpisodes',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      totalEpisodesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalEpisodes',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      totalEpisodesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalEpisodes',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      totalEpisodesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalEpisodes',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      totalEpisodesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalEpisodes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      totalTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalTime',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      totalTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalTime',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      totalTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      totalTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      totalTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      totalTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'watchTime',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'watchTime',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watchTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'watchTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'watchTime',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'watchTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchedEpisodesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'watchedEpisodes',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchedEpisodesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'watchedEpisodes',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchedEpisodesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watchedEpisodes',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchedEpisodesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'watchedEpisodes',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchedEpisodesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'watchedEpisodes',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchedEpisodesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'watchedEpisodes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchedEpisodesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'watchedEpisodes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchedEpisodesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'watchedEpisodes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchedEpisodesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'watchedEpisodes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchedEpisodesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'watchedEpisodes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchedEpisodesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'watchedEpisodes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchedEpisodesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'watchedEpisodes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchingEpisodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'watchingEpisode',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchingEpisodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'watchingEpisode',
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchingEpisodeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watchingEpisode',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchingEpisodeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'watchingEpisode',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchingEpisodeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'watchingEpisode',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchingEpisodeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'watchingEpisode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WatchHistoryQueryObject
    on QueryBuilder<WatchHistory, WatchHistory, QFilterCondition> {
  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> anime(
      FilterQuery<Anime> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'anime');
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> streamingLink(
      FilterQuery<StreamingLink> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'streamingLink');
    });
  }
}

extension WatchHistoryQueryLinks
    on QueryBuilder<WatchHistory, WatchHistory, QFilterCondition> {}

extension WatchHistoryQuerySortBy
    on QueryBuilder<WatchHistory, WatchHistory, QSortBy> {
  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> sortByAnilistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anilistId', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> sortByAnilistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anilistId', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> sortByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> sortByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> sortByLastWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWatched', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy>
      sortByLastWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWatched', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> sortByTotalEpisodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEpisodes', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy>
      sortByTotalEpisodesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEpisodes', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> sortByTotalTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTime', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> sortByTotalTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTime', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> sortByWatchTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchTime', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> sortByWatchTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchTime', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy>
      sortByWatchingEpisode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchingEpisode', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy>
      sortByWatchingEpisodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchingEpisode', Sort.desc);
    });
  }
}

extension WatchHistoryQuerySortThenBy
    on QueryBuilder<WatchHistory, WatchHistory, QSortThenBy> {
  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenByAnilistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anilistId', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenByAnilistIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anilistId', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenByImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'image', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenByLastWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWatched', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy>
      thenByLastWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWatched', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenByTotalEpisodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEpisodes', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy>
      thenByTotalEpisodesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEpisodes', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenByTotalTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTime', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenByTotalTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalTime', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenByWatchTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchTime', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy> thenByWatchTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchTime', Sort.desc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy>
      thenByWatchingEpisode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchingEpisode', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy>
      thenByWatchingEpisodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchingEpisode', Sort.desc);
    });
  }
}

extension WatchHistoryQueryWhereDistinct
    on QueryBuilder<WatchHistory, WatchHistory, QDistinct> {
  QueryBuilder<WatchHistory, WatchHistory, QDistinct> distinctByAnilistId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'anilistId');
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QDistinct> distinctByImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QDistinct> distinctByLastWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWatched');
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QDistinct>
      distinctByTotalEpisodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalEpisodes');
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QDistinct> distinctByTotalTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalTime');
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QDistinct> distinctByWatchTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'watchTime');
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QDistinct>
      distinctByWatchedEpisodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'watchedEpisodes');
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QDistinct>
      distinctByWatchingEpisode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'watchingEpisode');
    });
  }
}

extension WatchHistoryQueryProperty
    on QueryBuilder<WatchHistory, WatchHistory, QQueryProperty> {
  QueryBuilder<WatchHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WatchHistory, int?, QQueryOperations> anilistIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'anilistId');
    });
  }

  QueryBuilder<WatchHistory, Anime?, QQueryOperations> animeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'anime');
    });
  }

  QueryBuilder<WatchHistory, String?, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<WatchHistory, DateTime?, QQueryOperations>
      lastWatchedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWatched');
    });
  }

  QueryBuilder<WatchHistory, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<WatchHistory, StreamingLink?, QQueryOperations>
      streamingLinkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streamingLink');
    });
  }

  QueryBuilder<WatchHistory, int?, QQueryOperations> totalEpisodesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalEpisodes');
    });
  }

  QueryBuilder<WatchHistory, int?, QQueryOperations> totalTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalTime');
    });
  }

  QueryBuilder<WatchHistory, int?, QQueryOperations> watchTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'watchTime');
    });
  }

  QueryBuilder<WatchHistory, List<int>?, QQueryOperations>
      watchedEpisodesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'watchedEpisodes');
    });
  }

  QueryBuilder<WatchHistory, int?, QQueryOperations> watchingEpisodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'watchingEpisode');
    });
  }
}
