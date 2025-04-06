// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAnimeModelCollection on Isar {
  IsarCollection<AnimeModel> get animeModels => this.collection();
}

const AnimeModelSchema = CollectionSchema(
  name: r'AnimeModel',
  id: -8337788826838197702,
  properties: {
    r'alId': PropertySchema(
      id: 0,
      name: r'alId',
      type: IsarType.long,
    ),
    r'bannerImage': PropertySchema(
      id: 1,
      name: r'bannerImage',
      type: IsarType.string,
    ),
    r'characters': PropertySchema(
      id: 2,
      name: r'characters',
      type: IsarType.object,
      target: r'Characters',
    ),
    r'coverImage': PropertySchema(
      id: 3,
      name: r'coverImage',
      type: IsarType.object,
      target: r'CoverImage',
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'duration': PropertySchema(
      id: 5,
      name: r'duration',
      type: IsarType.long,
    ),
    r'endDate': PropertySchema(
      id: 6,
      name: r'endDate',
      type: IsarType.object,
      target: r'Date',
    ),
    r'episodes': PropertySchema(
      id: 7,
      name: r'episodes',
      type: IsarType.long,
    ),
    r'format': PropertySchema(
      id: 8,
      name: r'format',
      type: IsarType.string,
    ),
    r'genres': PropertySchema(
      id: 9,
      name: r'genres',
      type: IsarType.stringList,
    ),
    r'isAdult': PropertySchema(
      id: 10,
      name: r'isAdult',
      type: IsarType.bool,
    ),
    r'malId': PropertySchema(
      id: 11,
      name: r'malId',
      type: IsarType.long,
    ),
    r'meanScore': PropertySchema(
      id: 12,
      name: r'meanScore',
      type: IsarType.long,
    ),
    r'popularity': PropertySchema(
      id: 13,
      name: r'popularity',
      type: IsarType.long,
    ),
    r'season': PropertySchema(
      id: 14,
      name: r'season',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 15,
      name: r'startDate',
      type: IsarType.object,
      target: r'Date',
    ),
    r'status': PropertySchema(
      id: 16,
      name: r'status',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 17,
      name: r'title',
      type: IsarType.object,
      target: r'Title',
    ),
    r'trailer': PropertySchema(
      id: 18,
      name: r'trailer',
      type: IsarType.object,
      target: r'Trailer',
    ),
    r'type': PropertySchema(
      id: 19,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _animeModelEstimateSize,
  serialize: _animeModelSerialize,
  deserialize: _animeModelDeserialize,
  deserializeProp: _animeModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Date': DateSchema,
    r'Trailer': TrailerSchema,
    r'Title': TitleSchema,
    r'CoverImage': CoverImageSchema,
    r'Characters': CharactersSchema,
    r'AnimeEdge': AnimeEdgeSchema,
    r'AnimeNode': AnimeNodeSchema,
    r'Name': NameSchema,
    r'AnimeImage': AnimeImageSchema,
    r'VoiceActor': VoiceActorSchema
  },
  getId: _animeModelGetId,
  getLinks: _animeModelGetLinks,
  attach: _animeModelAttach,
  version: '3.1.8',
);

int _animeModelEstimateSize(
  AnimeModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bannerImage.length * 3;
  bytesCount += 3 +
      CharactersSchema.estimateSize(
          object.characters, allOffsets[Characters]!, allOffsets);
  bytesCount += 3 +
      CoverImageSchema.estimateSize(
          object.coverImage, allOffsets[CoverImage]!, allOffsets);
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 +
      DateSchema.estimateSize(object.endDate, allOffsets[Date]!, allOffsets);
  bytesCount += 3 + object.format.length * 3;
  bytesCount += 3 + object.genres.length * 3;
  {
    for (var i = 0; i < object.genres.length; i++) {
      final value = object.genres[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.season.length * 3;
  bytesCount += 3 +
      DateSchema.estimateSize(object.startDate, allOffsets[Date]!, allOffsets);
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 +
      TitleSchema.estimateSize(object.title, allOffsets[Title]!, allOffsets);
  bytesCount += 3 +
      TrailerSchema.estimateSize(
          object.trailer, allOffsets[Trailer]!, allOffsets);
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _animeModelSerialize(
  AnimeModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.alId);
  writer.writeString(offsets[1], object.bannerImage);
  writer.writeObject<Characters>(
    offsets[2],
    allOffsets,
    CharactersSchema.serialize,
    object.characters,
  );
  writer.writeObject<CoverImage>(
    offsets[3],
    allOffsets,
    CoverImageSchema.serialize,
    object.coverImage,
  );
  writer.writeString(offsets[4], object.description);
  writer.writeLong(offsets[5], object.duration);
  writer.writeObject<Date>(
    offsets[6],
    allOffsets,
    DateSchema.serialize,
    object.endDate,
  );
  writer.writeLong(offsets[7], object.episodes);
  writer.writeString(offsets[8], object.format);
  writer.writeStringList(offsets[9], object.genres);
  writer.writeBool(offsets[10], object.isAdult);
  writer.writeLong(offsets[11], object.malId);
  writer.writeLong(offsets[12], object.meanScore);
  writer.writeLong(offsets[13], object.popularity);
  writer.writeString(offsets[14], object.season);
  writer.writeObject<Date>(
    offsets[15],
    allOffsets,
    DateSchema.serialize,
    object.startDate,
  );
  writer.writeString(offsets[16], object.status);
  writer.writeObject<Title>(
    offsets[17],
    allOffsets,
    TitleSchema.serialize,
    object.title,
  );
  writer.writeObject<Trailer>(
    offsets[18],
    allOffsets,
    TrailerSchema.serialize,
    object.trailer,
  );
  writer.writeString(offsets[19], object.type);
}

AnimeModel _animeModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnimeModel(
    alId: reader.readLong(offsets[0]),
    bannerImage: reader.readString(offsets[1]),
    characters: reader.readObjectOrNull<Characters>(
          offsets[2],
          CharactersSchema.deserialize,
          allOffsets,
        ) ??
        Characters(),
    coverImage: reader.readObjectOrNull<CoverImage>(
          offsets[3],
          CoverImageSchema.deserialize,
          allOffsets,
        ) ??
        CoverImage(),
    description: reader.readString(offsets[4]),
    duration: reader.readLong(offsets[5]),
    endDate: reader.readObjectOrNull<Date>(
          offsets[6],
          DateSchema.deserialize,
          allOffsets,
        ) ??
        Date(),
    episodes: reader.readLong(offsets[7]),
    format: reader.readString(offsets[8]),
    genres: reader.readStringList(offsets[9]) ?? [],
    isAdult: reader.readBool(offsets[10]),
    malId: reader.readLong(offsets[11]),
    meanScore: reader.readLong(offsets[12]),
    popularity: reader.readLong(offsets[13]),
    season: reader.readString(offsets[14]),
    startDate: reader.readObjectOrNull<Date>(
          offsets[15],
          DateSchema.deserialize,
          allOffsets,
        ) ??
        Date(),
    status: reader.readString(offsets[16]),
    title: reader.readObjectOrNull<Title>(
          offsets[17],
          TitleSchema.deserialize,
          allOffsets,
        ) ??
        Title(),
    trailer: reader.readObjectOrNull<Trailer>(
          offsets[18],
          TrailerSchema.deserialize,
          allOffsets,
        ) ??
        Trailer(),
    type: reader.readString(offsets[19]),
  );
  object.id = id;
  return object;
}

P _animeModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<Characters>(
            offset,
            CharactersSchema.deserialize,
            allOffsets,
          ) ??
          Characters()) as P;
    case 3:
      return (reader.readObjectOrNull<CoverImage>(
            offset,
            CoverImageSchema.deserialize,
            allOffsets,
          ) ??
          CoverImage()) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readObjectOrNull<Date>(
            offset,
            DateSchema.deserialize,
            allOffsets,
          ) ??
          Date()) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readObjectOrNull<Date>(
            offset,
            DateSchema.deserialize,
            allOffsets,
          ) ??
          Date()) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readObjectOrNull<Title>(
            offset,
            TitleSchema.deserialize,
            allOffsets,
          ) ??
          Title()) as P;
    case 18:
      return (reader.readObjectOrNull<Trailer>(
            offset,
            TrailerSchema.deserialize,
            allOffsets,
          ) ??
          Trailer()) as P;
    case 19:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _animeModelGetId(AnimeModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _animeModelGetLinks(AnimeModel object) {
  return [];
}

void _animeModelAttach(IsarCollection<dynamic> col, Id id, AnimeModel object) {
  object.id = id;
}

extension AnimeModelQueryWhereSort
    on QueryBuilder<AnimeModel, AnimeModel, QWhere> {
  QueryBuilder<AnimeModel, AnimeModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AnimeModelQueryWhere
    on QueryBuilder<AnimeModel, AnimeModel, QWhereClause> {
  QueryBuilder<AnimeModel, AnimeModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterWhereClause> idBetween(
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

extension AnimeModelQueryFilter
    on QueryBuilder<AnimeModel, AnimeModel, QFilterCondition> {
  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> alIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> alIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> alIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> alIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      bannerImageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bannerImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      bannerImageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bannerImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      bannerImageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bannerImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      bannerImageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bannerImage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      bannerImageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bannerImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      bannerImageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bannerImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      bannerImageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bannerImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      bannerImageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bannerImage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      bannerImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bannerImage',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      bannerImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bannerImage',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> durationEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      durationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> durationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> durationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> episodesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'episodes',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      episodesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'episodes',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> episodesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'episodes',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> episodesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'episodes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> formatEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> formatGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> formatLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> formatBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'format',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> formatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> formatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> formatContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'format',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> formatMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'format',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> formatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'format',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      formatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'format',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genres',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'genres',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'genres',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'genres',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'genres',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'genres',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'genres',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'genres',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genres',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'genres',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> genresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      genresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> isAdultEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAdult',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> malIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'malId',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> malIdGreaterThan(
    int value, {
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> malIdLessThan(
    int value, {
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> malIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> meanScoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'meanScore',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      meanScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'meanScore',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> meanScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'meanScore',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> meanScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'meanScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> popularityEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'popularity',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      popularityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'popularity',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      popularityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'popularity',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> popularityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'popularity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> seasonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> seasonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> seasonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> seasonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'season',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> seasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> seasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> seasonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'season',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> seasonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'season',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> seasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'season',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      seasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'season',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> typeEqualTo(
    String value, {
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> typeGreaterThan(
    String value, {
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> typeLessThan(
    String value, {
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> typeStartsWith(
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> typeEndsWith(
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> typeMatches(
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

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension AnimeModelQueryObject
    on QueryBuilder<AnimeModel, AnimeModel, QFilterCondition> {
  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> characters(
      FilterQuery<Characters> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'characters');
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> coverImage(
      FilterQuery<CoverImage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'coverImage');
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> endDate(
      FilterQuery<Date> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'endDate');
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> startDate(
      FilterQuery<Date> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'startDate');
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> title(
      FilterQuery<Title> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'title');
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterFilterCondition> trailer(
      FilterQuery<Trailer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'trailer');
    });
  }
}

extension AnimeModelQueryLinks
    on QueryBuilder<AnimeModel, AnimeModel, QFilterCondition> {}

extension AnimeModelQuerySortBy
    on QueryBuilder<AnimeModel, AnimeModel, QSortBy> {
  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByAlId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alId', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByAlIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alId', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByBannerImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bannerImage', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByBannerImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bannerImage', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByEpisodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodes', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByEpisodesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodes', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'format', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'format', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByIsAdult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAdult', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByIsAdultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAdult', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByMalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'malId', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByMalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'malId', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByMeanScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meanScore', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByMeanScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meanScore', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByPopularity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularity', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByPopularityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularity', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension AnimeModelQuerySortThenBy
    on QueryBuilder<AnimeModel, AnimeModel, QSortThenBy> {
  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByAlId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alId', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByAlIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alId', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByBannerImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bannerImage', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByBannerImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bannerImage', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByEpisodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodes', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByEpisodesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodes', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByFormat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'format', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByFormatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'format', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByIsAdult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAdult', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByIsAdultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAdult', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByMalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'malId', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByMalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'malId', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByMeanScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meanScore', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByMeanScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meanScore', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByPopularity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularity', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByPopularityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'popularity', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension AnimeModelQueryWhereDistinct
    on QueryBuilder<AnimeModel, AnimeModel, QDistinct> {
  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctByAlId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alId');
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctByBannerImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bannerImage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration');
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctByEpisodes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'episodes');
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctByFormat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'format', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctByGenres() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genres');
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctByIsAdult() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAdult');
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctByMalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'malId');
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctByMeanScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meanScore');
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctByPopularity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'popularity');
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctBySeason(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'season', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AnimeModel, AnimeModel, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension AnimeModelQueryProperty
    on QueryBuilder<AnimeModel, AnimeModel, QQueryProperty> {
  QueryBuilder<AnimeModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AnimeModel, int, QQueryOperations> alIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alId');
    });
  }

  QueryBuilder<AnimeModel, String, QQueryOperations> bannerImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bannerImage');
    });
  }

  QueryBuilder<AnimeModel, Characters, QQueryOperations> charactersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'characters');
    });
  }

  QueryBuilder<AnimeModel, CoverImage, QQueryOperations> coverImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverImage');
    });
  }

  QueryBuilder<AnimeModel, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<AnimeModel, int, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<AnimeModel, Date, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<AnimeModel, int, QQueryOperations> episodesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'episodes');
    });
  }

  QueryBuilder<AnimeModel, String, QQueryOperations> formatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'format');
    });
  }

  QueryBuilder<AnimeModel, List<String>, QQueryOperations> genresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genres');
    });
  }

  QueryBuilder<AnimeModel, bool, QQueryOperations> isAdultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAdult');
    });
  }

  QueryBuilder<AnimeModel, int, QQueryOperations> malIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'malId');
    });
  }

  QueryBuilder<AnimeModel, int, QQueryOperations> meanScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meanScore');
    });
  }

  QueryBuilder<AnimeModel, int, QQueryOperations> popularityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'popularity');
    });
  }

  QueryBuilder<AnimeModel, String, QQueryOperations> seasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'season');
    });
  }

  QueryBuilder<AnimeModel, Date, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<AnimeModel, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<AnimeModel, Title, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<AnimeModel, Trailer, QQueryOperations> trailerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trailer');
    });
  }

  QueryBuilder<AnimeModel, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CharactersSchema = Schema(
  name: r'Characters',
  id: 129895740966808915,
  properties: {
    r'edges': PropertySchema(
      id: 0,
      name: r'edges',
      type: IsarType.objectList,
      target: r'AnimeEdge',
    )
  },
  estimateSize: _charactersEstimateSize,
  serialize: _charactersSerialize,
  deserialize: _charactersDeserialize,
  deserializeProp: _charactersDeserializeProp,
);

int _charactersEstimateSize(
  Characters object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.edges;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[AnimeEdge]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              AnimeEdgeSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _charactersSerialize(
  Characters object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<AnimeEdge>(
    offsets[0],
    allOffsets,
    AnimeEdgeSchema.serialize,
    object.edges,
  );
}

Characters _charactersDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Characters(
    edges: reader.readObjectList<AnimeEdge>(
      offsets[0],
      AnimeEdgeSchema.deserialize,
      allOffsets,
      AnimeEdge(),
    ),
  );
  return object;
}

P _charactersDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<AnimeEdge>(
        offset,
        AnimeEdgeSchema.deserialize,
        allOffsets,
        AnimeEdge(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CharactersQueryFilter
    on QueryBuilder<Characters, Characters, QFilterCondition> {
  QueryBuilder<Characters, Characters, QAfterFilterCondition> edgesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'edges',
      ));
    });
  }

  QueryBuilder<Characters, Characters, QAfterFilterCondition> edgesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'edges',
      ));
    });
  }

  QueryBuilder<Characters, Characters, QAfterFilterCondition>
      edgesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'edges',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Characters, Characters, QAfterFilterCondition> edgesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'edges',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Characters, Characters, QAfterFilterCondition>
      edgesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'edges',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Characters, Characters, QAfterFilterCondition>
      edgesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'edges',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Characters, Characters, QAfterFilterCondition>
      edgesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'edges',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Characters, Characters, QAfterFilterCondition>
      edgesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'edges',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CharactersQueryObject
    on QueryBuilder<Characters, Characters, QFilterCondition> {
  QueryBuilder<Characters, Characters, QAfterFilterCondition> edgesElement(
      FilterQuery<AnimeEdge> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'edges');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AnimeEdgeSchema = Schema(
  name: r'AnimeEdge',
  id: -7300690067802758796,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'node': PropertySchema(
      id: 2,
      name: r'node',
      type: IsarType.object,
      target: r'AnimeNode',
    ),
    r'role': PropertySchema(
      id: 3,
      name: r'role',
      type: IsarType.string,
    ),
    r'voiceActors': PropertySchema(
      id: 4,
      name: r'voiceActors',
      type: IsarType.objectList,
      target: r'VoiceActor',
    )
  },
  estimateSize: _animeEdgeEstimateSize,
  serialize: _animeEdgeSerialize,
  deserialize: _animeEdgeDeserialize,
  deserializeProp: _animeEdgeDeserializeProp,
);

int _animeEdgeEstimateSize(
  AnimeEdge object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.node;
    if (value != null) {
      bytesCount += 3 +
          AnimeNodeSchema.estimateSize(
              value, allOffsets[AnimeNode]!, allOffsets);
    }
  }
  {
    final value = object.role;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.voiceActors;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[VoiceActor]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              VoiceActorSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _animeEdgeSerialize(
  AnimeEdge object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id);
  writer.writeString(offsets[1], object.name);
  writer.writeObject<AnimeNode>(
    offsets[2],
    allOffsets,
    AnimeNodeSchema.serialize,
    object.node,
  );
  writer.writeString(offsets[3], object.role);
  writer.writeObjectList<VoiceActor>(
    offsets[4],
    allOffsets,
    VoiceActorSchema.serialize,
    object.voiceActors,
  );
}

AnimeEdge _animeEdgeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnimeEdge(
    id: reader.readLongOrNull(offsets[0]),
    name: reader.readStringOrNull(offsets[1]),
    node: reader.readObjectOrNull<AnimeNode>(
      offsets[2],
      AnimeNodeSchema.deserialize,
      allOffsets,
    ),
    role: reader.readStringOrNull(offsets[3]),
    voiceActors: reader.readObjectList<VoiceActor>(
      offsets[4],
      VoiceActorSchema.deserialize,
      allOffsets,
      VoiceActor(),
    ),
  );
  return object;
}

P _animeEdgeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<AnimeNode>(
        offset,
        AnimeNodeSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readObjectList<VoiceActor>(
        offset,
        VoiceActorSchema.deserialize,
        allOffsets,
        VoiceActor(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AnimeEdgeQueryFilter
    on QueryBuilder<AnimeEdge, AnimeEdge, QFilterCondition> {
  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> idGreaterThan(
    int? value, {
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

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> idLessThan(
    int? value, {
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

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nameContains(
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

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'node',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> nodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'node',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> roleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'role',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> roleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'role',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> roleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> roleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> roleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> roleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'role',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> roleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> roleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> roleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'role',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> roleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'role',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> roleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> roleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'role',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition>
      voiceActorsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voiceActors',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition>
      voiceActorsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voiceActors',
      ));
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition>
      voiceActorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'voiceActors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition>
      voiceActorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'voiceActors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition>
      voiceActorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'voiceActors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition>
      voiceActorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'voiceActors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition>
      voiceActorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'voiceActors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition>
      voiceActorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'voiceActors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension AnimeEdgeQueryObject
    on QueryBuilder<AnimeEdge, AnimeEdge, QFilterCondition> {
  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> node(
      FilterQuery<AnimeNode> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'node');
    });
  }

  QueryBuilder<AnimeEdge, AnimeEdge, QAfterFilterCondition> voiceActorsElement(
      FilterQuery<VoiceActor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'voiceActors');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AnimeNodeSchema = Schema(
  name: r'AnimeNode',
  id: -4626402566553208532,
  properties: {
    r'age': PropertySchema(
      id: 0,
      name: r'age',
      type: IsarType.string,
    ),
    r'image': PropertySchema(
      id: 1,
      name: r'image',
      type: IsarType.object,
      target: r'AnimeImage',
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.object,
      target: r'Name',
    )
  },
  estimateSize: _animeNodeEstimateSize,
  serialize: _animeNodeSerialize,
  deserialize: _animeNodeDeserialize,
  deserializeProp: _animeNodeDeserializeProp,
);

int _animeNodeEstimateSize(
  AnimeNode object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.age;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.image;
    if (value != null) {
      bytesCount += 3 +
          AnimeImageSchema.estimateSize(
              value, allOffsets[AnimeImage]!, allOffsets);
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount +=
          3 + NameSchema.estimateSize(value, allOffsets[Name]!, allOffsets);
    }
  }
  return bytesCount;
}

void _animeNodeSerialize(
  AnimeNode object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.age);
  writer.writeObject<AnimeImage>(
    offsets[1],
    allOffsets,
    AnimeImageSchema.serialize,
    object.image,
  );
  writer.writeObject<Name>(
    offsets[2],
    allOffsets,
    NameSchema.serialize,
    object.name,
  );
}

AnimeNode _animeNodeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnimeNode(
    age: reader.readStringOrNull(offsets[0]),
    image: reader.readObjectOrNull<AnimeImage>(
      offsets[1],
      AnimeImageSchema.deserialize,
      allOffsets,
    ),
    name: reader.readObjectOrNull<Name>(
      offsets[2],
      NameSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _animeNodeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<AnimeImage>(
        offset,
        AnimeImageSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<Name>(
        offset,
        NameSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AnimeNodeQueryFilter
    on QueryBuilder<AnimeNode, AnimeNode, QFilterCondition> {
  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> ageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> ageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'age',
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> ageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> ageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> ageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> ageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> ageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> ageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> ageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> ageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'age',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> ageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> ageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'age',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }
}

extension AnimeNodeQueryObject
    on QueryBuilder<AnimeNode, AnimeNode, QFilterCondition> {
  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> image(
      FilterQuery<AnimeImage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'image');
    });
  }

  QueryBuilder<AnimeNode, AnimeNode, QAfterFilterCondition> name(
      FilterQuery<Name> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'name');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AnimeImageSchema = Schema(
  name: r'AnimeImage',
  id: 360090585196112071,
  properties: {
    r'large': PropertySchema(
      id: 0,
      name: r'large',
      type: IsarType.string,
    ),
    r'medium': PropertySchema(
      id: 1,
      name: r'medium',
      type: IsarType.string,
    )
  },
  estimateSize: _animeImageEstimateSize,
  serialize: _animeImageSerialize,
  deserialize: _animeImageDeserialize,
  deserializeProp: _animeImageDeserializeProp,
);

int _animeImageEstimateSize(
  AnimeImage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.large;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.medium;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _animeImageSerialize(
  AnimeImage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.large);
  writer.writeString(offsets[1], object.medium);
}

AnimeImage _animeImageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnimeImage(
    large: reader.readStringOrNull(offsets[0]),
    medium: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _animeImageDeserializeProp<P>(
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

extension AnimeImageQueryFilter
    on QueryBuilder<AnimeImage, AnimeImage, QFilterCondition> {
  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> largeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'large',
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> largeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'large',
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> largeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> largeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> largeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> largeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'large',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> largeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> largeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> largeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> largeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'large',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> largeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'large',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition>
      largeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'large',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> mediumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'medium',
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition>
      mediumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'medium',
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> mediumEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> mediumGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> mediumLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> mediumBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> mediumStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> mediumEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> mediumContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> mediumMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medium',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition> mediumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medium',
        value: '',
      ));
    });
  }

  QueryBuilder<AnimeImage, AnimeImage, QAfterFilterCondition>
      mediumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medium',
        value: '',
      ));
    });
  }
}

extension AnimeImageQueryObject
    on QueryBuilder<AnimeImage, AnimeImage, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NameSchema = Schema(
  name: r'Name',
  id: 8655181185809606191,
  properties: {
    r'first': PropertySchema(
      id: 0,
      name: r'first',
      type: IsarType.string,
    ),
    r'last': PropertySchema(
      id: 1,
      name: r'last',
      type: IsarType.string,
    )
  },
  estimateSize: _nameEstimateSize,
  serialize: _nameSerialize,
  deserialize: _nameDeserialize,
  deserializeProp: _nameDeserializeProp,
);

int _nameEstimateSize(
  Name object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.first;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.last;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _nameSerialize(
  Name object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.first);
  writer.writeString(offsets[1], object.last);
}

Name _nameDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Name(
    first: reader.readStringOrNull(offsets[0]),
    last: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _nameDeserializeProp<P>(
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

extension NameQueryFilter on QueryBuilder<Name, Name, QFilterCondition> {
  QueryBuilder<Name, Name, QAfterFilterCondition> firstIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'first',
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> firstIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'first',
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> firstEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'first',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> firstGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'first',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> firstLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'first',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> firstBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'first',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> firstStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'first',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> firstEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'first',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> firstContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'first',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> firstMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'first',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> firstIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'first',
        value: '',
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> firstIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'first',
        value: '',
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> lastIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'last',
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> lastIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'last',
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> lastEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> lastGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> lastLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> lastBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> lastStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'last',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> lastEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'last',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> lastContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'last',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> lastMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'last',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> lastIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last',
        value: '',
      ));
    });
  }

  QueryBuilder<Name, Name, QAfterFilterCondition> lastIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'last',
        value: '',
      ));
    });
  }
}

extension NameQueryObject on QueryBuilder<Name, Name, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const VoiceActorSchema = Schema(
  name: r'VoiceActor',
  id: -994019560413870856,
  properties: {
    r'image': PropertySchema(
      id: 0,
      name: r'image',
      type: IsarType.object,
      target: r'AnimeImage',
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.object,
      target: r'Name',
    )
  },
  estimateSize: _voiceActorEstimateSize,
  serialize: _voiceActorSerialize,
  deserialize: _voiceActorDeserialize,
  deserializeProp: _voiceActorDeserializeProp,
);

int _voiceActorEstimateSize(
  VoiceActor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.image;
    if (value != null) {
      bytesCount += 3 +
          AnimeImageSchema.estimateSize(
              value, allOffsets[AnimeImage]!, allOffsets);
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount +=
          3 + NameSchema.estimateSize(value, allOffsets[Name]!, allOffsets);
    }
  }
  return bytesCount;
}

void _voiceActorSerialize(
  VoiceActor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<AnimeImage>(
    offsets[0],
    allOffsets,
    AnimeImageSchema.serialize,
    object.image,
  );
  writer.writeObject<Name>(
    offsets[1],
    allOffsets,
    NameSchema.serialize,
    object.name,
  );
}

VoiceActor _voiceActorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VoiceActor(
    image: reader.readObjectOrNull<AnimeImage>(
      offsets[0],
      AnimeImageSchema.deserialize,
      allOffsets,
    ),
    name: reader.readObjectOrNull<Name>(
      offsets[1],
      NameSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _voiceActorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<AnimeImage>(
        offset,
        AnimeImageSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectOrNull<Name>(
        offset,
        NameSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension VoiceActorQueryFilter
    on QueryBuilder<VoiceActor, VoiceActor, QFilterCondition> {
  QueryBuilder<VoiceActor, VoiceActor, QAfterFilterCondition> imageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<VoiceActor, VoiceActor, QAfterFilterCondition> imageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'image',
      ));
    });
  }

  QueryBuilder<VoiceActor, VoiceActor, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<VoiceActor, VoiceActor, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }
}

extension VoiceActorQueryObject
    on QueryBuilder<VoiceActor, VoiceActor, QFilterCondition> {
  QueryBuilder<VoiceActor, VoiceActor, QAfterFilterCondition> image(
      FilterQuery<AnimeImage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'image');
    });
  }

  QueryBuilder<VoiceActor, VoiceActor, QAfterFilterCondition> name(
      FilterQuery<Name> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'name');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CoverImageSchema = Schema(
  name: r'CoverImage',
  id: 7258057776603722580,
  properties: {
    r'extraLarge': PropertySchema(
      id: 0,
      name: r'extraLarge',
      type: IsarType.string,
    ),
    r'large': PropertySchema(
      id: 1,
      name: r'large',
      type: IsarType.string,
    ),
    r'medium': PropertySchema(
      id: 2,
      name: r'medium',
      type: IsarType.string,
    )
  },
  estimateSize: _coverImageEstimateSize,
  serialize: _coverImageSerialize,
  deserialize: _coverImageDeserialize,
  deserializeProp: _coverImageDeserializeProp,
);

int _coverImageEstimateSize(
  CoverImage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.extraLarge;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.large;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.medium;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _coverImageSerialize(
  CoverImage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.extraLarge);
  writer.writeString(offsets[1], object.large);
  writer.writeString(offsets[2], object.medium);
}

CoverImage _coverImageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CoverImage(
    extraLarge: reader.readStringOrNull(offsets[0]),
    large: reader.readStringOrNull(offsets[1]),
    medium: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _coverImageDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CoverImageQueryFilter
    on QueryBuilder<CoverImage, CoverImage, QFilterCondition> {
  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition>
      extraLargeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'extraLarge',
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition>
      extraLargeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'extraLarge',
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> extraLargeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extraLarge',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition>
      extraLargeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extraLarge',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition>
      extraLargeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extraLarge',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> extraLargeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extraLarge',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition>
      extraLargeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'extraLarge',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition>
      extraLargeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'extraLarge',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition>
      extraLargeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'extraLarge',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> extraLargeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'extraLarge',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition>
      extraLargeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extraLarge',
        value: '',
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition>
      extraLargeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'extraLarge',
        value: '',
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> largeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'large',
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> largeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'large',
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> largeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> largeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> largeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> largeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'large',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> largeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> largeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> largeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'large',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> largeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'large',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> largeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'large',
        value: '',
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition>
      largeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'large',
        value: '',
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> mediumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'medium',
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition>
      mediumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'medium',
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> mediumEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> mediumGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> mediumLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> mediumBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> mediumStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> mediumEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> mediumContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> mediumMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medium',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition> mediumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medium',
        value: '',
      ));
    });
  }

  QueryBuilder<CoverImage, CoverImage, QAfterFilterCondition>
      mediumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medium',
        value: '',
      ));
    });
  }
}

extension CoverImageQueryObject
    on QueryBuilder<CoverImage, CoverImage, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DateSchema = Schema(
  name: r'Date',
  id: 8536446127664714782,
  properties: {
    r'day': PropertySchema(
      id: 0,
      name: r'day',
      type: IsarType.long,
    ),
    r'month': PropertySchema(
      id: 1,
      name: r'month',
      type: IsarType.long,
    ),
    r'year': PropertySchema(
      id: 2,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _dateEstimateSize,
  serialize: _dateSerialize,
  deserialize: _dateDeserialize,
  deserializeProp: _dateDeserializeProp,
);

int _dateEstimateSize(
  Date object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _dateSerialize(
  Date object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.day);
  writer.writeLong(offsets[1], object.month);
  writer.writeLong(offsets[2], object.year);
}

Date _dateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Date(
    day: reader.readLongOrNull(offsets[0]),
    month: reader.readLongOrNull(offsets[1]),
    year: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _dateDeserializeProp<P>(
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

extension DateQueryFilter on QueryBuilder<Date, Date, QFilterCondition> {
  QueryBuilder<Date, Date, QAfterFilterCondition> dayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'day',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> dayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'day',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> dayEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> dayGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'day',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> dayLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'day',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> dayBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'day',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> monthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'month',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> monthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'month',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> monthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> monthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> monthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> monthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'month',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> yearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> yearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> yearEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> yearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> yearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Date, Date, QAfterFilterCondition> yearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DateQueryObject on QueryBuilder<Date, Date, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TitleSchema = Schema(
  name: r'Title',
  id: -6517538738978647009,
  properties: {
    r'english': PropertySchema(
      id: 0,
      name: r'english',
      type: IsarType.string,
    ),
    r'native': PropertySchema(
      id: 1,
      name: r'native',
      type: IsarType.string,
    ),
    r'romaji': PropertySchema(
      id: 2,
      name: r'romaji',
      type: IsarType.string,
    )
  },
  estimateSize: _titleEstimateSize,
  serialize: _titleSerialize,
  deserialize: _titleDeserialize,
  deserializeProp: _titleDeserializeProp,
);

int _titleEstimateSize(
  Title object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.english;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.native;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.romaji;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _titleSerialize(
  Title object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.english);
  writer.writeString(offsets[1], object.native);
  writer.writeString(offsets[2], object.romaji);
}

Title _titleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Title(
    english: reader.readStringOrNull(offsets[0]),
    native: reader.readStringOrNull(offsets[1]),
    romaji: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _titleDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TitleQueryFilter on QueryBuilder<Title, Title, QFilterCondition> {
  QueryBuilder<Title, Title, QAfterFilterCondition> englishIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'english',
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> englishIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'english',
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> englishEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'english',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> englishGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'english',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> englishLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'english',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> englishBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'english',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> englishStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'english',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> englishEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'english',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> englishContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'english',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> englishMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'english',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> englishIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'english',
        value: '',
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> englishIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'english',
        value: '',
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> nativeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'native',
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> nativeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'native',
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> nativeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'native',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> nativeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'native',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> nativeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'native',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> nativeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'native',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> nativeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'native',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> nativeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'native',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> nativeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'native',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> nativeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'native',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> nativeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'native',
        value: '',
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> nativeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'native',
        value: '',
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> romajiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'romaji',
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> romajiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'romaji',
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> romajiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'romaji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> romajiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'romaji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> romajiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'romaji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> romajiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'romaji',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> romajiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'romaji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> romajiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'romaji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> romajiContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'romaji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> romajiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'romaji',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> romajiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'romaji',
        value: '',
      ));
    });
  }

  QueryBuilder<Title, Title, QAfterFilterCondition> romajiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'romaji',
        value: '',
      ));
    });
  }
}

extension TitleQueryObject on QueryBuilder<Title, Title, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TrailerSchema = Schema(
  name: r'Trailer',
  id: -6626657204066443265,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.string,
    ),
    r'site': PropertySchema(
      id: 1,
      name: r'site',
      type: IsarType.string,
    ),
    r'thumbnail': PropertySchema(
      id: 2,
      name: r'thumbnail',
      type: IsarType.string,
    )
  },
  estimateSize: _trailerEstimateSize,
  serialize: _trailerSerialize,
  deserialize: _trailerDeserialize,
  deserializeProp: _trailerDeserializeProp,
);

int _trailerEstimateSize(
  Trailer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.site;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.thumbnail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _trailerSerialize(
  Trailer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.id);
  writer.writeString(offsets[1], object.site);
  writer.writeString(offsets[2], object.thumbnail);
}

Trailer _trailerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Trailer(
    id: reader.readStringOrNull(offsets[0]),
    site: reader.readStringOrNull(offsets[1]),
    thumbnail: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _trailerDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TrailerQueryFilter
    on QueryBuilder<Trailer, Trailer, QFilterCondition> {
  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> siteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'site',
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> siteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'site',
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> siteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'site',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> siteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'site',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> siteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'site',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> siteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'site',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> siteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'site',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> siteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'site',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> siteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'site',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> siteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'site',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> siteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'site',
        value: '',
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> siteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'site',
        value: '',
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> thumbnailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thumbnail',
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> thumbnailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'thumbnail',
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> thumbnailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> thumbnailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> thumbnailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> thumbnailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thumbnail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> thumbnailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> thumbnailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> thumbnailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> thumbnailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thumbnail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> thumbnailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<Trailer, Trailer, QAfterFilterCondition> thumbnailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thumbnail',
        value: '',
      ));
    });
  }
}

extension TrailerQueryObject
    on QueryBuilder<Trailer, Trailer, QFilterCondition> {}
