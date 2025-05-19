
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/Logic/models/supabase_models.dart';
import 'package:uanimurs/Logic/models/watch_history.dart';

class WatchListService {
  final supabaseClient = Supabase.instance.client;

  Stream<List<SupabaseWatchListModel>> fetchWatchList(){
    return Supabase.instance.client.from("watchList").stream(primaryKey: ['id']).map((event) => event.map((e) => SupabaseWatchListModel.fromJson(e)).toList());
  }

  void addAnime(AnimeModel anime,int total) async{
    await supabaseClient.from("watchList").insert(
      SupabaseWatchListModel(
        anilistId: anime.alId,
        animeName: anime.title.english ?? anime.title.romaji ?? anime.title.native ?? "null",
        animePoster: anime.coverImage.large??anime.coverImage.medium??anime.coverImage.large??"",
        meanScore: anime.meanScore
      ).toJson(supabaseClient.auth.currentUser!.id,)
    );
    AccountService().updateWatchListCount();
  }

  void deleteAnime(SupabaseWatchListModel anime) async {
    await supabaseClient.from('watchList').delete().eq('id', anime.id!);
    AccountService().updateWatchListCount();
  }
}

class AccountService{
  final supabaseClient = Supabase.instance.client;

  Stream<SupabaseAccountModel> fetchAccount(){
    return Supabase.instance.client.from("profiles").stream(primaryKey: ['id']).eq("user_id", supabaseClient.auth.currentUser!.id).map((event) => event.map((e) => SupabaseAccountModel.fromJson(e)).toList().first);
  }

  void updateAccount({
    required BuildContext context,
    required SupabaseAccountModel account
  }) async {
    try{
      await supabaseClient.from("profiles").update(account.toJson(),).eq("user_id", account.userId);
      if(context.mounted){
        Navigator.pop(context);
        Future.delayed(Duration(seconds: 2));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(child: Text("Account updated successfully",style: TextStyle(color: Theme.of(context).colorScheme.tertiary),)),
            duration: Duration(seconds: 2),
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Theme.of(context).colorScheme.primary,width: 2)
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
            animation: Animation.fromValueListenable(
              AlwaysStoppedAnimation<double>(1.0),
            ),
            behavior: SnackBarBehavior.floating,
          )
        );
      }


    }catch(error){
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error updating account: $error")));
      }
    }
  }
  void updateWatchListCount() async{
    await supabaseClient.from("profiles").update(
      {
        "watch_list_count": await supabaseClient.from("watchList").select("id").eq("user_id", supabaseClient.auth.currentUser!.id).count().then((value) => value.count)
      },
    ).eq("user_id", supabaseClient.auth.currentUser!.id);
  }
  void updateWatchHistoryListCount() async{
    await supabaseClient.from("profiles").update(
      {
        "watch_history_count": await supabaseClient.from("watch_history").select("id").eq("user_id", supabaseClient.auth.currentUser!.id).count().then((value) => value.count)
      },
    ).eq("user_id", supabaseClient.auth.currentUser!.id);
  }
  void updateFavoritesListCount() async{
    await supabaseClient.from("profiles").update(
      {
        "favorites_count": await supabaseClient.from("watch_history").select("id").eq("user_id", supabaseClient.auth.currentUser!.id).count().then((value) => value.count)
      },
    ).eq("user_id", supabaseClient.auth.currentUser!.id);
  }
}

class WatchHistoryService{
  
  final supabaseClient = Supabase.instance.client;
  
  Stream<List<WatchHistory>> fetchWatchHistory(){
    return Supabase.instance.client.from("watch_history").stream(primaryKey: ['id']).eq("user_id", supabaseClient.auth.currentUser!.id).map((result) => result.map((e) => WatchHistory.fromJson(e)).toList());
  }

  void addWatchHistory({required WatchHistory watchHistory}) async{
    await supabaseClient.from("watch_history").insert(watchHistory.toJson(supabaseClient.auth.currentUser!.id));
    AccountService().updateWatchHistoryListCount();
  }

  void updateWatchHistory({required WatchHistory watchHistory}) async{
    try{
      await supabaseClient.from("watch_history").update(watchHistory.toJson(supabaseClient.auth.currentUser!.id)).eq("id", watchHistory.supabaseId!);
    }catch(error){
      print(error);
    }
  }

  void deleteWatchHistory({required WatchHistory watchHistory}) async{
    await supabaseClient.from("watch_history").delete().eq("id", watchHistory.supabaseId!);
    AccountService().updateWatchHistoryListCount();
  }
}