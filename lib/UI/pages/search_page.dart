import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/UI/custom_widgets/tiles.dart';
import '../../Logic/services/anilist_service.dart';
import 'anime_details_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Search',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        forceMaterialTransparency: true,
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
                  icon: Icon(Icons.search),
                  onPressed: _searchAnime,
                ),
              ),
              onChanged: _onSearchChanged,
              onSubmitted: (value) {
                _searchAnime();
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

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Enter something to search'));
                }

                final results = snapshot.data!;

                return ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final anime = results[index];
                    return AnimeListTile(animeModel: anime, onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimeDetailsPage(animeModel: anime))));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}