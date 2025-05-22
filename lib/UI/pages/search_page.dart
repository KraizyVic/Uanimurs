import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/bloc/app_cubit.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/Logic/models/app_model.dart';
import 'package:uanimurs/UI/custom_widgets/tiles.dart';
import '../../Logic/services/anilist_service.dart';
import 'anime_details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final AnimeService _animeService = AnimeService();
  late Future<List<AnimeModel>> _searchResults = Future.value([]);

  String _searchTerm = '';

  void _searchAnime() {
    setState(() {
      _searchResults = _animeService.searchAnime(searchTerm: _searchTerm);

    });
  }

  Timer? _debounce;

  void _onSearchChanged(String value) {
    setState(() {
      _searchTerm = value;
    });
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchAnime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppModel?>(
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Search',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            forceMaterialTransparency: true,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Search for anime...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _searchTerm = '';
                          _searchResults = Future.value([]);
                        });
                      }
                    ),
                  ),
                  onChanged: _onSearchChanged,
                  onSubmitted: (value) async{
                    _searchAnime();
                    await context.read<AppCubit>().addSearchTerm(value);
                  },
                ),
              ),
              Expanded(
                child: FutureBuilder<List<AnimeModel>>(
                  future: _searchResults,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty ) {
                    return state!.searchHistory.isEmpty ? Center(
                          child: Text('Enter something to search')
                      ) : ListView.builder(
                        itemCount: state.searchHistory.length,
                        itemBuilder: (context,index){
                          return ListTile(
                            onTap: (){
                              setState(() {
                                _searchTerm = state.searchHistory[index];
                                _searchResults = _animeService.searchAnime(searchTerm: _searchTerm);
                              });
                            },
                            title: Text(state.searchHistory[index]),
                            trailing: IconButton(
                              onPressed: ()=>context.read<AppCubit>().removeSearchTerm(state.searchHistory[index]),
                              icon: Icon(Icons.remove)
                            ),
                          );
                        }
                      );
                    }

                    final results = snapshot.data!;
                    return ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        final anime = results[index];
                        return AnimeListTile(
                          animeModel: anime,
                          onPressed: () async{
                            //await context.read<AccountCubit>().addToSearchHistory(anime.title.english == "null" ? anime.title.romaji ?? "" : anime.title.english ?? "");
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: anime)));
                          }
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
