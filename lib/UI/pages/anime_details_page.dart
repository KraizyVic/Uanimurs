import 'package:flutter/material.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/Logic/services/anilist_service.dart';
import 'package:uanimurs/Logic/services/aniwatch_services.dart';
import 'package:uanimurs/UI/pages/player_page.dart';
import '../../Logic/global_functions.dart';
import '../../Logic/models/ani_watch_model.dart';
import '../../Logic/models/watch_history.dart';
import '../custom_widgets/bottom_nav_bar_pages.dart';
import '../custom_widgets/pages_items/anime_details_page_items.dart';
import 'buffer_page.dart';

class AnimeDetailsPage extends StatefulWidget {
  final AnimeModel? animeModel;
  final WatchHistory? watchHistory;
  const AnimeDetailsPage({super.key,required this.animeModel, this.watchHistory});

  @override
  State<AnimeDetailsPage> createState() => _AnimeDetailsPageState();
}

class _AnimeDetailsPageState extends State<AnimeDetailsPage> {

  late Future<SearchedAnimes> searchedAnimes;
  late Future<AnimeModel>? anilistAnimeDetails;
  late Future<Episodes> episodes;
  late Anime? bestMatch;

  @override
  void initState() {
    // TODO: implement initState
    if(widget.animeModel == null){
      anilistAnimeDetails = AnimeService().getAnimeDetails(widget.watchHistory?.anilistId ?? 0);
    }else{
      anilistAnimeDetails = Future.value(widget.animeModel);
      print(widget.animeModel?.alId);
    }
    searchedAnimes = AniWatchService().searchAnime(widget.animeModel?.title.english == "null" ? widget.animeModel?.title.romaji?.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), ' ').replaceAll(" ", "-").toLowerCase() ?? "" : widget.animeModel?.title.english!.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), ' ').replaceAll(" ", "-").toLowerCase() ?? "");
    print("Searching For: ${widget.animeModel?.title.english == "null" ? widget.animeModel?.title.romaji?.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), ' ').replaceAll(" ", "-").toLowerCase() ?? "" : widget.animeModel?.title.english!.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), ' ').replaceAll(" ", "-").toLowerCase()}");
    super.initState();
  }

  int pageIndex = 0;
  void changePage(int index){
    setState(() {
      pageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.animeModel != null ? FutureBuilder(
        future: searchedAnimes,
        builder: (context,snapshot) {
          if(snapshot.hasData){
            print(snapshot.data!.animes.length);
            bestMatch = findBestAnimeMatch(widget.animeModel?.title.english ?? "" , snapshot.data!.animes);
            print(bestMatch?.name);
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.4,
                  child: Stack(
                    children: [
                      BannerDetails(
                        animeModel: widget.animeModel!,
                        searchedAnimeName: bestMatch?.name ?? "",
                        anime: bestMatch!,
                        onPressedContinue: (){}
                      ),
                      Column(
                        children: [
                          AppBar(
                            forceMaterialTransparency: true,
                            leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_ios)),
                          ),
                          Expanded(child: Container())
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: detailsPages(pageIndex, widget.animeModel!, bestMatch!),
                )
              ],
            );
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }else{
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10,),
                  Text("Searching Anime...")
                ],
              )
            );
          }
        }
      ) : FutureBuilder(
          future: anilistAnimeDetails,
          builder: (context,snapshot){
            if(snapshot.hasData){
              bestMatch = widget.watchHistory?.anime;
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.4,
                    child: Stack(
                      children: [
                        BannerDetails(
                          animeModel: snapshot.data!,
                          searchedAnimeName: bestMatch!.name ?? "",
                          anime: bestMatch!,
                          watchHistory: widget.watchHistory,
                          onPressedContinue: widget.watchHistory != null ?() {
                            //episodes = AniWatchService().getEpisodes(widget.watchHistory!.anime!.aniwatchId!);
                          } : null
                        ),
                        Column(
                          children: [
                            AppBar(
                              forceMaterialTransparency: true,
                              leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_ios)),
                            ),
                            Expanded(child: Container())
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: detailsPages(pageIndex, snapshot.data!, bestMatch!),
                  )
                ],
              );
            }else if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: changePage,
        elevation: 0,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: "Overview"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: "Episodes"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Cast"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: "Thread"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Reviews"
          ),
        ]
      ),
    );
  }
}
