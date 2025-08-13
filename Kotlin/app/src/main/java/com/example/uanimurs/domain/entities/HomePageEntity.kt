package com.example.uanimurs.domain.entities


data class HomePageEntity (
    val success: Boolean? = null,
    val results: Results? = null
)

data class Results (
    val spotlights: List<Spotlight>? = null,
    val trending: List<Trending>? = null,
    val topTen: TopTen? = null,
    val today: Today? = null,
    val topAiring: List<LatestCompleted>? = null,
    val mostPopular: List<LatestCompleted>? = null,
    val mostFavorite: List<LatestCompleted>? = null,
    val latestCompleted: List<LatestCompleted>? = null,
    val latestEpisode: List<LatestCompleted>? = null,
    val topUpcoming: List<TopUpcoming>? = null,
    val recentlyAdded: List<LatestCompleted>? = null,
    val genres: List<String>? = null
)

data class LatestCompleted (
    val id: String? = null,
    val dataID: String? = null,
    val poster: String? = null,
    val title: String? = null,
    val japaneseTitle: String? = null,
    val description: String? = null,
    val tvInfo: LatestCompletedTvInfo? = null,
    val adultContent: Boolean? = null
)

data class LatestCompletedTvInfo (
    val showType: String? = null,
    val duration: String? = null,
    val sub: String? = null,
    val eps: String? = null,
    val dub: String? = null
)

data class Spotlight (
    val id: String? = null,
    val dataID: String? = null,
    val poster: String? = null,
    val title: String? = null,
    val japaneseTitle: String? = null,
    val description: String? = null,
    val tvInfo: SpotlightTvInfo? = null
)

data class SpotlightTvInfo (
    val showType: String? = null,
    val duration: String? = null,
    val releaseDate: String? = null,
    val quality: String? = null,
    val episodeInfo: EpisodeInfo? = null
)

data class EpisodeInfo (
    val sub: String? = null,
    val dub: String? = null
)

data class Today (
    val schedule: List<Schedule>? = null
)

data class Schedule (
    val id: String? = null,
    val dataID: String? = null,
    val title: String? = null,
    val japaneseTitle: String? = null,
    val releaseDate: String? = null,
    val time: String? = null,
    val episodeNo: String? = null
)

data class TopTen (
    val today: List<Trending>? = null,
    val week: List<Trending>? = null,
    val month: List<Trending>? = null
)

data class Trending (
    val id: String? = null,
    val dataID: String? = null,
    val number: String? = null,
    val title: String? = null,
    val japaneseTitle: String? = null,
    val poster: String? = null,
    val tvInfo: TrendingTvInfo? = null
)

data class TrendingTvInfo (
    val sub: String? = null,
    val dub: String? = null,
    val eps: String? = null
)

data class TopUpcoming (
    val id: String? = null,
    val dataID: String? = null,
    val poster: String? = null,
    val title: String? = null,
    val japaneseTitle: String? = null,
    val description: String? = null,
    val tvInfo: TopUpcomingTvInfo? = null,
    val adultContent: Boolean? = null
)

data class TopUpcomingTvInfo (
    val showType: String? = null,
    val duration: String? = null
)
