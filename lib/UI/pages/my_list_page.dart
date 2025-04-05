import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/bloc/account_cubit.dart';
import 'package:uanimurs/Logic/bloc/my_list_cubit.dart';
import 'package:uanimurs/Logic/models/account_model.dart';
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
      body: BlocBuilder<AccountCubit, AccountModel?>(
          builder: (context, state) {
            // Check if state is null or watchList is empty
            if (state == null || state.watchList.isEmpty) {
              return Center(
                child: Text("Your watchlist is empty"),
              );
            }

            // If we have a valid state and watchlist with items, show the grid
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1/1.8,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5
                ),
                itemCount: state.watchList.length,
                itemBuilder: (context, index) {
                  final animeList = state.watchList.toList();
                  return AnimeTile(
                    animeModel: animeList[index],
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnimeDetailsPage(
                              animeModel: animeList[index],
                            )
                        )
                    ),
                  );
                }
            );
          }
      ),
    );
  }
}
