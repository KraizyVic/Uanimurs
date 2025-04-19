import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:uanimurs/Logic/services/anilist_service.dart';
import 'package:uanimurs/UI/pages/anime_details_page.dart';

import '../../Logic/bloc/account_cubit.dart';
import '../../Logic/models/account_model.dart';
import '../../Logic/models/anime_model.dart';
import '../../Logic/models/watch_history.dart';
import '../custom_widgets/tiles.dart';
import 'more_page_pages/account_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key,});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<AnimeModel>> trendingAnimes;
  late Future<List<AnimeModel>> topRatedAnimes;
  late Future<List<AnimeModel>> popularAnimes;
  late Future<List<AnimeModel>> releasingAnimes;

  final AnimeService _animeService = AnimeService();

  @override
  void initState() {
    super.initState();
    trendingAnimes = _animeService.getTrendingAnimes();
    topRatedAnimes = _animeService.getTopRatedAnimes();
    popularAnimes = _animeService.getPopularAnimes();
    releasingAnimes = _animeService.getReleasingAnimes();
  }

  Future<void> _refresh() async {
    await _animeService.reload();
    setState(() {
      trendingAnimes = _animeService.getTrendingAnimes();
      topRatedAnimes = _animeService.getTopRatedAnimes();
      popularAnimes = _animeService.getPopularAnimes();
      releasingAnimes = _animeService.getReleasingAnimes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit,List<AccountModel>>(
      builder: (context,state) {
        return Scaffold(
          body: RefreshIndicator(
            displacement: 100,
            onRefresh: _refresh,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.45,
                    child: Stack(
                      children: [
                        FutureBuilder(
                          future: trendingAnimes,
                          builder: (context,snapshot) {
                            if(snapshot.hasData) {
                              return FlutterCarousel.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context,index,realIndex) {
                                  return CarouselTile(
                                    animeModel: snapshot.data![index],
                                    onPressed:()=>Navigator.push(
                                      context, MaterialPageRoute(
                                      builder: (context)=>AnimeDetailsPage(
                                        animeModel: snapshot.data![index],
                                        watchHistory:  context.read<AccountCubit>().activeAccount?.watchHistory.firstWhere(
                                          (element) => element.anilistId == snapshot.data![index].alId,
                                          orElse: () => WatchHistory(anilistId: null, anime: null), // <- this makes it return null if nothing matches
                                        ),
                                      )
                                    )
                                    )
                                  );
                                },
                                options: FlutterCarouselOptions(
                                  autoPlay: true,
                                  pauseAutoPlayOnTouch: true,
                                  viewportFraction: 1,
                                  height: double.maxFinite,
                                  showIndicator: false
                                )
                              );
                            }else if(snapshot.hasError) {
                              return Center(
                                child: ErrorMessage()
                              );
                            }else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Text("UANIMURS",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 30,fontWeight: FontWeight.bold),),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountPage())),
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundImage: AssetImage(context.read<AccountCubit>().activeAccount?.pfp ?? ""),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        )
                      ],
                    ),
                  ),
                  context.read<AccountCubit>().activeAccount!.watchHistory.isNotEmpty ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Continue:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          itemCount: context.read<AccountCubit>().activeAccount!.watchHistory.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return WatchHistoryTile(watchHistory: context.read<AccountCubit>().activeAccount!.watchHistory.toList().reversed.elementAt(index),);
                          }
                        ),
                      ),
                    ],
                  ):SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Top Rated:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                    height: 200,
                    child: FutureBuilder(
                      future: topRatedAnimes,
                      builder: (context,snapshot) {
                        if(snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index){
                                return AnimeTile(animeModel: snapshot.data![index],onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: snapshot.data![index]))),);
                              }
                          );
                        }else if(snapshot.hasError) {
                          return Center(
                            child: ErrorMessage(),
                          );
                        }else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Popular:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                    height: 200,
                    child: FutureBuilder(
                      future: popularAnimes,
                      builder: (context,snapshot) {
                        if(snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index){
                                return AnimeTile(animeModel: snapshot.data![index],onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: snapshot.data![index]))),);
                              }
                          );
                        }else if(snapshot.hasError) {
                          return Center(
                            child: ErrorMessage(),
                          );
                        }else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Releasing:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                    height: 200,
                    child: FutureBuilder(
                      future: releasingAnimes,
                      builder: (context,snapshot) {
                        if(snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return AnimeTile(animeModel: snapshot.data![index],onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: snapshot.data![index]))),);
                            }
                          );
                        }else if(snapshot.hasError) {
                          print(snapshot.stackTrace);
                          return Center(
                            child: ErrorMessage(),
                          );
                        }else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
