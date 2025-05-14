import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/bloc/app_cubit.dart';
import 'package:uanimurs/Logic/models/account_model.dart';
import 'package:uanimurs/Logic/models/app_model.dart';
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
      body: BlocBuilder<AppCubit, AppModel?>(
          builder: (context, state) {
            // Check if state is null or watchList is empty


            // If we have a valid state and watchlist with items, show the grid
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1/1.8,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5
                ),
                itemCount: 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.red,
                    ),
                  );
                }
            );
          }
      ),
    );
  }
}
