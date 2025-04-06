import 'package:flutter/material.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/Logic/services/aniwatch_services.dart';
import '../../Logic/global_functions.dart';
import '../../Logic/models/ani_watch_model.dart';
import '../custom_widgets/bottom_nav_bar_pages.dart';
import '../custom_widgets/anime_details_page_items.dart';

class AnimeDetailsPage extends StatefulWidget {
  final AnimeModel animeModel;
  const AnimeDetailsPage({super.key,required this.animeModel});

  @override
  State<AnimeDetailsPage> createState() => _AnimeDetailsPageState();
}

class _AnimeDetailsPageState extends State<AnimeDetailsPage> {

  late Future<SearchedAnimes> searchedAnimes;
  late Anime bestMatch;

  @override
  void initState() {
    // TODO: implement initState
    searchedAnimes = AniWatchService().searchAnime(widget.animeModel.title.english == "null" ? widget.animeModel.title.romaji!.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), ' ').replaceAll(" ", "-").toLowerCase() : widget.animeModel.title.english!.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), ' ').replaceAll(" ", "-").toLowerCase());
    print("Searching For: ${widget.animeModel.title.english?.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), ' ').replaceAll(" ", "-").toLowerCase()}");
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
      body: FutureBuilder(
        future: searchedAnimes,
        builder: (context,snapshot) {
          if(snapshot.hasData){
            print(snapshot.data!.animes.length);
            bestMatch = findBestAnimeMatch(widget.animeModel.title.english ?? "" , snapshot.data!.animes);
            print(bestMatch.name);
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.4,
                  child: Stack(
                    children: [
                      BannerDetails(animeModel: widget.animeModel,searchedAnimeName: bestMatch.name, anime: bestMatch,),
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
                  child: detailsPages(pageIndex, widget.animeModel, bestMatch),
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
