import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:uanimurs/Logic/graphql/queries.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';

import '../graphql/graphql_config.dart';

class AnimeService {

  static final AnimeService _instance = AnimeService._internal();
  factory AnimeService() => _instance;
  AnimeService._internal();

  final GraphQLClient _client = GraphQLConfig.client;

  // Cached Futures
  Future<List<AnimeModel>>? _trendingAnimes;
  Future<List<AnimeModel>>? _topRatedAnimes;
  Future<List<AnimeModel>>? _popularAnimes;
  Future<List<AnimeModel>>? _releasingAnimes;

  // Get Trending Anime

  Future<List<AnimeModel>> fetchTrendingAnimes() {
    _trendingAnimes ??= getTrendingAnimes();
    return _trendingAnimes!;
  }

  Future<List<AnimeModel>> getTrendingAnimes() async {
    final QueryOptions options = QueryOptions(
      document: gql(Queries.trendingAnime),
    );
    final QueryResult result = await _client.query(options);
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> airingAnimes = result.data?['Page']['media'] ?? [];
    return airingAnimes.map((json) => AnimeModel.fromJson(json)).toList();
  }

  // Get Recently Updated Anime

  Future<List<AnimeModel>> fetchTopRatedAnimes() {
    _topRatedAnimes ??= getTopRatedAnimes();
    return _topRatedAnimes!;
  }

  Future<List<AnimeModel>> getTopRatedAnimes() async {
    final QueryOptions options = QueryOptions(
      document: gql(Queries.topRatedAnimes),
    );
    final QueryResult result = await _client.query(options);
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> airingAnimes = result.data?['Page']['media'] ?? [];
    return airingAnimes.map((json) => AnimeModel.fromJson(json)).toList();
  }

  // Get Popular Anime

  Future<List<AnimeModel>> fetchPopularAnimes() {
    _popularAnimes ??= getPopularAnimes();
    return _popularAnimes!;
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
    return airingAnimes.map((json) => AnimeModel.fromJson(json)).toList();
  }

  // Get Recently Released Anime

  Future<List<AnimeModel>> fetchReleasingAnimes() {
    _releasingAnimes ??= getReleasingAnimes();
    return _releasingAnimes!;
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
    return airingAnimes.map((json) => AnimeModel.fromJson(json)).toList();
  }

  // Search Anime

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

  // Get Anime Details

  Future<AnimeModel> getAnimeDetails(int id) async {
    final QueryOptions options = QueryOptions(
      document: gql(Queries.animeDetailsQuery()),
      variables: {
        'id': id,
      },
    );
    final QueryResult result = await _client.query(options);
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    final dynamic media = result.data?['Media'];
    return AnimeModel.fromJson(media);
  }

  Future<void> reload() async {
    _trendingAnimes = null;
    _topRatedAnimes = null;
    _popularAnimes = null;
    _releasingAnimes = null;
  }

}
