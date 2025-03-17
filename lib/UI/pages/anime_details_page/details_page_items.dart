import 'package:flutter/material.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/Logic/services/aniwatch_services.dart';
import 'package:uanimurs/UI/custom_widgets/buttons.dart';

import '../../../Logic/global_functions.dart';
import '../../../Logic/models/ani_watch_model.dart';

class BannerDetails extends StatelessWidget {
  final AnimeModel animeModel;
  final String searchedAnimeName;
  const BannerDetails({super.key, required this.animeModel, required this.searchedAnimeName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Image.network(animeModel.bannerImage,fit: BoxFit.cover,height: double.maxFinite,width: double.maxFinite,),
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
                Text("Found: $searchedAnimeName"),
                SizedBox(height: 5,),
                Row(
                  children: [
                    ClipRRect( borderRadius: BorderRadius.circular(10),child: Image.network(animeModel.coverImage.extraLarge, width: 100,fit: BoxFit.cover,)),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          Text(animeModel.title.english != "null" ? animeModel.title.english.toUpperCase() : animeModel.title.romaji.toUpperCase(), maxLines: 3, overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.primary),),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomTextButton(
                                  onTap: (){},
                                  buttonName: "Trailer"
                                ),
                              ),
                              SizedBox(width: 6,),
                              Expanded(child: CustomTextButton(onTap: (){}, buttonName: "+ List")),
                              SizedBox(width: 6,),
                              CustomTextButton(onTap: (){
                                AniWatchService().getEpisodes("solo-leveling-season-2-arise-from-the-shadow-19413?ref=search");
                              }, buttonName: "Play",isFilled: true,),
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
              child: Text(animeModel.title.native),
            ),
            SizedBox(height: 10,),
            Text("Romanji title:",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary,fontSize: 18),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(animeModel.title.romaji),
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
      itemCount: animeModel.characters.edges.length,
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
                      animeModel.characters.edges[index].node!.image.large,
                      height: 60,width: 60,fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${animeModel.characters.edges[index].node!.name.first} ${ animeModel.characters.edges[index].node!.name.last}"),
                      Text(animeModel.characters.edges[index].role)
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
  const EpisodesPage({super.key, required this.animeId, required this.searchedAnimeName});

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
              itemBuilder: (context,index){
                return ListTile(
                  onTap: (){
                    servers = AniWatchService().getServers(snapshot.data!.episodes[index].episodeId);
                    showMyBottomSheet(context, servers);
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

