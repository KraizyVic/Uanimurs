// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SettingsModelSchema = Schema(
  name: r'SettingsModel',
  id: 4013777327486952906,
  properties: {
    r'appearance': PropertySchema(
      id: 0,
      name: r'appearance',
      type: IsarType.object,
      target: r'AppearanceSettings',
    ),
    r'layout': PropertySchema(
      id: 1,
      name: r'layout',
      type: IsarType.object,
      target: r'LayoutSettings',
    ),
    r'player': PropertySchema(
      id: 2,
      name: r'player',
      type: IsarType.object,
      target: r'PlayerSettings',
    ),
    r'subtitles': PropertySchema(
      id: 3,
      name: r'subtitles',
      type: IsarType.object,
      target: r'SubtitleSettings',
    )
  },
  estimateSize: _settingsModelEstimateSize,
  serialize: _settingsModelSerialize,
  deserialize: _settingsModelDeserialize,
  deserializeProp: _settingsModelDeserializeProp,
);

int _settingsModelEstimateSize(
  SettingsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      AppearanceSettingsSchema.estimateSize(
          object.appearance, allOffsets[AppearanceSettings]!, allOffsets);
  bytesCount += 3 +
      LayoutSettingsSchema.estimateSize(
          object.layout, allOffsets[LayoutSettings]!, allOffsets);
  bytesCount += 3 +
      PlayerSettingsSchema.estimateSize(
          object.player, allOffsets[PlayerSettings]!, allOffsets);
  bytesCount += 3 +
      SubtitleSettingsSchema.estimateSize(
          object.subtitles, allOffsets[SubtitleSettings]!, allOffsets);
  return bytesCount;
}

void _settingsModelSerialize(
  SettingsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<AppearanceSettings>(
    offsets[0],
    allOffsets,
    AppearanceSettingsSchema.serialize,
    object.appearance,
  );
  writer.writeObject<LayoutSettings>(
    offsets[1],
    allOffsets,
    LayoutSettingsSchema.serialize,
    object.layout,
  );
  writer.writeObject<PlayerSettings>(
    offsets[2],
    allOffsets,
    PlayerSettingsSchema.serialize,
    object.player,
  );
  writer.writeObject<SubtitleSettings>(
    offsets[3],
    allOffsets,
    SubtitleSettingsSchema.serialize,
    object.subtitles,
  );
}

SettingsModel _settingsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SettingsModel(
    appearance: reader.readObjectOrNull<AppearanceSettings>(
          offsets[0],
          AppearanceSettingsSchema.deserialize,
          allOffsets,
        ) ??
        const AppearanceSettings(),
    layout: reader.readObjectOrNull<LayoutSettings>(
          offsets[1],
          LayoutSettingsSchema.deserialize,
          allOffsets,
        ) ??
        const LayoutSettings(),
    player: reader.readObjectOrNull<PlayerSettings>(
          offsets[2],
          PlayerSettingsSchema.deserialize,
          allOffsets,
        ) ??
        const PlayerSettings(),
    subtitles: reader.readObjectOrNull<SubtitleSettings>(
          offsets[3],
          SubtitleSettingsSchema.deserialize,
          allOffsets,
        ) ??
        const SubtitleSettings(),
  );
  return object;
}

P _settingsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<AppearanceSettings>(
            offset,
            AppearanceSettingsSchema.deserialize,
            allOffsets,
          ) ??
          const AppearanceSettings()) as P;
    case 1:
      return (reader.readObjectOrNull<LayoutSettings>(
            offset,
            LayoutSettingsSchema.deserialize,
            allOffsets,
          ) ??
          const LayoutSettings()) as P;
    case 2:
      return (reader.readObjectOrNull<PlayerSettings>(
            offset,
            PlayerSettingsSchema.deserialize,
            allOffsets,
          ) ??
          const PlayerSettings()) as P;
    case 3:
      return (reader.readObjectOrNull<SubtitleSettings>(
            offset,
            SubtitleSettingsSchema.deserialize,
            allOffsets,
          ) ??
          const SubtitleSettings()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SettingsModelQueryFilter
    on QueryBuilder<SettingsModel, SettingsModel, QFilterCondition> {}

extension SettingsModelQueryObject
    on QueryBuilder<SettingsModel, SettingsModel, QFilterCondition> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition> appearance(
      FilterQuery<AppearanceSettings> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'appearance');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition> layout(
      FilterQuery<LayoutSettings> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'layout');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition> player(
      FilterQuery<PlayerSettings> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'player');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition> subtitles(
      FilterQuery<SubtitleSettings> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'subtitles');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AppearanceSettingsSchema = Schema(
  name: r'AppearanceSettings',
  id: 6428802170289617316,
  properties: {
    r'amoledBackground': PropertySchema(
      id: 0,
      name: r'amoledBackground',
      type: IsarType.bool,
    ),
    r'primaryColor': PropertySchema(
      id: 1,
      name: r'primaryColor',
      type: IsarType.long,
    ),
    r'themeMode': PropertySchema(
      id: 2,
      name: r'themeMode',
      type: IsarType.long,
    ),
    r'useMaterialUI': PropertySchema(
      id: 3,
      name: r'useMaterialUI',
      type: IsarType.bool,
    )
  },
  estimateSize: _appearanceSettingsEstimateSize,
  serialize: _appearanceSettingsSerialize,
  deserialize: _appearanceSettingsDeserialize,
  deserializeProp: _appearanceSettingsDeserializeProp,
);

int _appearanceSettingsEstimateSize(
  AppearanceSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _appearanceSettingsSerialize(
  AppearanceSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.amoledBackground);
  writer.writeLong(offsets[1], object.primaryColor);
  writer.writeLong(offsets[2], object.themeMode);
  writer.writeBool(offsets[3], object.useMaterialUI);
}

AppearanceSettings _appearanceSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppearanceSettings(
    amoledBackground: reader.readBoolOrNull(offsets[0]) ?? false,
    primaryColor: reader.readLongOrNull(offsets[1]) ?? 0xFFFF9900,
    themeMode: reader.readLongOrNull(offsets[2]) ?? 0,
    useMaterialUI: reader.readBoolOrNull(offsets[3]) ?? true,
  );
  return object;
}

P _appearanceSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0xFFFF9900) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AppearanceSettingsQueryFilter
    on QueryBuilder<AppearanceSettings, AppearanceSettings, QFilterCondition> {
  QueryBuilder<AppearanceSettings, AppearanceSettings, QAfterFilterCondition>
      amoledBackgroundEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amoledBackground',
        value: value,
      ));
    });
  }

  QueryBuilder<AppearanceSettings, AppearanceSettings, QAfterFilterCondition>
      primaryColorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primaryColor',
        value: value,
      ));
    });
  }

  QueryBuilder<AppearanceSettings, AppearanceSettings, QAfterFilterCondition>
      primaryColorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'primaryColor',
        value: value,
      ));
    });
  }

  QueryBuilder<AppearanceSettings, AppearanceSettings, QAfterFilterCondition>
      primaryColorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'primaryColor',
        value: value,
      ));
    });
  }

  QueryBuilder<AppearanceSettings, AppearanceSettings, QAfterFilterCondition>
      primaryColorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'primaryColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppearanceSettings, AppearanceSettings, QAfterFilterCondition>
      themeModeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<AppearanceSettings, AppearanceSettings, QAfterFilterCondition>
      themeModeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<AppearanceSettings, AppearanceSettings, QAfterFilterCondition>
      themeModeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<AppearanceSettings, AppearanceSettings, QAfterFilterCondition>
      themeModeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themeMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppearanceSettings, AppearanceSettings, QAfterFilterCondition>
      useMaterialUIEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'useMaterialUI',
        value: value,
      ));
    });
  }
}

extension AppearanceSettingsQueryObject
    on QueryBuilder<AppearanceSettings, AppearanceSettings, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LayoutSettingsSchema = Schema(
  name: r'LayoutSettings',
  id: 3559033267585353040,
  properties: {
    r'layoutType': PropertySchema(
      id: 0,
      name: r'layoutType',
      type: IsarType.long,
    )
  },
  estimateSize: _layoutSettingsEstimateSize,
  serialize: _layoutSettingsSerialize,
  deserialize: _layoutSettingsDeserialize,
  deserializeProp: _layoutSettingsDeserializeProp,
);

int _layoutSettingsEstimateSize(
  LayoutSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _layoutSettingsSerialize(
  LayoutSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.layoutType);
}

LayoutSettings _layoutSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LayoutSettings(
    layoutType: reader.readLongOrNull(offsets[0]) ?? 0,
  );
  return object;
}

P _layoutSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LayoutSettingsQueryFilter
    on QueryBuilder<LayoutSettings, LayoutSettings, QFilterCondition> {
  QueryBuilder<LayoutSettings, LayoutSettings, QAfterFilterCondition>
      layoutTypeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'layoutType',
        value: value,
      ));
    });
  }

  QueryBuilder<LayoutSettings, LayoutSettings, QAfterFilterCondition>
      layoutTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'layoutType',
        value: value,
      ));
    });
  }

  QueryBuilder<LayoutSettings, LayoutSettings, QAfterFilterCondition>
      layoutTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'layoutType',
        value: value,
      ));
    });
  }

  QueryBuilder<LayoutSettings, LayoutSettings, QAfterFilterCondition>
      layoutTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'layoutType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LayoutSettingsQueryObject
    on QueryBuilder<LayoutSettings, LayoutSettings, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SubtitleSettingsSchema = Schema(
  name: r'SubtitleSettings',
  id: -660794179217827385,
  properties: {
    r'backgroundOpacity': PropertySchema(
      id: 0,
      name: r'backgroundOpacity',
      type: IsarType.double,
    ),
    r'fontSize': PropertySchema(
      id: 1,
      name: r'fontSize',
      type: IsarType.double,
    ),
    r'subtitleColor': PropertySchema(
      id: 2,
      name: r'subtitleColor',
      type: IsarType.long,
    )
  },
  estimateSize: _subtitleSettingsEstimateSize,
  serialize: _subtitleSettingsSerialize,
  deserialize: _subtitleSettingsDeserialize,
  deserializeProp: _subtitleSettingsDeserializeProp,
);

int _subtitleSettingsEstimateSize(
  SubtitleSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _subtitleSettingsSerialize(
  SubtitleSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.backgroundOpacity);
  writer.writeDouble(offsets[1], object.fontSize);
  writer.writeLong(offsets[2], object.subtitleColor);
}

SubtitleSettings _subtitleSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SubtitleSettings(
    backgroundOpacity: reader.readDoubleOrNull(offsets[0]) ?? 0.5,
    fontSize: reader.readDoubleOrNull(offsets[1]) ?? 16.0,
    subtitleColor: reader.readLongOrNull(offsets[2]) ?? 0xFFFFFFFF,
  );
  return object;
}

P _subtitleSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset) ?? 0.5) as P;
    case 1:
      return (reader.readDoubleOrNull(offset) ?? 16.0) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0xFFFFFFFF) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SubtitleSettingsQueryFilter
    on QueryBuilder<SubtitleSettings, SubtitleSettings, QFilterCondition> {
  QueryBuilder<SubtitleSettings, SubtitleSettings, QAfterFilterCondition>
      backgroundOpacityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backgroundOpacity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubtitleSettings, SubtitleSettings, QAfterFilterCondition>
      backgroundOpacityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backgroundOpacity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubtitleSettings, SubtitleSettings, QAfterFilterCondition>
      backgroundOpacityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backgroundOpacity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubtitleSettings, SubtitleSettings, QAfterFilterCondition>
      backgroundOpacityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backgroundOpacity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubtitleSettings, SubtitleSettings, QAfterFilterCondition>
      fontSizeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubtitleSettings, SubtitleSettings, QAfterFilterCondition>
      fontSizeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fontSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubtitleSettings, SubtitleSettings, QAfterFilterCondition>
      fontSizeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fontSize',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubtitleSettings, SubtitleSettings, QAfterFilterCondition>
      fontSizeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fontSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SubtitleSettings, SubtitleSettings, QAfterFilterCondition>
      subtitleColorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtitleColor',
        value: value,
      ));
    });
  }

  QueryBuilder<SubtitleSettings, SubtitleSettings, QAfterFilterCondition>
      subtitleColorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtitleColor',
        value: value,
      ));
    });
  }

  QueryBuilder<SubtitleSettings, SubtitleSettings, QAfterFilterCondition>
      subtitleColorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtitleColor',
        value: value,
      ));
    });
  }

  QueryBuilder<SubtitleSettings, SubtitleSettings, QAfterFilterCondition>
      subtitleColorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtitleColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SubtitleSettingsQueryObject
    on QueryBuilder<SubtitleSettings, SubtitleSettings, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PlayerSettingsSchema = Schema(
  name: r'PlayerSettings',
  id: 5441166910175932327,
  properties: {
    r'megaSkipDuration': PropertySchema(
      id: 0,
      name: r'megaSkipDuration',
      type: IsarType.long,
    ),
    r'skipDuration': PropertySchema(
      id: 1,
      name: r'skipDuration',
      type: IsarType.long,
    )
  },
  estimateSize: _playerSettingsEstimateSize,
  serialize: _playerSettingsSerialize,
  deserialize: _playerSettingsDeserialize,
  deserializeProp: _playerSettingsDeserializeProp,
);

int _playerSettingsEstimateSize(
  PlayerSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _playerSettingsSerialize(
  PlayerSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.megaSkipDuration);
  writer.writeLong(offsets[1], object.skipDuration);
}

PlayerSettings _playerSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlayerSettings(
    megaSkipDuration: reader.readLongOrNull(offsets[0]) ?? 60,
    skipDuration: reader.readLongOrNull(offsets[1]) ?? 10,
  );
  return object;
}

P _playerSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 60) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 10) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PlayerSettingsQueryFilter
    on QueryBuilder<PlayerSettings, PlayerSettings, QFilterCondition> {
  QueryBuilder<PlayerSettings, PlayerSettings, QAfterFilterCondition>
      megaSkipDurationEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'megaSkipDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerSettings, PlayerSettings, QAfterFilterCondition>
      megaSkipDurationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'megaSkipDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerSettings, PlayerSettings, QAfterFilterCondition>
      megaSkipDurationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'megaSkipDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerSettings, PlayerSettings, QAfterFilterCondition>
      megaSkipDurationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'megaSkipDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerSettings, PlayerSettings, QAfterFilterCondition>
      skipDurationEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skipDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerSettings, PlayerSettings, QAfterFilterCondition>
      skipDurationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skipDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerSettings, PlayerSettings, QAfterFilterCondition>
      skipDurationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skipDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerSettings, PlayerSettings, QAfterFilterCondition>
      skipDurationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skipDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PlayerSettingsQueryObject
    on QueryBuilder<PlayerSettings, PlayerSettings, QFilterCondition> {}
