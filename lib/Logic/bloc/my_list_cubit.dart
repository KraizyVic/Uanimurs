import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/anime_model.dart';

class WatchListCubit extends Cubit<List<AnimeModel>> {
  late Isar _isar;

  // CONSTRUCTOR
  WatchListCubit() : super([]) {
    openDB();
  }

  // INITIALIZE ISAR DATABASE
  Future<void> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [AnimeModelSchema],
      directory: dir.path,
      inspector: true,
    );
    // Load existing data on startup
    emit(await getWatchList());
  }

  // ADD ANIME TO WATCH LIST
  Future<void> addAnime(AnimeModel anime) async {
    if (_isar == null) return; // Prevent crashes
    await _isar.writeTxn(() async {
      await _isar.animeModels.put(anime);
    });
    emit(await getWatchList());
  }

  // REMOVE ANIME FROM WATCH LIST
  Future<void> removeAnime(AnimeModel anime) async {
    if (_isar == null) return;
    await _isar.writeTxn(() async {
      await _isar.animeModels.delete(anime.id);
    });
    emit(await getWatchList());
  }

  // GET WATCH LIST FROM ISAR DATABASE
  Future<List<AnimeModel>> getWatchList() async {
    return _isar.animeModels.where().findAll();
  }
}
