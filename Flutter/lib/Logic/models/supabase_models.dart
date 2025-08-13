
class SupabaseWatchListModel{
  final int? id;
  final int anilistId;
  final String animeName;
  final String animePoster;
  final int meanScore;

  SupabaseWatchListModel({
    this.id,
    required this.anilistId,
    required this.animeName,
    required this.animePoster,
    required this.meanScore,
  });

  factory SupabaseWatchListModel.fromJson(Map<String, dynamic> json) => SupabaseWatchListModel(
    id: json["id"],
    anilistId: json["anilist_id"],
    animeName: json["anime_name"],
    animePoster: json["anime_poster"],
    meanScore: json["mean_score"],
  );

  Map<String, dynamic> toJson(String userId) => {
    "user_id": userId,
    "anilist_id": anilistId,
    "anime_name": animeName,
    "anime_poster": animePoster,
    "mean_score": meanScore,
  };

}

class SupabaseAccountModel{
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String username;
  final String email;
  final int avatarId;
  final int watchListCount;
  final int watchHistoryCount;
  final int favoritesCount;

  SupabaseAccountModel({
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.username,
    required this.email,
    required this.avatarId,
    required this.watchListCount,
    required this.watchHistoryCount,
    required this.favoritesCount,
  });

  SupabaseAccountModel copyWith({
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? username,
    String? email,
    int? avatarId,
    int? watchListCount,
    int? watchHistoryCount,
    int? favoritesCount,
  }){
    final copy = SupabaseAccountModel(
        userId: userId ?? this.userId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        username: username ?? this.username,
        email: email ?? this.email,
        avatarId: avatarId ?? this.avatarId,
        watchListCount: watchListCount ?? this.watchListCount,
        watchHistoryCount: watchHistoryCount ?? this.watchHistoryCount,
        favoritesCount: favoritesCount ?? this.favoritesCount,
    );
    return copy;
  }

  factory SupabaseAccountModel.fromJson(Map<String, dynamic> json) {
    return SupabaseAccountModel(
      userId: json["user_id"] ?? '',
      createdAt: json["created_at"] != null ? DateTime.tryParse(json["created_at"]) : null,
      updatedAt: json["updated_at"] != null ? DateTime.tryParse(json["updated_at"]) : null,
      username: json["user_name"] ?? '',
      email: json["email"] ?? '',
      avatarId: json["pfp_id"] ?? 0,
      watchListCount: json["watch_list_count"] ?? 0,
      watchHistoryCount: json["watch_history_count"] ?? 0,
      favoritesCount: json["favourites_count"] ?? 0,
    );
  }


  Map<String, dynamic> toJson(){
    return {
      "user_id": userId,
      "updated_at": DateTime.now().toIso8601String(),
      "user_name": username,
      "email": email,
      "pfp_id": avatarId,
      "watch_list_count": watchListCount,
      "watch_history_count": watchHistoryCount,
      "favourites_count": favoritesCount,
    };
  }
}
