import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uanimurs/Database/constants.dart';
import 'package:uanimurs/Logic/bloc/app_cubit.dart';
import 'package:uanimurs/Logic/models/app_model.dart';
import 'package:uanimurs/Logic/services/supabase_services.dart';
import 'package:uanimurs/UI/custom_widgets/buttons.dart';
import 'package:uanimurs/UI/pages/anime_details_page.dart';
import 'package:uanimurs/UI/pages/auth_page.dart';

import '../../Logic/models/supabase_models.dart';
import '../custom_widgets/tiles.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  List<Widget> pages = [
    localList(),
    localList(),
    localList(),
  ];
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My List"),
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: myListGroupNames.length,
                itemBuilder: (context,index){
                  return customTabButton(
                    context: context,
                    isActive: selectedPageIndex == index,
                    buttonName: myListGroupNames[index],
                    onTap: (){
                      setState(() {
                        selectedPageIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: PageView(
              onPageChanged: (index){
                setState(() {
                  selectedPageIndex = index;
                });
              },
              children: [
                onlineList(context: context,appModel: context.read<AppCubit>().state!),
                localList(),
                favoritesList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget onlineList({
  required BuildContext context,
  required AppModel appModel
}){
  if(!appModel.isLoggedIn && Supabase.instance.client.auth.currentSession == null){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Log in",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
          Text("Synchronize your list across devices",style: TextStyle(fontSize: 15,)),
          SizedBox(height: 20,),
          SizedBox(
            width: 100,
            child: customTextButton(
              isFilled: true,
              context: context,
              buttonName: "Login",
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginOrSignUpPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
  return StreamBuilder<List<SupabaseWatchListModel>>(
    stream: WatchListService().fetchWatchList(),
    builder: (context,snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
      if(snapshot.hasError){
        return Center(child: Text("Error: ${snapshot.error}"));
      }

      List<SupabaseWatchListModel> animes = snapshot.data!;
      if(animes.isEmpty){
        return Center(child: Text("Your list is empty"));
      }
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.8,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
        itemCount: animes.length,
        itemBuilder: (context, index) {
          return supabaseWatchListTile(
            context: context,
            anime: animes[index],
            onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: null,supabaseWatchListModel: animes[index],))),
            onLongPressed: (){}
          );
        }
      );
    }
  );
}



Widget localList(){
  return BlocBuilder<AppCubit, AppModel?>(
    builder: (context, state) {
      final list = state!.userList.toList();
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.8,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final anime = list[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimeTile(
              animeModel: anime,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimeDetailsPage(animeModel: anime),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

Widget favoritesList(){
  return BlocBuilder<AppCubit, AppModel?>(
    builder: (context, state) {
      final list = [];
      if(list.isEmpty){
        return Center(child: Text("Coming soon"));
      }
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.8,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final anime = list[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimeTile(
              animeModel: anime,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimeDetailsPage(animeModel: anime),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}


