import 'package:flutter/material.dart';

import '../../Logic/models/ani_watch_model.dart';
import '../../Logic/models/anime_model.dart';
import '../../Logic/models/watch_history.dart';
import 'pages_items/anime_details_page_items.dart';
import '../pages/home_page.dart';
import '../pages/more_page.dart';
import '../pages/my_list_page.dart';
import '../pages/search_page.dart';

Widget detailsPages(
    int pageIndex,
    AnimeModel animeModel,
    Anime bestMatch,
    Future<WatchHistory> watchHistoryFuture,
){
  switch (pageIndex) {
    case 0:
      return OverviewContent(animeModel: animeModel);
    case 1:
      return EpisodesPage(
        animeId: bestMatch.aniwatchId ?? "",
        searchedAnimeName: bestMatch.name ?? "",
        anime: bestMatch, animeModel: animeModel,
        watchHistoryFuture: watchHistoryFuture,
      );
    case 2:
      return CastPage(animeModel: animeModel);
    case 3:
      return Center(child: Text("Threads Coming Soon"),);
    default:
      return Center(child: Text("No page"),);
  }
}

List<Widget> mainPages = [
  Homepage(),
  SearchPage(),
  MyListPage(),
  MorePage(),
];