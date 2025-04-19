// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ani_watch_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AnimeSchema = Schema(
  name: r'Anime',
  id: -2255851914829551581,
  properties: {
    r'aniwatchId': PropertySchema(
      id: 0,
      name: r'aniwatchId',
      type: IsarType.string,
    ),
    r'duration': PropertySchema(
      id: 1,
      name: r'duration',
      type: IsarType.string,
    ),
    r'episodes': PropertySchema(
      id: 2,
      name: r'episodes',
      type: IsarType.object,
      target: r'SearchedAnimeEpisodes',
    ),
    r'img': PropertySchema(
      id: 3,
      name: r'img',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'rated': PropertySchema(
      id: 5,
      name: r'rated',
      type: IsarType.bool,
    )
  },
  estimateSize: _animeEstimateSize,
  serialize: _animeSerialize,
  deserialize: _animeDeserialize,
  deserializeProp: _animeDeserializeProp,
);

int _animeEstimateSize(
  Anime object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.aniwatchId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.duration;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.episodes;
    if (value != null) {
      bytesCount += 3 +
          SearchedAnimeEpisodesSchema.estimateSize(
              value, allOffsets[SearchedAnimeEpisodes]!, allOffsets);
    }
  }
  {
    final value = object.img;
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
  return bytesCount;
}

void _animeSerialize(
  Anime object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aniwatchId);
  writer.writeString(offsets[1], object.duration);
  writer.writeObject<SearchedAnimeEpisodes>(
    offsets[2],
    allOffsets,
    SearchedAnimeEpisodesSchema.serialize,
    object.episodes,
  );
  writer.writeString(offsets[3], object.img);
  writer.writeString(offsets[4], object.name);
  writer.writeBool(offsets[5], object.rated);
}

Anime _animeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Anime(
    aniwatchId: reader.readStringOrNull(offsets[0]),
    duration: reader.readStringOrNull(offsets[1]),
    episodes: reader.readObjectOrNull<SearchedAnimeEpisodes>(
      offsets[2],
      SearchedAnimeEpisodesSchema.deserialize,
      allOffsets,
    ),
    img: reader.readStringOrNull(offsets[3]),
    name: reader.readStringOrNull(offsets[4]),
    rated: reader.readBoolOrNull(offsets[5]),
  );
  return object;
}

P _animeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<SearchedAnimeEpisodes>(
        offset,
        SearchedAnimeEpisodesSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AnimeQueryFilter on QueryBuilder<Anime, Anime, QFilterCondition> {
  QueryBuilder<Anime, Anime, QAfterFilterCondition> aniwatchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aniwatchId',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> aniwatchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aniwatchId',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> aniwatchIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aniwatchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> aniwatchIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aniwatchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> aniwatchIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aniwatchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> aniwatchIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aniwatchId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> aniwatchIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aniwatchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> aniwatchIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aniwatchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> aniwatchIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aniwatchId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> aniwatchIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aniwatchId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> aniwatchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aniwatchId',
        value: '',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> aniwatchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aniwatchId',
        value: '',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> durationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> durationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> durationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> durationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> durationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> durationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> durationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> durationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'duration',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> durationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: '',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> durationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'duration',
        value: '',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> episodesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'episodes',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> episodesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'episodes',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> imgIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'img',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> imgIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'img',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> imgEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'img',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> imgGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'img',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> imgLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'img',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> imgBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'img',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> imgStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'img',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> imgEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'img',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> imgContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'img',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> imgMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'img',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> imgIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'img',
        value: '',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> imgIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'img',
        value: '',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Anime, Anime, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Anime, Anime, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Anime, Anime, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Anime, Anime, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Anime, Anime, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Anime, Anime, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> ratedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rated',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> ratedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rated',
      ));
    });
  }

  QueryBuilder<Anime, Anime, QAfterFilterCondition> ratedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rated',
        value: value,
      ));
    });
  }
}

extension AnimeQueryObject on QueryBuilder<Anime, Anime, QFilterCondition> {
  QueryBuilder<Anime, Anime, QAfterFilterCondition> episodes(
      FilterQuery<SearchedAnimeEpisodes> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'episodes');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SearchedAnimeEpisodesSchema = Schema(
  name: r'SearchedAnimeEpisodes',
  id: 733783585188271365,
  properties: {
    r'dub': PropertySchema(
      id: 0,
      name: r'dub',
      type: IsarType.long,
    ),
    r'eps': PropertySchema(
      id: 1,
      name: r'eps',
      type: IsarType.long,
    ),
    r'sub': PropertySchema(
      id: 2,
      name: r'sub',
      type: IsarType.long,
    )
  },
  estimateSize: _searchedAnimeEpisodesEstimateSize,
  serialize: _searchedAnimeEpisodesSerialize,
  deserialize: _searchedAnimeEpisodesDeserialize,
  deserializeProp: _searchedAnimeEpisodesDeserializeProp,
);

int _searchedAnimeEpisodesEstimateSize(
  SearchedAnimeEpisodes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _searchedAnimeEpisodesSerialize(
  SearchedAnimeEpisodes object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.dub);
  writer.writeLong(offsets[1], object.eps);
  writer.writeLong(offsets[2], object.sub);
}

SearchedAnimeEpisodes _searchedAnimeEpisodesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SearchedAnimeEpisodes(
    dub: reader.readLongOrNull(offsets[0]),
    eps: reader.readLongOrNull(offsets[1]),
    sub: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _searchedAnimeEpisodesDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SearchedAnimeEpisodesQueryFilter on QueryBuilder<
    SearchedAnimeEpisodes, SearchedAnimeEpisodes, QFilterCondition> {
  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> dubIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dub',
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> dubIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dub',
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> dubEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dub',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> dubGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dub',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> dubLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dub',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> dubBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dub',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> epsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eps',
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> epsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eps',
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> epsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eps',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> epsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eps',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> epsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eps',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> epsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eps',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> subIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sub',
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> subIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sub',
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> subEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sub',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> subGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sub',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> subLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sub',
        value: value,
      ));
    });
  }

  QueryBuilder<SearchedAnimeEpisodes, SearchedAnimeEpisodes,
      QAfterFilterCondition> subBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sub',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SearchedAnimeEpisodesQueryObject on QueryBuilder<
    SearchedAnimeEpisodes, SearchedAnimeEpisodes, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const StreamingLinkSchema = Schema(
  name: r'StreamingLink',
  id: 4959020930122137013,
  properties: {
    r'anilistId': PropertySchema(
      id: 0,
      name: r'anilistId',
      type: IsarType.long,
    ),
    r'intro': PropertySchema(
      id: 1,
      name: r'intro',
      type: IsarType.object,
      target: r'Tro',
    ),
    r'malId': PropertySchema(
      id: 2,
      name: r'malId',
      type: IsarType.long,
    ),
    r'outro': PropertySchema(
      id: 3,
      name: r'outro',
      type: IsarType.object,
      target: r'Tro',
    ),
    r'sources': PropertySchema(
      id: 4,
      name: r'sources',
      type: IsarType.objectList,
      target: r'Source',
    ),
    r'tracks': PropertySchema(
      id: 5,
      name: r'tracks',
      type: IsarType.objectList,
      target: r'Track',
    )
  },
  estimateSize: _streamingLinkEstimateSize,
  serialize: _streamingLinkSerialize,
  deserialize: _streamingLinkDeserialize,
  deserializeProp: _streamingLinkDeserializeProp,
);

int _streamingLinkEstimateSize(
  StreamingLink object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.intro;
    if (value != null) {
      bytesCount +=
          3 + TroSchema.estimateSize(value, allOffsets[Tro]!, allOffsets);
    }
  }
  {
    final value = object.outro;
    if (value != null) {
      bytesCount +=
          3 + TroSchema.estimateSize(value, allOffsets[Tro]!, allOffsets);
    }
  }
  {
    final list = object.sources;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Source]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += SourceSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.tracks;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Track]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += TrackSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _streamingLinkSerialize(
  StreamingLink object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.anilistId);
  writer.writeObject<Tro>(
    offsets[1],
    allOffsets,
    TroSchema.serialize,
    object.intro,
  );
  writer.writeLong(offsets[2], object.malId);
  writer.writeObject<Tro>(
    offsets[3],
    allOffsets,
    TroSchema.serialize,
    object.outro,
  );
  writer.writeObjectList<Source>(
    offsets[4],
    allOffsets,
    SourceSchema.serialize,
    object.sources,
  );
  writer.writeObjectList<Track>(
    offsets[5],
    allOffsets,
    TrackSchema.serialize,
    object.tracks,
  );
}

StreamingLink _streamingLinkDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StreamingLink(
    anilistId: reader.readLongOrNull(offsets[0]),
    intro: reader.readObjectOrNull<Tro>(
      offsets[1],
      TroSchema.deserialize,
      allOffsets,
    ),
    malId: reader.readLongOrNull(offsets[2]),
    outro: reader.readObjectOrNull<Tro>(
      offsets[3],
      TroSchema.deserialize,
      allOffsets,
    ),
    sources: reader.readObjectList<Source>(
      offsets[4],
      SourceSchema.deserialize,
      allOffsets,
      Source(),
    ),
    tracks: reader.readObjectList<Track>(
      offsets[5],
      TrackSchema.deserialize,
      allOffsets,
      Track(),
    ),
  );
  return object;
}

P _streamingLinkDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Tro>(
        offset,
        TroSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<Tro>(
        offset,
        TroSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readObjectList<Source>(
        offset,
        SourceSchema.deserialize,
        allOffsets,
        Source(),
      )) as P;
    case 5:
      return (reader.readObjectList<Track>(
        offset,
        TrackSchema.deserialize,
        allOffsets,
        Track(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension StreamingLinkQueryFilter
    on QueryBuilder<StreamingLink, StreamingLink, QFilterCondition> {
  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      anilistIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'anilistId',
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      anilistIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'anilistId',
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      anilistIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'anilistId',
        value: value,
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
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

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
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

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
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

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      introIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'intro',
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      introIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'intro',
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      malIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'malId',
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      malIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'malId',
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      malIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'malId',
        value: value,
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      malIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'malId',
        value: value,
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      malIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'malId',
        value: value,
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      malIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'malId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      outroIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'outro',
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      outroIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'outro',
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      sourcesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sources',
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      sourcesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sources',
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      sourcesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sources',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      sourcesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sources',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      sourcesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sources',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      sourcesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sources',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      sourcesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sources',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      sourcesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sources',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      tracksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tracks',
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      tracksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tracks',
      ));
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      tracksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tracks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      tracksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tracks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      tracksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tracks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      tracksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tracks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      tracksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tracks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      tracksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tracks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension StreamingLinkQueryObject
    on QueryBuilder<StreamingLink, StreamingLink, QFilterCondition> {
  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition> intro(
      FilterQuery<Tro> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'intro');
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition> outro(
      FilterQuery<Tro> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'outro');
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      sourcesElement(FilterQuery<Source> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sources');
    });
  }

  QueryBuilder<StreamingLink, StreamingLink, QAfterFilterCondition>
      tracksElement(FilterQuery<Track> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'tracks');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TroSchema = Schema(
  name: r'Tro',
  id: -4775066201848088976,
  properties: {
    r'end': PropertySchema(
      id: 0,
      name: r'end',
      type: IsarType.long,
    ),
    r'start': PropertySchema(
      id: 1,
      name: r'start',
      type: IsarType.long,
    )
  },
  estimateSize: _troEstimateSize,
  serialize: _troSerialize,
  deserialize: _troDeserialize,
  deserializeProp: _troDeserializeProp,
);

int _troEstimateSize(
  Tro object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _troSerialize(
  Tro object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.end);
  writer.writeLong(offsets[1], object.start);
}

Tro _troDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Tro(
    end: reader.readLongOrNull(offsets[0]),
    start: reader.readLongOrNull(offsets[1]),
  );
  return object;
}

P _troDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TroQueryFilter on QueryBuilder<Tro, Tro, QFilterCondition> {
  QueryBuilder<Tro, Tro, QAfterFilterCondition> endIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'end',
      ));
    });
  }

  QueryBuilder<Tro, Tro, QAfterFilterCondition> endIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'end',
      ));
    });
  }

  QueryBuilder<Tro, Tro, QAfterFilterCondition> endEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end',
        value: value,
      ));
    });
  }

  QueryBuilder<Tro, Tro, QAfterFilterCondition> endGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'end',
        value: value,
      ));
    });
  }

  QueryBuilder<Tro, Tro, QAfterFilterCondition> endLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'end',
        value: value,
      ));
    });
  }

  QueryBuilder<Tro, Tro, QAfterFilterCondition> endBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'end',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Tro, Tro, QAfterFilterCondition> startIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<Tro, Tro, QAfterFilterCondition> startIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'start',
      ));
    });
  }

  QueryBuilder<Tro, Tro, QAfterFilterCondition> startEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start',
        value: value,
      ));
    });
  }

  QueryBuilder<Tro, Tro, QAfterFilterCondition> startGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'start',
        value: value,
      ));
    });
  }

  QueryBuilder<Tro, Tro, QAfterFilterCondition> startLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'start',
        value: value,
      ));
    });
  }

  QueryBuilder<Tro, Tro, QAfterFilterCondition> startBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'start',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TroQueryObject on QueryBuilder<Tro, Tro, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SourceSchema = Schema(
  name: r'Source',
  id: 1877768871581930899,
  properties: {
    r'type': PropertySchema(
      id: 0,
      name: r'type',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 1,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _sourceEstimateSize,
  serialize: _sourceSerialize,
  deserialize: _sourceDeserialize,
  deserializeProp: _sourceDeserializeProp,
);

int _sourceEstimateSize(
  Source object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _sourceSerialize(
  Source object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.type);
  writer.writeString(offsets[1], object.url);
}

Source _sourceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Source(
    type: reader.readStringOrNull(offsets[0]),
    url: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _sourceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SourceQueryFilter on QueryBuilder<Source, Source, QFilterCondition> {
  QueryBuilder<Source, Source, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> typeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> typeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> typeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> typeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> typeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<Source, Source, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension SourceQueryObject on QueryBuilder<Source, Source, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TrackSchema = Schema(
  name: r'Track',
  id: 6244076704169336260,
  properties: {
    r'file': PropertySchema(
      id: 0,
      name: r'file',
      type: IsarType.string,
    ),
    r'kind': PropertySchema(
      id: 1,
      name: r'kind',
      type: IsarType.string,
    ),
    r'label': PropertySchema(
      id: 2,
      name: r'label',
      type: IsarType.string,
    ),
    r'trackDefault': PropertySchema(
      id: 3,
      name: r'trackDefault',
      type: IsarType.bool,
    )
  },
  estimateSize: _trackEstimateSize,
  serialize: _trackSerialize,
  deserialize: _trackDeserialize,
  deserializeProp: _trackDeserializeProp,
);

int _trackEstimateSize(
  Track object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.file;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.kind;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.label;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _trackSerialize(
  Track object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.file);
  writer.writeString(offsets[1], object.kind);
  writer.writeString(offsets[2], object.label);
  writer.writeBool(offsets[3], object.trackDefault);
}

Track _trackDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Track(
    file: reader.readStringOrNull(offsets[0]),
    kind: reader.readStringOrNull(offsets[1]),
    label: reader.readStringOrNull(offsets[2]),
    trackDefault: reader.readBoolOrNull(offsets[3]),
  );
  return object;
}

P _trackDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TrackQueryFilter on QueryBuilder<Track, Track, QFilterCondition> {
  QueryBuilder<Track, Track, QAfterFilterCondition> fileIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'file',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> fileIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'file',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> fileEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'file',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> fileGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'file',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> fileLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'file',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> fileBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'file',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> fileStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'file',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> fileEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'file',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> fileContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'file',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> fileMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'file',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> fileIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'file',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> fileIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'file',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> kindIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kind',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> kindIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kind',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> kindEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kind',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> kindGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kind',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> kindLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kind',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> kindBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kind',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> kindStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kind',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> kindEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kind',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> kindContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kind',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> kindMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kind',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> kindIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kind',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> kindIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kind',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> labelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> labelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> labelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> labelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> labelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> labelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> labelContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> labelMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> trackDefaultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trackDefault',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> trackDefaultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trackDefault',
      ));
    });
  }

  QueryBuilder<Track, Track, QAfterFilterCondition> trackDefaultEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trackDefault',
        value: value,
      ));
    });
  }
}

extension TrackQueryObject on QueryBuilder<Track, Track, QFilterCondition> {}
