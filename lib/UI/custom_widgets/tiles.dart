import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/UI/pages/anime_details_page.dart';
import 'package:uanimurs/UI/pages/player_page.dart';

import '../../Logic/bloc/account_cubit.dart';
import '../../Logic/models/watch_history.dart';

class AnimeListTile extends StatelessWidget {
  final AnimeModel animeModel;
  final VoidCallback onPressed;
  const AnimeListTile({super.key, required this.animeModel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          padding: EdgeInsets.all(0),
          onPressed: onPressed,
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.network(animeModel.coverImage.large ?? "",fit: BoxFit.cover,height: 100,width: 70,)),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        animeModel.title.english == "null" ? animeModel.title.romaji ?? "" : animeModel.title.english ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      Expanded(
                        child: Text(
                          animeModel.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimeTile extends StatelessWidget {

  final AnimeModel animeModel;
  final VoidCallback onPressed;
  const AnimeTile({super.key, required this.animeModel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: 100,
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            //color: Colors.blue,
            onPressed: onPressed,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(animeModel.coverImage.large ?? "",fit: BoxFit.cover,width: double.maxFinite,),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "${animeModel.title.english == "null" ? animeModel.title.romaji : animeModel.title.english}\n",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarouselTile extends StatelessWidget {

  final AnimeModel animeModel;
  final VoidCallback onPressed;
  const CarouselTile({super.key, required this.animeModel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: GestureDetector(
        onTap: onPressed,
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
                children: [
                  Spacer(),
                  Row(
                    children: [
                      ClipRRect( borderRadius: BorderRadius.circular(10),child: Image.network(animeModel.coverImage.extraLarge ?? "", width: 100,fit: BoxFit.cover,)),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star,color: Theme.of(context).colorScheme.primary,),
                                SizedBox(width: 5,),
                                Text("${animeModel.meanScore / 10}"),
                                Spacer(),
                                Text(animeModel.startDate.year.toString())
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text(animeModel.title.english == "null" ? animeModel.title.romaji ?? "" : animeModel.title.english ?? "", maxLines: 2, overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.primary),),
                            SizedBox(height: 5,),
                            Text(animeModel.description,overflow: TextOverflow.ellipsis,maxLines: 3,),
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
      ),
    );
  }
}


class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("lib/UI/assets/ms_girl__gundam_heavyarms_custom_ew__48__by_bryanz09_dcz1ct2.png",height: 150,width: 150,),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Failed to load.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                SizedBox(height: 10,),
                Text("1. Check your internet connection.\n2. Pull down to refresh and WAIT\nOR\nTry again later."),
              ],
            ))
      ],
    );
  }
}

class WatchHistoryTile extends StatelessWidget {
  final WatchHistory watchHistory;
  const WatchHistoryTile({super.key,required this.watchHistory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.all(0),
          elevation: 0,
          onPressed: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerPage(episodeNumber: watchHistory.watchingEpisode ?? 0, streamingLink: watchHistory.streamingLink!, episodes: episodes, animeModel: animeModel, anime: watchHistory.anime!,)));
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: null,watchHistory: watchHistory,)));
          },
          onLongPress: (){
            showDialog(
              context: context,
                builder: (context) {
                return AlertDialog(
                  title: Text("Remove History"),
                  content: Text("Are you sure you want to delete this history?"),
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                        },
                      child: Text("Cancel")
                    ),
                    TextButton(
                      onPressed: (){
                        BlocProvider.of<AccountCubit>(context).removeFromWatchHistory(watchHistory);
                        Navigator.pop(context);
                      },
                      child: Text("Delete")
                    )
                  ],
                );
              }
            );
          },
          child: SizedBox(
            height: double.maxFinite,
            width: 240,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withAlpha(50),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.network(watchHistory.image ?? "")),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        watchHistory.name ?? "",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).colorScheme.primary
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Continue episode : ${watchHistory.watchingEpisode}",
                                    style: TextStyle(color: Theme.of(context).colorScheme.tertiary.withAlpha(150)),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )
                            ),
                            LinearProgressIndicator(
                              value: watchHistory.watchTime! / watchHistory.totalTime!,
                            )
                          ]
                        )
                      ),
                      /*Transform.rotate(
                        angle: 270 * (3.1415926535 / 180),
                        child: Text(
                          "${watchHistory.lastWatched?.day}/${watchHistory.lastWatched?.month}/${watchHistory.lastWatched?.year}",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          ),
                        ),
                      )*/
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}





