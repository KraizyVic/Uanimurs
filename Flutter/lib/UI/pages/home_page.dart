import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uanimurs/Database/constants.dart';
import 'package:uanimurs/Logic/models/app_model.dart';
import 'package:uanimurs/Logic/services/anilist_service.dart';
import 'package:uanimurs/Logic/services/supabase_services.dart';
import 'package:uanimurs/UI/pages/anime_details_page.dart';
import 'package:uanimurs/UI/pages/auth_page.dart';
import 'package:uanimurs/UI/pages/view_all.dart';

import '../../Logic/bloc/app_cubit.dart';
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
    return BlocBuilder<AppCubit,AppModel?>(
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
                                        watchHistory:  null, // <- this makes it return null if nothing matches
                                        ),
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
                                    state!.isLoggedIn ? StreamBuilder(
                                      stream: AccountService().fetchAccount(),
                                      builder: (context,snapshot) {
                                        if(snapshot.connectionState == ConnectionState.waiting){
                                          return CircularProgressIndicator();
                                        }
                                        if(snapshot.hasError){
                                          return Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.red
                                              ),
                                            ),
                                            child: Icon(Icons.error_outline,color: Colors.red),
                                          );
                                        }
                                        return GestureDetector(
                                          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountPage(accountModel: snapshot.data!,))),
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(100),
                                            backgroundImage: pfps[snapshot.data!.avatarId] != null ? AssetImage(pfps[snapshot.data!.avatarId]!) : null,
                                            child: pfps[snapshot.data!.avatarId] == null ? Icon(Icons.person):null,
                                          ),
                                        );
                                      }
                                    ) : GestureDetector(
                                      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthPage())),
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(100),
                                        //backgroundImage: null,
                                        child: Icon(Icons.person),
                                      ),
                                    ),
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
                   state.isLoggedIn && Supabase.instance.client.auth.currentUser != null ? Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 8),
                           child: Row(
                             children: [
                               Text("Continue:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                               SizedBox(width: 10),
                               Text("server",style: TextStyle(color: Colors.green,fontSize: 15),),
                               Spacer(),
                               TextButton(
                                 onPressed: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAll(isStream: true,stream: WatchHistoryService().fetchWatchHistory(),isFromSupabase: true,title: "All server history",)));
                                 },
                                 style: ButtonStyle(
                                   padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 10,)),
                                 ),
                                 child: Text("View all")
                               ),
                             ],
                           ),
                         ),
                         SizedBox(
                             height: 120,
                             child : StreamBuilder(
                               stream: WatchHistoryService().fetchWatchHistory(),
                               builder: (context,snapshot) {
                                 if(snapshot.connectionState == ConnectionState.waiting){
                                   return Center(child: CircularProgressIndicator());
                                 }
                                 if(snapshot.hasError){
                                   return Center(
                                     child: Text("Error: ${snapshot.error}"),
                                   );
                                 }
                                 if(snapshot.data!.isEmpty){
                                   return Center(child: Text("No history found"),);
                                 }
                                 List<WatchHistory> watchHistory = snapshot.data!;
                                 watchHistory.sort((a,b) => b.lastWatched!.compareTo(a.lastWatched!));
                                 return ListView.builder(
                                     itemCount: watchHistory.length > 10 ? 10 : watchHistory.length,
                                     scrollDirection: Axis.horizontal,
                                     itemBuilder: (context,index) {
                                       return WatchHistoryTile(watchHistory: watchHistory[index],);
                                     }
                                 );
                               }
                             )
                         )
                       ]
                   ) : state.watchHistory.isNotEmpty ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Continue:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                            Text("local",style: TextStyle(color: Colors.green,fontSize: 15),),
                            Spacer(),
                            TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAll(isFromLocal: true,title: "All local history",)));
                                },
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 10,)),
                                ),
                                child: Text("View all")
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child : ListView.builder(
                          itemCount: state.watchHistory.length > 10 ? 10 : state.watchHistory.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index) {
                            List<WatchHistory> watchHistory = state.watchHistory.toList();
                            watchHistory.sort((a,b) => b.lastWatched!.compareTo(a.lastWatched!));
                            return WatchHistoryTile(watchHistory: watchHistory[index],);
                          }
                        )
                      )
                    ]
                  ): Container(),
                  SizedBox(
                    height: 250,
                    child: FutureBuilder(
                      future: topRatedAnimes,
                      builder: (context,snapshot) {
                        if(snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Top Rated:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                                    TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAll(items: snapshot.data!,title: "Top Rated"))), child: Text("View all"))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: snapshot.data!.length > 15 ? 15 : snapshot.data!.length ,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context,index){
                                      return AnimeTile(animeModel: snapshot.data![index],onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: snapshot.data![index]))),);
                                    }
                                ),
                              ),
                            ],
                          );
                        }else if(snapshot.hasError) {
                          return Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Top Rated:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                                ErrorMessage(),
                              ],
                            ),
                          );
                        }else {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Top Rated:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                              Expanded(
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ],
                          );
                        }
                      }
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: FutureBuilder(
                      future: popularAnimes,
                      builder: (context,snapshot) {
                        if(snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Popular:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                                    TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAll(items: snapshot.data!,title: "Popular",))), child: Text("View all"))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: snapshot.data!.length > 15 ? 15 : snapshot.data!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context,index){
                                      return AnimeTile(animeModel: snapshot.data![index],onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: snapshot.data![index]))),);
                                    }
                                ),
                              ),
                            ],
                          );
                        }else if(snapshot.hasError) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Popular:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                              ErrorMessage(),
                            ],
                          );
                        }else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Popular:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                              Expanded(child: Center(child: CircularProgressIndicator())),
                            ],
                          );
                        }
                      }
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: FutureBuilder(
                      future: releasingAnimes,
                      builder: (context,snapshot) {
                        if(snapshot.hasData) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Releasing:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                                    TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAll(items: snapshot.data!,title: "Releasing",))), child: Text("View all"))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: snapshot.data!.length > 15 ? 15 : snapshot.data!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context,index){
                                    return AnimeTile(animeModel: snapshot.data![index],onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: snapshot.data![index]))),);
                                  }
                                ),
                              ),
                            ],
                          );
                        }else if(snapshot.hasError) {
                          return Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Releasing:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                                Expanded(child: ErrorMessage()),
                              ],
                            ),
                          );
                        }else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Releasing:",style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                              Expanded(child: Center(child: CircularProgressIndicator())),
                            ],
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
