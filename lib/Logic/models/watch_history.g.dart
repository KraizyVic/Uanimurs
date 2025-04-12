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
    r'totalEpisodes': PropertySchema(
      id: 0,
      name: r'totalEpisodes',
      type: IsarType.long,
    ),
    r'totalTime': PropertySchema(
      id: 1,
      name: r'totalTime',
      type: IsarType.long,
    ),
    r'watchTime': PropertySchema(
      id: 2,
      name: r'watchTime',
      type: IsarType.long,
    ),
    r'watchedEpisodes': PropertySchema(
      id: 3,
      name: r'watchedEpisodes',
      type: IsarType.long,
    )
  },
  estimateSize: _watchHistoryEstimateSize,
  serialize: _watchHistorySerialize,
  deserialize: _watchHistoryDeserialize,
  deserializeProp: _watchHistoryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'anilistAnime': LinkSchema(
      id: -7053462379933309521,
      name: r'anilistAnime',
      target: r'AnimeModel',
      single: true,
    ),
    r'aniwatchAnime': LinkSchema(
      id: -8894143261867625934,
      name: r'aniwatchAnime',
      target: r'Anime',
      single: true,
    )
  },
  embeddedSchemas: {},
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
  return bytesCount;
}

void _watchHistorySerialize(
  WatchHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.totalEpisodes);
  writer.writeLong(offsets[1], object.totalTime);
  writer.writeLong(offsets[2], object.watchTime);
  writer.writeLong(offsets[3], object.watchedEpisodes);
}

WatchHistory _watchHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WatchHistory(
    totalEpisodes: reader.readLongOrNull(offsets[0]),
    totalTime: reader.readLongOrNull(offsets[1]),
    watchTime: reader.readLongOrNull(offsets[2]),
    watchedEpisodes: reader.readLongOrNull(offsets[3]),
  );
  object.id = id;
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
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _watchHistoryGetId(WatchHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _watchHistoryGetLinks(WatchHistory object) {
  return [object.anilistAnime, object.aniwatchAnime];
}

void _watchHistoryAttach(
    IsarCollection<dynamic> col, Id id, WatchHistory object) {
  object.id = id;
  object.anilistAnime
      .attach(col, col.isar.collection<AnimeModel>(), r'anilistAnime', id);
  object.aniwatchAnime
      .attach(col, col.isar.collection<Anime>(), r'aniwatchAnime', id);
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
      watchedEpisodesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watchedEpisodes',
        value: value,
      ));
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      watchedEpisodesGreaterThan(
    int? value, {
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
      watchedEpisodesLessThan(
    int? value, {
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
      watchedEpisodesBetween(
    int? lower,
    int? upper, {
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
}

extension WatchHistoryQueryObject
    on QueryBuilder<WatchHistory, WatchHistory, QFilterCondition> {}

extension WatchHistoryQueryLinks
    on QueryBuilder<WatchHistory, WatchHistory, QFilterCondition> {
  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> anilistAnime(
      FilterQuery<AnimeModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'anilistAnime');
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      anilistAnimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'anilistAnime', 0, true, 0, true);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition> aniwatchAnime(
      FilterQuery<Anime> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'aniwatchAnime');
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterFilterCondition>
      aniwatchAnimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'aniwatchAnime', 0, true, 0, true);
    });
  }
}

extension WatchHistoryQuerySortBy
    on QueryBuilder<WatchHistory, WatchHistory, QSortBy> {
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
      sortByWatchedEpisodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchedEpisodes', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy>
      sortByWatchedEpisodesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchedEpisodes', Sort.desc);
    });
  }
}

extension WatchHistoryQuerySortThenBy
    on QueryBuilder<WatchHistory, WatchHistory, QSortThenBy> {
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
      thenByWatchedEpisodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchedEpisodes', Sort.asc);
    });
  }

  QueryBuilder<WatchHistory, WatchHistory, QAfterSortBy>
      thenByWatchedEpisodesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchedEpisodes', Sort.desc);
    });
  }
}

extension WatchHistoryQueryWhereDistinct
    on QueryBuilder<WatchHistory, WatchHistory, QDistinct> {
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
}

extension WatchHistoryQueryProperty
    on QueryBuilder<WatchHistory, WatchHistory, QQueryProperty> {
  QueryBuilder<WatchHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
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

  QueryBuilder<WatchHistory, int?, QQueryOperations> watchedEpisodesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'watchedEpisodes');
    });
  }
}
