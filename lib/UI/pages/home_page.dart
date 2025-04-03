import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:uanimurs/Logic/services/anilist_service.dart';
import 'package:uanimurs/UI/pages/anime_details_page.dart';

import '../../Logic/models/anime_model.dart';
import '../custom_widgets/tiles.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<AnimeModel>> trendingAnimes;
  late Future<List<AnimeModel>> popularAnimes;
  late Future<List<AnimeModel>> releasingAnimes;

  @override
  void initState() {
    trendingAnimes = Future.delayed(Duration(seconds: 1),()=>AnimeService().getTrendingAnimes());
    popularAnimes = Future.delayed(Duration(seconds: 2),()=>AnimeService().getPopularAnimes());
    releasingAnimes = Future.delayed(Duration(seconds: 3),()=>AnimeService().getReleasingAnimes());
    super.initState();
  }

  Future<void> reload() async {
    setState(() {
      trendingAnimes = AnimeService().getTrendingAnimes();
      popularAnimes = AnimeService().getPopularAnimes();
      releasingAnimes = AnimeService().getReleasingAnimes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: reload,
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
                                return CarouselTile(animeModel: snapshot.data![index],onPressed:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: snapshot.data![index]))),);
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
                            print(snapshot.stackTrace);
                            return Center(
                              child: Text(snapshot.error.toString(), style: TextStyle(fontSize: 30,color: Colors.blue,fontWeight: FontWeight.bold),),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10,),
                              Text("UANIMURS",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 30,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("POPULAR:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
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
                      print(snapshot.stackTrace);
                      return Center(
                        child: Text(snapshot.error.toString(), style: TextStyle(fontSize: 30,color: Colors.blue,fontWeight: FontWeight.bold),),
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
                child: Text("RELEASING:",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 20,fontWeight: FontWeight.bold),),
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
                        child: Text(snapshot.error.toString(), style: TextStyle(fontSize: 30,color: Colors.blue,fontWeight: FontWeight.bold),),
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
}
