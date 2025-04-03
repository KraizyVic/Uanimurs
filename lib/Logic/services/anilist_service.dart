import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:uanimurs/Logic/graphql/queries.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';

import '../graphql/graphql_config.dart';

class AnimeService {
  final GraphQLClient _client = GraphQLConfig.client;
  Future<List<AnimeModel>> getTrendingAnimes() async {
    final QueryOptions options = QueryOptions(
      document: gql(Queries.trendingAnime),
    );
    final QueryResult result = await _client.query(options);
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> airingAnimes = result.data?['Page']['media'] ?? [];
    print(airingAnimes.length);
    return airingAnimes.map((json) => AnimeModel.fromJson(json)).toList();
  }

  Future<List<AnimeModel>> getPopularAnimes() async {
    final QueryOptions options = QueryOptions(
      document: gql(Queries.popularAnime),
    );
    final QueryResult result = await _client.query(options);
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> airingAnimes = result.data?['Page']['media'] ?? [];
    print(airingAnimes.length);
    return airingAnimes.map((json) => AnimeModel.fromJson(json)).toList();
  }

  Future<List<AnimeModel>> getReleasingAnimes() async {
    final QueryOptions options = QueryOptions(
      document: gql(Queries.recentlyReleasedAnimes),
    );
    final QueryResult result = await _client.query(options);
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> airingAnimes = result.data?['Page']['media'] ?? [];
    print(airingAnimes.length);
    return airingAnimes.map((json) => AnimeModel.fromJson(json)).toList();
  }

  Future<List<AnimeModel>> searchAnime({
    required String searchTerm,
  }) async {
    final QueryOptions options = QueryOptions(
      document: gql(Queries.searchQuery()),
      variables: {
        'search': searchTerm,
      },
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> mediaList = result.data?['Page']['media'] ?? [];
    return mediaList.map((json) => AnimeModel.fromJson(json)).toList();
  }
}
