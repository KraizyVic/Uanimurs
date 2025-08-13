import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/bloc/app_cubit.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/Logic/models/watch_history.dart';
import 'package:uanimurs/Logic/services/supabase_services.dart';
import 'package:uanimurs/UI/custom_widgets/tiles.dart';
import 'package:uanimurs/UI/pages/anime_details_page.dart';

import '../../Logic/models/app_model.dart';

class ViewAll extends StatelessWidget {
  final List items;
  final bool isStream;
  final Stream? stream;
  final bool isFromSupabase;
  final bool isFromLocal;
  final String title;
  const ViewAll({
    super.key,
    this.title = "View all",
    this.items = const [],
    this.isStream = false,
    this.stream,
    this.isFromSupabase = false,
    this.isFromLocal = false,
  });

  @override
  Widget build(BuildContext context) {
    return isFromLocal || isFromSupabase ? DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text(title),
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Theme.of(context).textTheme.bodyLarge!.color,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(text: "Synced"),
              Tab(text: "Local"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Supabase or Stream
            isFromSupabase || isFromLocal ? StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text("Loading...", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  );
                }

                if (snapshot.hasData) {
                  List thyList = snapshot.data!;
                  thyList.sort((a, b) => b.lastWatched!.compareTo(a.lastWatched!));

                  return thyList.isEmpty
                      ? Center(child: Text("Thy list appears to be empty !"))
                      : ListView.builder(
                    itemCount: thyList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 120,
                          child: watchHistoryListTile(
                            context: context,
                            watchHistory: snapshot.data[index],
                            isFromSupabase: isFromSupabase,
                            onDelete: () {},
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: Text("Error loading data, \n Try login in and try again later"));
                }
              },
            ) : Center(child: Text("Data not available, Try login in and try again later"),),
            // Tab 2: Local (Cubit Watch History)
            BlocBuilder<AppCubit, AppModel?>(
              builder: (context, state) {
                List<WatchHistory> watchHistory = state!.watchHistory.toList();
                watchHistory.sort((a, b) => b.lastWatched!.compareTo(a.lastWatched!));

                return watchHistory.isEmpty
                    ? Center(child: Text("Thy list appears to be empty !"))
                    : ListView.builder(
                  itemCount: watchHistory.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 120,
                        child: watchHistoryListTile(
                          context: context,
                          watchHistory: watchHistory[index],
                          isFromSupabase: isFromSupabase,
                          onDelete: () {},
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    ): Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            pinned: true,
            scrolledUnderElevation: 0,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(title),
              background: Container(
                color: Theme.of(context).colorScheme.primary.withAlpha(100),
              )
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: items.length,
                      (context,index){
                    return AnimeListTile(
                        animeModel: items[index],
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: items[index])));
                        }
                    );
                  }
              )
          )
        ]
      ),
    ) ;
  }
}
/*SliverList(
delegate: SliverChildBuilderDelegate(
childCount: items.length,
(context,index){
return AnimeListTile(
animeModel: items[index],
onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: items[index])));
}
);
}
)
)*/
Widget watchHistoryListTile({
  required BuildContext context,
  WatchHistory ? watchHistory,
  bool isFromSupabase = false,
  required VoidCallback onDelete ,
}){
  return MaterialButton(
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: null,watchHistory: watchHistory,)));
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            watchHistory?.anime?.img ?? "",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  watchHistory?.anime?.name ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Continue episode: ${watchHistory?.watchingEpisode.toString() ?? ""}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Last watched: ${watchHistory?.lastWatched?.day ?? ""} / ${watchHistory?.lastWatched?.month ?? ""} / ${watchHistory?.lastWatched?.year ?? ""}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: (){
                          showDialog(
                              context: context,
                              builder: (context)=>AlertDialog(
                                title: Text("Delete watch history"),
                                content: Text("Are you sure you want to delete this watch history?"),
                                actions: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel")
                                  ),
                                  TextButton(
                                      onPressed: (){
                                        isFromSupabase ? WatchHistoryService().deleteWatchHistory(watchHistory: watchHistory!) : context.read<AppCubit>().removeFromWatchHistory(watchHistory!);
                                        Navigator.pop(context);
                                      },
                                      child: Text("Delete")
                                  ),
                                ],
                              )
                          );
                        },
                        icon: Icon(Icons.delete,color: Colors.red.withAlpha(150),)
                    )
                  ],
                ),
              ),
              SizedBox(height: 5,),
              LinearProgressIndicator(
                value: (watchHistory?.watchTime ?? 0) / (watchHistory?.totalTime ?? 0),
              ),
              SizedBox(height: 5,),
            ],
          ),
        ),
      ]
    ),
  );
}
