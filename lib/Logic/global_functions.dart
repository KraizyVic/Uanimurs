import 'package:flutter/material.dart';
import 'package:string_similarity/string_similarity.dart';
import 'package:uanimurs/UI/pages/buffer_page.dart';

import 'models/ani_watch_model.dart';


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
    String cleanedAnimeName = cleanTitle(anime.name);
    double score = StringSimilarity.compareTwoStrings(cleanedInputTitle, cleanedAnimeName);
    //double score = cleanedInputTitle.similarityTo(cleanedAnimeName); // Compare names

    if (score > highestScore) {
      highestScore = score;
      bestMatch = anime;
    }
  }

  return bestMatch ?? Anime(id: "", name: "", img: '', episodes: SearchedAnimeEpisodes(eps: 0, sub: 0, dub: 0), duration: '', rated: false);
}

// SHOW BOTTOM SHEETS

void showMyBottomSheet(BuildContext context , Future<Servers> servers,int episodeNumber,Episodes episodes) {
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BufferPage(episodeId: snapshot.data!.episodeId, serverName: snapshot.data!.sub[index].serverName=="vidsrc" ? "vidstreaming" : snapshot.data!.sub[index].serverName,type: "sub",episodeNumber: episodeNumber,episodes: episodes,)));
                                  //Navigator.pop(bc);
                                },
                                title: Text(snapshot.data!.sub[index].serverName,style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                                subtitle: Text("Multi Quality"),
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