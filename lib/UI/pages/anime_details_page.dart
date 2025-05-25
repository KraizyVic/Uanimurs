import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/bloc/app_cubit.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/Logic/models/supabase_models.dart';
import 'package:uanimurs/Logic/services/anilist_service.dart';
import 'package:uanimurs/Logic/services/aniwatch_services.dart';
import '../../Logic/global_functions.dart';
import '../../Logic/models/ani_watch_model.dart';
import '../../Logic/models/app_model.dart';
import '../../Logic/models/watch_history.dart';
import '../../Logic/services/supabase_services.dart';
import '../custom_widgets/bottom_nav_bar_pages.dart';
import '../custom_widgets/pages_items/anime_details_page_items.dart';

class AnimeDetailsPage extends StatefulWidget {
  final AnimeModel? animeModel;
  final WatchHistory? watchHistory;
  final SupabaseWatchListModel? supabaseWatchListModel;
  final Anime? preferedAnime;
  final SearchedAnimes? searchedAnimes;
  const AnimeDetailsPage({
    super.key,
    required this.animeModel,
    this.watchHistory,
    this.supabaseWatchListModel,
    this.preferedAnime,
    this.searchedAnimes
  });

  @override
  State<AnimeDetailsPage> createState() => _AnimeDetailsPageState();
}

class _AnimeDetailsPageState extends State<AnimeDetailsPage> {

  late Future<SearchedAnimes> searchedAnimes;
  late Future<AnimeModel> anilistAnimeDetails;
  late Future<Episodes> episodes;
  Anime? bestMatch;
  late Future<WatchHistory> watchHistory;
  late TextEditingController manualSearchController;
  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.supabaseWatchListModel != null){
      anilistAnimeDetails = AnimeService().getAnimeDetails(widget.supabaseWatchListModel?.anilistId ?? 0);
      searchedAnimes = AniWatchService().searchAnime(widget.supabaseWatchListModel?.animeName.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), ' ').replaceAll(" ", "-").toLowerCase() ?? "");
      watchHistory = WatchHistoryService().fetchWatchHistoryById(widget.supabaseWatchListModel?.anilistId ?? 0);
    }else if(widget.watchHistory != null){
      anilistAnimeDetails = AnimeService().getAnimeDetails(widget.watchHistory?.anilistId ?? 0);
      watchHistory = WatchHistoryService().fetchWatchHistoryById(widget.watchHistory?.anilistId ?? 0);
    }else{
      anilistAnimeDetails = Future.value(widget.animeModel);
      searchedAnimes = AniWatchService().searchAnime(widget.animeModel?.title.english == "null" ? widget.animeModel?.title.romaji?.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), ' ').replaceAll(" ", "-").toLowerCase() ?? "" : widget.animeModel?.title.english!.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), ' ').replaceAll(" ", "-").toLowerCase() ?? "");
      watchHistory = WatchHistoryService().fetchWatchHistoryById(widget.animeModel?.alId ?? 0);
    }
    manualSearchController = TextEditingController(text: widget.animeModel?.title.english == "null" ? widget.animeModel?.title.romaji?.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), ' ').replaceAll(" ", "-").toLowerCase() ?? "" : widget.animeModel?.title.english!.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), ' ').replaceAll(" ", "-").toLowerCase() ?? "");

  }

  int pageIndex = 0;
  void changePage(int index){
    setState(() {
      pageIndex = index;
    });
  }

  Widget manualSelect({
    required BuildContext context,
    required SearchedAnimes? searchedAnimes,
    required AnimeModel animeModel,
    required Function(Anime) onSelect, // pass the selected anime back
    required PageController pageController,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Not what you are looking for?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const Text("Select from the list below"),
                  ],
                ),
              ),
              IconButton(onPressed: (){pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);}, icon: Icon(Icons.compare_arrows,))
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Showing results for:",
            style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(animeModel.title.english ?? animeModel.title.romaji ?? animeModel.title.native ?? "NULL",maxLines: 2,overflow: TextOverflow.ellipsis,),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: searchedAnimes == null ? const Center(child: Text("No results")) : ListView.builder(
              itemCount: searchedAnimes.animes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final anime = searchedAnimes.animes[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: MaterialButton(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      onSelect(anime);
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                            Theme.of(context).colorScheme.primary.withAlpha(100),
                            Theme.of(context).colorScheme.surface,
                          ]
                        ),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary.withAlpha(100),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              anime.img ?? "",
                              fit: BoxFit.cover,
                              width: 70,
                              height: 100,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              anime.name ?? "",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppModel?>(
      builder: (context,state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            forceMaterialTransparency: true,
            leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_ios)),
          ),
          body: widget.animeModel != null && widget.preferedAnime == null ? FutureBuilder(
            future: searchedAnimes,
            builder: (context,snapshot) {
              if(snapshot.hasData){
                bestMatch = findBestAnimeMatch(widget.animeModel?.title.english ?? "" , snapshot.data!.animes);
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.4,
                      child: PageView(
                        controller: _pageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          BannerDetails(
                            animeModel: widget.animeModel!,
                            searchedAnimeName: bestMatch?.name ?? "",
                            isInServer: false,
                            anime: bestMatch!,
                            onPressedContinue: (){
                              //episodes = AniWatchService().getEpisodes(widget.watchHistory!.anime!.aniwatchId!);
                            },
                            watchHistory: widget.watchHistory,
                            watchHistoryFuture: watchHistory,
                            onComparePress: (){
                              _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                            },
                            appModel: state!,
                          ),
                          manualSelect(
                            context: context,
                            searchedAnimes: snapshot.data,
                            animeModel: widget.animeModel!,
                            onSelect: (selectedAnime){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: widget.animeModel,preferedAnime: selectedAnime,searchedAnimes: snapshot.data,)));
                            },
                            pageController: _pageController
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: detailsPages(pageIndex, widget.animeModel!, bestMatch!,watchHistory),
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
          ): widget.animeModel != null && widget.preferedAnime!=null ? Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.4,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      BannerDetails(
                        animeModel: widget.animeModel!,
                        searchedAnimeName: widget.preferedAnime?.name ?? "",
                        isInServer: false,
                        anime: widget.preferedAnime!,
                        onPressedContinue: (){
                          //episodes = AniWatchService().getEpisodes(widget.watchHistory!.anime!.aniwatchId!);
                        },
                        watchHistory: widget.watchHistory,
                        watchHistoryFuture: watchHistory,
                        onComparePress: (){},
                        appModel: state!,
                      ),
                      manualSelect(
                          context: context,
                          searchedAnimes: widget.searchedAnimes,
                          animeModel: widget.animeModel!,
                          onSelect: (selectedAnime){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: widget.animeModel,preferedAnime: selectedAnime,searchedAnimes: widget.searchedAnimes,)));
                          },
                          pageController: _pageController
                      ),

                    ]
                  ),
                ),
                Expanded(
                  child: detailsPages(pageIndex, widget.animeModel!, widget.preferedAnime!,watchHistory),
                )
              ],
            ),
          ): widget.watchHistory != null ? FutureBuilder(
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
                              searchedAnimeName: bestMatch?.name ?? "",
                              isInServer: false,
                              anime: bestMatch!,
                              watchHistory: widget.watchHistory,
                              watchHistoryFuture: watchHistory,
                              onPressedContinue: widget.watchHistory != null ?() {
                                episodes = AniWatchService().getEpisodes(widget.watchHistory!.anime!.aniwatchId!);
                              } : null,
                              onComparePress: (){},
                              appModel: state!,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: detailsPages(pageIndex, snapshot.data!, bestMatch!,watchHistory),
                      )
                    ],
                  );
                }else if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),);
                }else{
                  return Center(child: CircularProgressIndicator(),);
                }
              }
          ) : FutureBuilder(
              future: anilistAnimeDetails,
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return FutureBuilder(
                    future: searchedAnimes,
                    builder: (context,searchSnapshot) {
                      if(searchSnapshot.connectionState == ConnectionState.waiting){
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
                      bestMatch = findBestAnimeMatch(widget.supabaseWatchListModel?.animeName ?? "" , searchSnapshot.data!.animes);
                      return Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.4,
                            child: BannerDetails(
                              animeModel: snapshot.data!,
                              searchedAnimeName: bestMatch?.name ?? "",
                              isInServer: false,
                              anime: bestMatch!,
                              watchHistory: widget.watchHistory,
                              watchHistoryFuture: watchHistory,
                              onPressedContinue: widget.watchHistory != null ?() {
                                episodes = AniWatchService().getEpisodes(widget.watchHistory!.anime!.aniwatchId!);
                              } : null,
                              onComparePress: (){},
                              appModel: state!,
                            ),
                          ),
                          Expanded(
                            child: detailsPages(pageIndex, snapshot.data!, bestMatch!,watchHistory),
                          )
                        ],
                      );
                    }
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
    );
  }
}
