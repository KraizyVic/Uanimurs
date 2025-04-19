import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_similarity/string_similarity.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/UI/pages/buffer_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'bloc/account_cubit.dart';
import 'models/ani_watch_model.dart';
import 'models/github_model.dart';
import 'models/watch_history.dart';


// List of words to ignore
final List<String> wordsToIgnore = ["tv", "movie", "TV", "MOVIE" "(TV)", "(MOVIE)"];

// Normalize title (remove symbols, lowercase, trim)
String cleanTitle(String title) {
  // Convert to lowercase
  title = title.toLowerCase();
  // Remove unwanted words
  for (String word in wordsToIgnore) {
    title = title.replaceAll(RegExp(r'\b' + word + r'\b', caseSensitive: false), '');
  }
  // Remove extra spaces and symbols
  return title.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '').trim();
}

// Find the best match from a list of Anime objects
Anime findBestAnimeMatch(String inputTitle, List<Anime> animeList) {
  String cleanedInputTitle = cleanTitle(inputTitle);
  Anime? bestMatch;
  double highestScore = 0;

  for (Anime anime in animeList) {
    String cleanedAnimeName = cleanTitle(anime.name ?? "");
    double score = StringSimilarity.compareTwoStrings(cleanedInputTitle, cleanedAnimeName);
    //double score = cleanedInputTitle.similarityTo(cleanedAnimeName); // Compare names

    if (score > highestScore) {
      highestScore = score;
      bestMatch = anime;
    }
  }

  return bestMatch ?? Anime(aniwatchId: "", name: "", img: '', episodes: SearchedAnimeEpisodes(eps: 0, sub: 0, dub: 0), duration: '', rated: false);
}

// SHOW BOTTOM SHEETS

void showMyBottomSheet(BuildContext context , Future<Servers> servers,int episodeNumber,Episodes episodes,Anime anime,AnimeModel animeModel) {
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
    builder: (BuildContext bc) {
      return SizedBox(
        height: MediaQuery.of(context).size.height*0.35,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text("SERVERS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.primary),),
            ),
            Expanded(
              child: Center(
                child: FutureBuilder(
                    future: servers,
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                            itemCount: snapshot.data!.sub.length,
                            itemBuilder: (context,index) {
                              return ListTile(
                                onTap: (){
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BufferPage(episodeId: snapshot.data!.episodeId, serverName: snapshot.data!.sub[index].serverName=="vidsrc" ? "vidstreaming" : snapshot.data!.sub[index].serverName,type: "sub",episodeNumber: episodeNumber,episodes: episodes,anime: anime,animeModel: animeModel,)));
                                  //Navigator.pop(bc);
                                },
                                title: Text(
                                  snapshot.data!.sub[index].serverName,
                                  style: TextStyle(color: Theme.of(context).colorScheme.primary.withAlpha(index != 0 ? 255 : 150)),
                                ),
                                subtitle: Text("Multi Quality",style: TextStyle(color: Theme.of(context).colorScheme.tertiary.withAlpha(index != 0 ? 255 : 150))),
                                trailing: Text(
                                  index != 0 ? "Active" : "Inactive",
                                  style: TextStyle(
                                    color: index != 0 ? Colors.green : Colors.red,
                                  ),
                                ),
                              );
                            }
                        );
                      } else if(snapshot.hasError){
                        return Center(child: Text("Error loading SERVER list"),);
                      } else{
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 15,),
                            Text("Loading Servers ...")
                          ],
                        );
                      }
                    }
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

// Show GitHub repository data

void showRepositoryData(BuildContext context, Future<RepositoryModel> fetchRepo){
  showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("About Uanimurs"),
          content: FutureBuilder(
              future: fetchRepo,
              builder: (context,snapshot){
                if (snapshot.hasData){
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text("Repo name"),
                        trailing: Text(snapshot.data!.name),
                      ),
                      ListTile(
                        title: Text("Repo description"),
                        subtitle: Text(snapshot.data!.description),
                      ),
                      ListTile(
                        title: Text("Dev Language"),
                        trailing: Text(snapshot.data!.language),
                      ),
                      ListTile(
                        title: Text("Framework"),
                        trailing: Text("Flutter"),
                      ),
                      ListTile(
                        title: Text("Stars"),
                        trailing: Text(snapshot.data!.stargazersCount.toString()),
                      ),
                      MaterialButton(
                        color: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        onPressed: () async{
                          if (!await launchUrl(Uri.parse("https://github.com/KraizyVic/Uanimurs"))) {
                            throw Exception('Could not launch https://ko-fi.com/kraizyvic');
                          }
                        },
                        child: Text("Star this project"),
                      )
                    ],
                  );
                }else if (snapshot.hasError){
                  return Center(heightFactor: 2,child: Text("Error Loading repository data"));
                }else{
                  return Center(heightFactor: 2, child: CircularProgressIndicator());
                }
              }
          ),
        );
      }
  );
}

// Show GitHub developer data

void showDeveloperData(BuildContext context, Future<DeveloperModel> fetchDeveloper){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
          title: Text("About Developer"),
          content: FutureBuilder(
              future: fetchDeveloper,
              builder: (context,snapshot){
                if (snapshot.hasData){
                  return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(snapshot.data!.avatarUrl),
                        ),
                        SizedBox(height: 5,),
                        Text(snapshot.data!.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
                        SizedBox(height: 5,),
                        Text(snapshot.data!.bio),
                        ListTile(
                          title: Text("Followers"),
                          trailing: Text(snapshot.data!.followers.toString()),
                        ),
                        ListTile(
                          title: Text("Public Repos"),
                          trailing: Text(snapshot.data!.publicRepos.toString()),
                        ),
                        ListTile(
                          title: Text("Job Status"),
                          trailing: Text(snapshot.data!.hireable ? "Available" : "Not Available" , style: TextStyle(color: snapshot.data!.hireable ? Colors.green : Colors.red),),
                        ),
                        MaterialButton(
                          color: Colors.blue,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          onPressed: () async{
                            if (!await launchUrl(Uri.parse("https://ko-fi.com/kraizyvic"))) {
                              throw Exception('Could not launch https://ko-fi.com/kraizyvic');
                            }
                          },
                          child: Text("Support me on Ko-fi"),
                        ),
                      ]
                  );
                }else if (snapshot.hasError){
                  return Center(heightFactor: 2,child: Text("Error Loading developer data"));
                }else{
                  return Center(heightFactor: 2, child: CircularProgressIndicator());
                }
              }
          )
      );
    },
  );
}

// Show Terms of Service

void showTermsOfService(BuildContext context){
  showModalBottomSheet(
      context: context,
      builder: (context){
        return Container(
          height: 400,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text("Terms of Service",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
              Expanded(
                child: ListView.builder(
                    itemCount: termsOfService.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        leading: Text("${index+1}.",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                        title: Text(termsOfService[index]),
                      );
                    }
                ),
              ),
            ],
          ),
        );
      }
  );
}

// Show Privacy Policy

void showPrivacyPolicy(BuildContext context){
  showModalBottomSheet(
      context: context,
      builder: (context){
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Privacy Policy",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                SizedBox(height: 10,),
                Text(privacyPolicy),
                SizedBox(height: 20,),
              ]
          ),
        );
      }
  );
}