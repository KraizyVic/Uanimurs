import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uanimurs/Logic/bloc/app_cubit.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/Logic/models/app_model.dart';
import 'package:uanimurs/Logic/services/aniwatch_services.dart';
import 'package:uanimurs/Logic/services/supabase_services.dart';
import 'package:uanimurs/UI/custom_widgets/buttons.dart';
import 'package:uanimurs/UI/custom_widgets/widgets.dart';

import '../../../Logic/global_functions.dart';
import '../../../Logic/models/ani_watch_model.dart';
import '../../../Logic/models/supabase_models.dart';
import '../../../Logic/models/watch_history.dart';
import '../../../Database/constants.dart';
import '../../pages/buffer_page.dart';

class BannerDetails extends StatefulWidget {
  final AnimeModel animeModel;
  final Anime anime;
  final bool isInServer;
  final String searchedAnimeName;
  final VoidCallback? onPressedContinue;
  final WatchHistory? watchHistory;
  final Future<WatchHistory> watchHistoryFuture;
  final VoidCallback onComparePress;
  final AppModel appModel;
  const BannerDetails({
    super.key,
    required this.animeModel,
    required this.anime,
    required this.isInServer,
    required this.searchedAnimeName,
    this.onPressedContinue,
    this.watchHistory,
    required this.watchHistoryFuture,
    required this.onComparePress,
    required this.appModel
  });

  @override
  State<BannerDetails> createState() => _BannerDetailsState();
}

class _BannerDetailsState extends State<BannerDetails> {
  late Future<Servers> servers;
  late Future<Episodes> episodes;
  late Future<WatchHistory> watchHistory;

  late String animeName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    watchHistory = WatchHistoryService().fetchWatchHistoryById(widget.animeModel.alId);
    animeName = widget.animeModel.title.english == "null" ? widget.animeModel.title.romaji ?? "" : widget.animeModel.title.english ?? "";
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Image.network(widget.animeModel.bannerImage,fit: BoxFit.cover,height: double.maxFinite,width: double.maxFinite,),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.surface.withAlpha(255),
                    Theme.of(context).colorScheme.surface.withAlpha(150),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Row(
                  children: [
                    Expanded(child: Text("Found: ${widget.searchedAnimeName}")),
                    IconButton(
                      onPressed: widget.onComparePress,
                      icon: Icon(Icons.compare_arrows,)
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: 150,
                          width: 100,
                          child: PageView(
                            scrollDirection: Axis.vertical,
                            physics: AlwaysScrollableScrollPhysics(),
                            onPageChanged: (index){
                              setState(() {
                                animeName = index == 1 ? widget.anime.name! : widget.animeModel.title.english == "null" ? widget.animeModel.title.romaji ?? "" : widget.animeModel.title.english ?? "";
                              });
                            },
                            children: [
                              Image.network(widget.animeModel.coverImage.extraLarge ?? "",fit: BoxFit.cover,height: 150,width: 100,),
                              Image.network(widget.anime.img ?? "",fit: BoxFit.cover,height: 150,width: 100,),
                            ]
                          ),
                        ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          Text(animeName, maxLines: 3, overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.primary),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Supabase.instance.client.auth.currentSession == null && widget.appModel.watchHistory.any((element) => element.anilistId == widget.animeModel.alId) ? Expanded(
                                child: customTextButton(
                                  context: context,
                                  onTap: (){
                                    episodes = AniWatchService().getEpisodes(widget.anime.aniwatchId ?? "");
                                    showEpisodeModal(
                                      context: context,
                                      episodes: episodes,
                                      anime: widget.anime,
                                      animeModel: widget.animeModel,
                                      watchHistory: BlocProvider.of<AppCubit>(context).state?.watchHistory.firstWhere((element) => element.anilistId == widget.animeModel.alId),
                                    );
                                  },
                                  buttonName: "Continue"
                                ),
                              ) : StreamBuilder(
                                stream: Supabase.instance.client.from("watch_history").stream(primaryKey: ["id"]).map((event) => event.map((e) => WatchHistory.fromJson(e)).where((anime) => anime.anilistId == widget.animeModel.alId).toList()),
                                builder: (context, snapshot) {
                                  if(snapshot.connectionState == ConnectionState.waiting){
                                    return Container();
                                  }
                                  if(snapshot.hasData){
                                    if(snapshot.data!.isNotEmpty){
                                      return Expanded(
                                        child: customTextButton(
                                            context: context,
                                            isFilled: false,
                                            onTap: () {
                                              //print(snapshot.data!.first.image);
                                              episodes = AniWatchService().getEpisodes(widget.anime.aniwatchId ?? "");
                                              showEpisodeModal(
                                                context: context,
                                                episodes: episodes,
                                                anime: widget.anime,
                                                animeModel: widget.animeModel,
                                                watchHistory: snapshot.data!.first
                                              );
                                            },
                                            buttonName: 'Continue'
                                        ),
                                      );
                                    }else{
                                      return Container();
                                    }
                                  }
                                  return Container();
                                }
                              ),
                              SizedBox(width: 6,),
                              Expanded(
                                child: BlocBuilder<AppCubit, AppModel?>(
                                  builder: (context, state) {
                                    if (state!.isLoggedIn){
                                      return StreamBuilder(
                                        stream: Supabase.instance.client.from("watchList").stream(primaryKey: ["id"]).map((event) => event.map((e) => SupabaseWatchListModel.fromJson(e)).where((anime) => anime.anilistId == widget.animeModel.alId).toList()),
                                        builder: (context,snapshot){
                                          if(snapshot.connectionState == ConnectionState.waiting){
                                            return Center(child: CircularProgressIndicator());
                                          }
                                          if(snapshot.hasData){
                                            if(snapshot.data!.isNotEmpty){
                                              return customTextButton(
                                                  context: context,
                                                  isFilled: true,
                                                  onTap: () => WatchListService().deleteAnime(snapshot.data!.first),
                                                  buttonName: 'Remove'
                                              );
                                            }else{
                                              return customTextButton(
                                                context: context,
                                                isFilled: false,
                                                onTap: () => WatchListService().addAnime(widget.animeModel,state.userList.length),
                                                buttonName: 'Add',
                                              );
                                            }
                                          }
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(),
                                              color: Colors.red
                                            ),
                                            child: Text("Error"),
                                          );
                                        }
                                      );
                                    }
                                    final isInLocalList = state.userList.any((item) => item.alId == widget.animeModel.alId);
                                    return customTextButton(
                                      context: context,
                                      isFilled: isInLocalList,
                                      onTap: () {
                                        if (isInLocalList) {
                                          context.read<AppCubit>().removeFromWatchList(state.userList.firstWhere((item)=>item.alId == widget.animeModel.alId));
                                        } else {
                                          context.read<AppCubit>().addToWatchList(widget.animeModel);
                                        }
                                      },
                                      buttonName: isInLocalList ? "Remove" : "Add",
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 6,),
                              Expanded(
                                child: FutureBuilder(
                                  future: widget.watchHistoryFuture,
                                  builder: (context, asyncSnapshot) {
                                    if(asyncSnapshot.connectionState == ConnectionState.waiting){
                                      return Container();
                                    }else if(asyncSnapshot.hasData){
                                      return customTextButton(
                                        context: context,
                                        onTap: (){
                                          episodes = AniWatchService().getEpisodes(widget.anime.aniwatchId ?? "");
                                          showFirstEpisodeModal(
                                            context: context,
                                            episodes: episodes,
                                            anime: widget.anime,
                                            animeModel: widget.animeModel,
                                            watchHistory: asyncSnapshot.data,
                                            isInWatchHistory: true,
                                          );
                                        },
                                        buttonName: "Play",
                                        isFilled: true,
                                      );
                                    }else{
                                      print(asyncSnapshot.error);
                                      return customTextButton(
                                        context: context,
                                        onTap: (){
                                          episodes = AniWatchService().getEpisodes(widget.anime.aniwatchId ?? "");
                                          showFirstEpisodeModal(
                                            context: context,
                                            episodes: episodes,
                                            anime: widget.anime,
                                            animeModel: widget.animeModel,
                                            watchHistory: null,
                                            isInWatchHistory: false,
                                          );
                                        },
                                        buttonName: "Play",
                                        isFilled: true,
                                      );
                                    }
                                  }
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class OverviewContent extends StatelessWidget {
  final AnimeModel animeModel;
  const OverviewContent({super.key, required this.animeModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Text("Genres",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary,fontSize: 18),),
            SizedBox(height: 10,),
            SizedBox(
              height: 30,
              child: ListView.builder(
                itemCount: animeModel.genres.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1,color: Theme.of(context).colorScheme.tertiary),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Center(child: Text(animeModel.genres[index])),
                      )),
                  );
                }
              ),
            ),
            SizedBox(height: 10,),
            Text("Native title:",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary,fontSize: 18),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(animeModel.title.native ?? ""),
            ),
            SizedBox(height: 10,),
            Text("Romanji title:",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary,fontSize: 18),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(animeModel.title.romaji ?? ""),
            ),
            SizedBox(height: 10,),
            Text("Description:",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary,fontSize: 18),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(animeModel.description.trim()),
            ),
            SizedBox(height: 10,),
            Text("More Data:",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary,fontSize: 18),),
            ListTile(
              title: Text("Type"),
              trailing: Text(animeModel.type),
            ),
            ListTile(
              title: Text("Rating"),
              trailing: Text("${animeModel.meanScore}/100"),
            ),
            ListTile(
              title: Text("Popularity"),
              trailing: Text("${animeModel.popularity}"),
            ),
            ListTile(
              title: Text("Episodes"),
              trailing: Text(animeModel.episodes.toString()),
            ),
            ListTile(
              title: Text("Status"),
              trailing: Text(animeModel.status),
            ),
            ListTile(
              title: Text("Start Date"),
              trailing: Text("${animeModel.startDate.day}/${animeModel.startDate.month}/${animeModel.startDate.year}"),
            ),
            ListTile(
              title: Text("End Date"),
              trailing: Text(animeModel.endDate.year == 0 ? "N/A" : "${animeModel.endDate.day}/${animeModel.endDate.month}/${animeModel.endDate.year}"),
            ),
          ],
        ),
      ),
    );
  }
}

class CastPage extends StatelessWidget {
  final AnimeModel animeModel;
  const CastPage({super.key, required this.animeModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: animeModel.characters.edges?.length,
      itemBuilder: (context,index)=>Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 80,
            child: MaterialButton(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              onPressed: (){},
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      animeModel.characters.edges?[index].node!.image?.large ?? "",
                      height: 60,width: 60,fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${animeModel.characters.edges?[index].node!.name?.first ?? ""} ${ animeModel.characters.edges?[index].node!.name?.last ?? ""}"),
                      Text(animeModel.characters.edges?[index].role ?? "")
                    ]
                  ),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EpisodesPage extends StatefulWidget {
  final String animeId;
  final String searchedAnimeName;
  final Anime anime;
  final AnimeModel animeModel;
  final WatchHistory? watchHistory;
  final Future<WatchHistory> watchHistoryFuture;

  const EpisodesPage({
    super.key,
    required this.animeId,
    required this.searchedAnimeName,
    required this.anime,
    required this.animeModel,
    this.watchHistory,
    required this.watchHistoryFuture,
  });

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  late Future<Episodes> episodes;
  late Future<Servers> servers;

  @override
  void initState() {
    // TODO: implement initState
    episodes = AniWatchService().getEpisodes(widget.animeId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: episodes,
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10
            ),
            child: FutureBuilder(
              future: widget.watchHistoryFuture,
              builder: (context, historySnapshot){
                if(historySnapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(historySnapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.episodes.length,
                    itemBuilder: (context , index){
                      return ListTile(
                        onTap: (){
                          servers = AniWatchService().getServers(snapshot.data!.episodes[index].episodeId);
                          showMyBottomSheet(
                            context: context,
                            servers: servers,
                            episodeNumber: index,
                            episodes: snapshot.data!,
                            anime: widget.anime,
                            animeModel: widget.animeModel,
                            watchHistory: historySnapshot.data,
                            isInWatchHistory: true,
                          );
                        },
                        //tileColor: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        leading: Text("${index+1}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.primary),),
                        title: Text(snapshot.data!.episodes[index].name),
                        subtitle: Text(snapshot.data!.episodes[index].filler == true ? "Filler" : "Episode")
                      );
                    }
                  );
                }else{
                  return ListView.builder(
                      itemCount: snapshot.data!.episodes.length,
                      itemBuilder: (context , index){
                        return ListTile(
                            onTap: (){
                              servers = AniWatchService().getServers(snapshot.data!.episodes[index].episodeId);
                              showMyBottomSheet(
                                context: context,
                                servers: servers,
                                episodeNumber: index,
                                episodes: snapshot.data!,
                                anime: widget.anime,
                                animeModel: widget.animeModel,
                                watchHistory: widget.watchHistory,
                                isInWatchHistory: false,
                              );
                            },
                            //tileColor: Colors.blue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            leading: Text("${index+1}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.primary),),
                            title: Text(snapshot.data!.episodes[index].name),
                            subtitle: Text(snapshot.data!.episodes[index].filler == true ? "Filler" : "Episode")
                        );
                      }
                  );
                }
              }
            ),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}

