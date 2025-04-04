import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/bloc/my_list_cubit.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/UI/pages/anime_details_page.dart';

import '../custom_widgets/tiles.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My List"),
        forceMaterialTransparency: true,
      ),
      body: BlocBuilder<WatchListCubit , List<AnimeModel>>(
        builder: (context,state)=>GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1/1.8,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5
          ),
          itemCount: state.length,
          itemBuilder: (context,index){
            return AnimeTile(
              animeModel: state[index],
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: state[index]))),
            );
          }
        )
      ),
    );
  }
}
