import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/bloc/account_cubit.dart';
import 'package:uanimurs/Logic/models/account_model.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/Logic/services/aniwatch_services.dart';
import 'package:uanimurs/UI/custom_widgets/buttons.dart';
import 'package:uanimurs/UI/pages/player_page.dart';

import '../../../Logic/global_functions.dart';
import '../../../Logic/models/ani_watch_model.dart';
import '../../../Logic/models/watch_history.dart';
import '../../../constants.dart';
import '../../pages/buffer_page.dart';

class BannerDetails extends StatefulWidget {
  final AnimeModel animeModel;
  final Anime anime;
  final String searchedAnimeName;
  final VoidCallback? onPressedContinue;
  final WatchHistory? watchHistory;
  const BannerDetails({
    super.key,
    required this.animeModel,
    required this.anime,
    required this.searchedAnimeName,
    this.onPressedContinue,
    this.watchHistory
  });

  @override
  State<BannerDetails> createState() => _BannerDetailsState();
}

class _BannerDetailsState extends State<BannerDetails> {
  late Future<Servers> servers;
  late Future<Episodes> episodes;
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
                Text("Found: ${widget.searchedAnimeName}"),
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
                          Text(widget.animeModel.title.english != "null" ? widget.animeModel.title.english?.toUpperCase() ?? "" : widget.animeModel.title.romaji?.toUpperCase() ?? "", maxLines: 3, overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.primary),),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              context.read<AccountCubit>().activeAccount?.watchHistory.any((element) => element.anilistId == widget.animeModel.alId) ?? false ? Expanded(
                                child: CustomTextButton(
                                  onTap: (){
                                    episodes = AniWatchService().getEpisodes(widget.watchHistory?.anime?.aniwatchId ?? "");
                                    showModalBottomSheet(
                                      context: context,
                                      //backgroundColor: Colors.blue[100],
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                      ),
                                      isScrollControlled: true,
                                      enableDrag: true,
                                      useSafeArea: true,
                                      builder: (context){
                                        return SizedBox(
                                            height: MediaQuery.of(context).size.height*0.35,
                                            child: Center(
                                              child: FutureBuilder(
                                                future: episodes,
                                                builder: (context,snapshot){
                                                  if (snapshot.hasData){
                                                    servers = Future.delayed(Duration(seconds: 2),()=>AniWatchService().getServers(snapshot.data!.episodes[widget.watchHistory!.watchingEpisode!-1].episodeId));
                                                    return Column(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 15),
                                                          child: Text("SERVERS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.primary),),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                            child: FutureBuilder(
                                                                future: servers,
                                                                builder: (context,serverSnapshot){
                                                                  if(serverSnapshot.hasData){
                                                                    return ListView.builder(
                                                                      itemCount: serverSnapshot.data!.sub.length,
                                                                      itemBuilder: (context,index){
                                                                        int wathedEpisode = widget.watchHistory!.watchingEpisode! - 1;
                                                                        return ListTile(
                                                                          onTap: (){
                                                                            Navigator.pop(context);
                                                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BufferPage(episodeId: serverSnapshot.data!.episodeId, serverName: serverSnapshot.data!.sub[index].serverName=="vidsrc" ? "vidstreaming" : serverSnapshot.data!.sub[index].serverName,type: "sub",episodeNumber: wathedEpisode ,episodes: snapshot.data!,anime: widget.anime, animeModel: widget.animeModel,watchHistory: widget.watchHistory,)));
                                                                          },
                                                                          title: Text(
                                                                            serverSnapshot.data!.sub[index].serverName,
                                                                            style: TextStyle(
                                                                              color: Theme.of(context).colorScheme.primary.withAlpha(index != unresponsiveServer ? 255 : 150),
                                                                            ),
                                                                          ),
                                                                          subtitle: Text(
                                                                            "Multi Quality",
                                                                            style: TextStyle(
                                                                              color: Theme.of(context).colorScheme.tertiary.withAlpha(index != unresponsiveServer ? 255 : 150)
                                                                            )
                                                                          ),
                                                                          trailing: Text(
                                                                            index != unresponsiveServer ? "Active" : "Inactive",
                                                                            style: TextStyle(
                                                                              color: index != unresponsiveServer ? Colors.green : Colors.red,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  }else if(serverSnapshot.hasError){
                                                                    return Center(child: Text("Error loading SERVER list"),);
                                                                  }else{
                                                                    return Column(
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                          CircularProgressIndicator(),
                                                                          SizedBox(height: 15,),
                                                                          Text("Loading Servers ...")
                                                                        ]
                                                                    );
                                                                  }
                                                                }
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }else if(snapshot.hasError){
                                                    return Center(child: Text("Error loading EPISODES list"),);
                                                  }else{
                                                    return Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        CircularProgressIndicator(),
                                                        SizedBox(height: 15,),
                                                        Text("Loading Episode ...")
                                                      ],
                                                    );
                                                  }
                                                },
                                              ),
                                            )
                                        );
                                      }
                                    );
                                  },
                                  buttonName: "Continue"
                                ),
                              ) : Container(),
                              SizedBox(width: 6,),
                              Expanded(
                                child: BlocBuilder<AccountCubit, List<AccountModel>>(
                                  builder: (context, state) {

                                    // Check if the anime is in the active account's watchList
                                    final isInList = context.read<AccountCubit>().activeAccount!.watchList.any((anime) => anime.malId == widget.animeModel.malId);

                                    return CustomTextButton(
                                      isFilled: isInList,
                                      onTap: () async {
                                        if (isInList) {
                                          // Remove anime from the watchList
                                          await BlocProvider.of<AccountCubit>(context).removeFromWatchList(widget.animeModel);
                                        } else {
                                          // Add anime to the watchList
                                          await BlocProvider.of<AccountCubit>(context).addToWatchList(widget.animeModel);
                                        }
                                      },
                                      buttonName: isInList ? "- List" : "+ List",
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 6,),
                              Expanded(
                                child: CustomTextButton(
                                  onTap: (){
                                    episodes = AniWatchService().getEpisodes(widget.anime.aniwatchId ?? "");
                                    showModalBottomSheet(
                                      context: context,
                                      //backgroundColor: Colors.blue[100],
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                      ),
                                      isScrollControlled: true,
                                      enableDrag: true,
                                      useSafeArea: true,
                                      builder: (context){
                                        return SizedBox(
                                          height: MediaQuery.of(context).size.height*0.35,
                                          child: Center(
                                            child: FutureBuilder(
                                              future: episodes,
                                              builder: (context,snapshot){
                                                if (snapshot.hasData){
                                                  servers = Future.delayed(Duration(seconds: 2),()=>AniWatchService().getServers(snapshot.data!.episodes[0].episodeId));
                                                  return Column(
                                                  children: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                                        child: Text("SERVERS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.primary),),
                                                      ),
                                                      Expanded(
                                                        child: Center(
                                                          child: FutureBuilder(
                                                            future: servers,
                                                              builder: (context,serverSnapshot){
                                                                if(serverSnapshot.hasData){
                                                                  return ListView.builder(
                                                                    itemCount: serverSnapshot.data!.sub.length,
                                                                    itemBuilder: (context,index){
                                                                      return ListTile(
                                                                        onTap: (){
                                                                          Navigator.pop(context);
                                                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BufferPage(episodeId: serverSnapshot.data!.episodeId, serverName: serverSnapshot.data!.sub[index].serverName=="vidsrc" ? "vidstreaming" : serverSnapshot.data!.sub[index].serverName,type: "sub",episodeNumber: 0,episodes: snapshot.data!,anime: widget.anime, animeModel: widget.animeModel,)));
                                                                        },
                                                                        title: Text(
                                                                          serverSnapshot.data!.sub[index].serverName,
                                                                          style: TextStyle(
                                                                              color: Theme.of(context).colorScheme.primary.withAlpha(index != unresponsiveServer ? 255 : 150)
                                                                          ),
                                                                        ),
                                                                        subtitle: Text(
                                                                          "Multi Quality",
                                                                          style: TextStyle(
                                                                              color: Theme.of(context).colorScheme.tertiary.withAlpha(index != unresponsiveServer ? 255 : 150)
                                                                          ),
                                                                        ),
                                                                        trailing: Text(
                                                                          index != unresponsiveServer ? "Active" : "Inactive",
                                                                          style: TextStyle(
                                                                            color: index != unresponsiveServer ? Colors.green : Colors.red,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                }else if(serverSnapshot.hasError){
                                                                  return Center(child: Text("Error loading SERVER list"),);
                                                                }else{
                                                                  return Column(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      CircularProgressIndicator(),
                                                                      SizedBox(height: 15,),
                                                                      Text("Loading Servers ...")
                                                                    ]
                                                                  );
                                                                }
                                                              }
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    );
                                                }else if(snapshot.hasError){
                                                  return Center(child: Text("Error loading EPISODES list"),);
                                                }else{
                                                  return Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      CircularProgressIndicator(),
                                                      SizedBox(height: 15,),
                                                      Text("Loading Episode ...")
                                                    ],
                                                  );
                                                }
                                              },
                                            ),
                                          )
                                        );
                                      }
                                    );
                                  },
                                  buttonName: "Play",
                                  isFilled: true,
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

  const EpisodesPage({super.key, required this.animeId, required this.searchedAnimeName, required this.anime, required this.animeModel});

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
            child: ListView.builder(
              itemCount: snapshot.data!.episodes.length,
              itemBuilder: (context , index){
                return ListTile(
                  onTap: (){
                    servers = AniWatchService().getServers(snapshot.data!.episodes[index].episodeId);
                    showMyBottomSheet(context, servers,index,snapshot.data!,widget.anime,widget.animeModel);
                  },
                  //tileColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  leading: Text("${index+1}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.primary),),
                  title: Text(snapshot.data!.episodes[index].name),
                  subtitle: Text(snapshot.data!.episodes[index].filler == true ? "Filler" : "Episode")
                );
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

