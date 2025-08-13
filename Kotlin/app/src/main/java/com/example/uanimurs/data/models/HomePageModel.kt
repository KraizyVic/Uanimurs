package com.example.uanimurs.data.models
import com.example.uanimurs.domain.entities.*
import kotlinx.serialization.*

// HomePageModel
@Serializable
data class HomePageModel (
    val success: Boolean? = null,
    val results: ResultsModel? = null
)

fun HomePageModel.toEntity(): HomePageEntity {
    return HomePageEntity(
        success = success,
        results = results?.toEntity()
    )
}
fun HomePageEntity.toEpisodeModel(): HomePageModel {
    return HomePageModel(
        success = success,
        results = results?.toEpisodeModel()
    )
}

// ResultsModel
@Serializable
data class ResultsModel (
    val spotlights: List<SpotlightModel>? = null,
    val trending: List<TrendingModel>? = null,
    val topTen: TopTenModel? = null,
    val today: TodayModel? = null,
    val topAiring: List<LatestCompletedModel>? = null,
    val mostPopular: List<LatestCompletedModel>? = null,
    val mostFavorite: List<LatestCompletedModel>? = null,
    val latestCompleted: List<LatestCompletedModel>? = null,
    val latestEpisode: List<LatestCompletedModel>? = null,
    val topUpcoming: List<TopUpcomingModel>? = null,
    val recentlyAdded: List<LatestCompletedModel>? = null,
    val genres: List<String>? = null
)

fun ResultsModel.toEntity(): Results {
    return Results(
        spotlights = spotlights?.map { it.toEntity() },
        trending = trending?.map { it.toEntity() },
        topTen = topTen?.toEntity(),
        today = today?.toEntity(),
        topAiring = topAiring?.map { it.toEntity() },
        mostPopular = mostPopular?.map { it.toEntity() },
        mostFavorite = mostFavorite?.map { it.toEntity() },
        latestCompleted = latestCompleted?.map { it.toEntity() },
        latestEpisode = latestEpisode?.map { it.toEntity() },
        topUpcoming = topUpcoming?.map { it.toEntity() },
        recentlyAdded = recentlyAdded?.map { it.toEntity() },
        genres = genres
    )
}
fun Results.toEpisodeModel(): ResultsModel{
    return ResultsModel(
        spotlights = spotlights?.map { it.toEpisodeModel() },
        trending = trending?.map { it.toEpisodeModel() },
        topTen = topTen?.toEpisodeModel(),
        today = today?.toEpisodeModel(),
        topAiring = topAiring?.map { it.toEpisodeModel() },
        mostPopular = mostPopular?.map { it.toEpisodeModel() },
        mostFavorite = mostFavorite?.map { it.toEpisodeModel() },
        latestCompleted = latestCompleted?.map { it.toEpisodeModel() },
        latestEpisode = latestEpisode?.map { it.toEpisodeModel() },
        topUpcoming = topUpcoming?.map { it.toEpisodeModel() },
        recentlyAdded = recentlyAdded?.map { it.toEpisodeModel() },
        genres = genres
    )
}

// LatestCompletedModel
@Serializable
data class LatestCompletedModel (
    val id: String? = null,

    @SerialName("data_id")
    val dataID: String? = null,

    val poster: String? = null,
    val title: String? = null,

    @SerialName("japanese_title")
    val japaneseTitle: String? = null,

    val description: String? = null,
    val tvInfo: LatestCompletedTvInfoModel? = null,
    val adultContent: Boolean? = null
)

fun LatestCompletedModel.toEntity(): LatestCompleted{
    return LatestCompleted(
        id = id,
        dataID = dataID,
        poster = poster,
        title = title,
        japaneseTitle = japaneseTitle,
        description = description,
        tvInfo = tvInfo?.toEntity(),
        adultContent = adultContent
    )
}
fun LatestCompleted.toEpisodeModel(): LatestCompletedModel {
    return LatestCompletedModel(
        id = id,
        dataID = dataID,
        poster = poster,
        title = title,
        japaneseTitle = japaneseTitle,
        description = description,
        tvInfo = tvInfo?.toEpisodeModel(),
        adultContent = adultContent
    )
}

// LatestCompletedTvInfoModel
@Serializable
data class LatestCompletedTvInfoModel (
    val showType: String? = null,
    val duration: String? = null,
    val sub: String? = null,
    val eps: String? = null,
    val dub: String? = null
)

fun LatestCompletedTvInfoModel.toEntity(): LatestCompletedTvInfo {
    return LatestCompletedTvInfo(
        showType = showType,
        duration = duration,
        sub = sub,
        eps = eps,
        dub = dub
    )
}
fun LatestCompletedTvInfo.toEpisodeModel(): LatestCompletedTvInfoModel {
    return LatestCompletedTvInfoModel(
        showType = showType,
        duration = duration,
        sub = sub,
        eps = eps,
        dub = dub
    )
}

// ShowTypeModel
/*@Serializable
enum class ShowTypeModel(val value: String) {
    @SerialName("Movie") Movie("Movie"),
    @SerialName("ONA") Ona("ONA"),
    @SerialName("OVA") Ova("OVA"),
    @SerialName("Special") Special("Special"),
    @SerialName("TV") Tv("TV");
}

fun ShowTypeModel.toEntity(): ShowType {
    return when (this) {
        ShowTypeModel.Movie -> ShowType.Movie
        ShowTypeModel.Ona -> ShowType.Ona
        ShowTypeModel.Ova -> ShowType.Ova
        ShowTypeModel.Special -> ShowType.Special
        ShowTypeModel.Tv -> ShowType.Tv
    }
}
fun ShowType.toModel(): ShowTypeModel {
    return when (this) {
        ShowType.Movie -> ShowTypeModel.Movie
        ShowType.Ona -> ShowTypeModel.Ona
        ShowType.Ova -> ShowTypeModel.Ova
        ShowType.Special -> ShowTypeModel.Special
        ShowType.Tv -> ShowTypeModel.Tv
    }
}*/

// SpotlightModel
@Serializable
data class SpotlightModel (
    val id: String? = null,

    @SerialName("data_id")
    val dataID: String? = null,

    val poster: String? = null,
    val title: String? = null,

    @SerialName("japanese_title")
    val japaneseTitle: String? = null,

    val description: String? = null,
    val tvInfo: SpotlightTvInfoModel? = null
)

fun SpotlightModel.toEntity(): Spotlight {
    return Spotlight(
        id = id,
        dataID = dataID,
        poster = poster,
        title = title,
        japaneseTitle = japaneseTitle,
        description = description,
        tvInfo = tvInfo?.toEntity()
    )
}
fun Spotlight.toEpisodeModel(): SpotlightModel{
    return SpotlightModel(
        id = id,
        dataID = dataID,
        poster = poster,
        title = title,
        japaneseTitle = japaneseTitle,
        description = description,
        tvInfo = tvInfo?.toEpisodeModel()
    )
}

// SpotlightTvInfoModel
@Serializable
data class SpotlightTvInfoModel (
    val showType: String? = null,
    val duration: String? = null,
    val releaseDate: String? = null,
    val quality: String? = null,
    val episodeInfo: EpisodeInfoModel? = null
)

fun SpotlightTvInfoModel.toEntity(): SpotlightTvInfo {
    return SpotlightTvInfo(
        showType = showType,
        duration = duration,
        releaseDate = releaseDate,
        quality = quality,
        episodeInfo = episodeInfo?.toEntity()
    )
}
fun SpotlightTvInfo.toEpisodeModel(): SpotlightTvInfoModel {
    return SpotlightTvInfoModel(
        showType = showType,
        duration = duration,
        releaseDate = releaseDate,
        quality = quality,
        episodeInfo = episodeInfo?.toEpisodeModel()
    )
}

// EpisodeInfoModel
@Serializable
data class EpisodeInfoModel (
    val sub: String? = null,
    val dub: String? = null
)

fun EpisodeInfoModel.toEntity(): EpisodeInfo {
    return EpisodeInfo(
        sub = sub,
        dub = dub
    )
}
fun EpisodeInfo.toEpisodeModel(): EpisodeInfoModel {
    return EpisodeInfoModel(
        sub = sub,
        dub = dub
    )
}

// TodayModel
@Serializable
data class TodayModel (
    val schedule: List<ScheduleModel>? = null
)

fun TodayModel.toEntity(): Today {
    return Today(
        schedule = schedule?.map { it.toEntity() }
    )
}
fun Today.toEpisodeModel(): TodayModel {
    return TodayModel(
        schedule = schedule?.map { it.toEpisodeModel() }
    )
}

// ScheduleModel
@Serializable
data class ScheduleModel (
    val id: String? = null,

    @SerialName("data_id")
    val dataID: String? = null,

    val title: String? = null,

    @SerialName("japanese_title")
    val japaneseTitle: String? = null,

    val releaseDate: String? = null,
    val time: String? = null,

    @SerialName("episode_no")
    val episodeNo: String? = null
)

fun ScheduleModel.toEntity(): Schedule {
    return Schedule(
        id = id,
        dataID = dataID,
        title = title,
        japaneseTitle = japaneseTitle,
        releaseDate = releaseDate,
        time = time,
        episodeNo = episodeNo
    )
}
fun Schedule.toEpisodeModel(): ScheduleModel{
    return ScheduleModel(
        id = id,
        dataID = dataID,
        title = title,
        japaneseTitle = japaneseTitle,
        releaseDate = releaseDate,
        time = time,
        episodeNo = episodeNo
    )
}

// TopTenModel
@Serializable
data class TopTenModel (
    val today: List<TrendingModel>? = null,
    val week: List<TrendingModel>? = null,
    val month: List<TrendingModel>? = null
)

fun TopTenModel.toEntity(): TopTen {
    return TopTen(
        today = today?.map { it.toEntity() },
        week = week?.map { it.toEntity() },
        month = month?.map { it.toEntity() }
    )
}
fun TopTen.toEpisodeModel(): TopTenModel {
    return TopTenModel(
        today = today?.map { it.toEpisodeModel() },
        week = week?.map { it.toEpisodeModel() },
        month = month?.map { it.toEpisodeModel() }
    )
}

// TrendingModel
@Serializable
data class TrendingModel (
    val id: String? = null,

    @SerialName("data_id")
    val dataID: String? = null,

    val number: String? = null,
    val title: String? = null,

    @SerialName("japanese_title")
    val japaneseTitle: String? = null,

    val poster: String? = null,
    val tvInfo: TrendingTvInfoModel? = null
)

fun TrendingModel.toEntity(): Trending{
    return Trending(
        id = id,
        dataID = dataID,
        number = number,
        title = title,
        japaneseTitle = japaneseTitle,
        poster = poster,
        tvInfo = tvInfo?.toEntity()
    )
}
fun Trending.toEpisodeModel(): TrendingModel {
    return TrendingModel(
        id = id,
        dataID = dataID,
        number = number,
        title = title,
        japaneseTitle = japaneseTitle,
        poster = poster,
        tvInfo = tvInfo?.toEpisodeModel()
    )
}

// TrendingTvInfoModel
@Serializable
data class TrendingTvInfoModel (
    val sub: String? = null,
    val dub: String? = null,
    val eps: String? = null
)

fun TrendingTvInfoModel.toEntity(): TrendingTvInfo {
    return TrendingTvInfo(
        sub = sub,
        dub = dub,
        eps = eps
    )
}
fun TrendingTvInfo.toEpisodeModel(): TrendingTvInfoModel {
    return TrendingTvInfoModel(
        sub = sub,
        dub = dub,
        eps = eps
    )
}

// TopUpcomingModel
@Serializable
data class TopUpcomingModel (
    val id: String? = null,

    @SerialName("data_id")
    val dataID: String? = null,

    val poster: String? = null,
    val title: String? = null,

    @SerialName("japanese_title")
    val japaneseTitle: String? = null,

    val description: String? = null,
    val tvInfo: TopUpcomingTvInfoModel? = null,
    val adultContent: Boolean? = null
)

fun TopUpcomingModel.toEntity(): TopUpcoming {
    return TopUpcoming(
        id = id,
        dataID = dataID,
        poster = poster,
        title = title,
        japaneseTitle = japaneseTitle,
        description = description,
        tvInfo = tvInfo?.toEntity(),
        adultContent = adultContent
    )
}
fun TopUpcoming.toEpisodeModel(): TopUpcomingModel {
    return TopUpcomingModel(
        id = id,
        dataID = dataID,
        poster = poster,
        title = title,
        japaneseTitle = japaneseTitle,
        description = description,
        tvInfo = tvInfo?.toEpisodeModel(),
        adultContent = adultContent
    )
}

// TopUpcomingTvInfoModel
@Serializable
data class TopUpcomingTvInfoModel (
    val showType: String? = null,
    val duration: String? = null
)

fun TopUpcomingTvInfoModel.toEntity(): TopUpcomingTvInfo {
    return TopUpcomingTvInfo(
        showType = showType,
        duration = duration
    )
}
fun TopUpcomingTvInfo.toEpisodeModel(): TopUpcomingTvInfoModel {
    return TopUpcomingTvInfoModel(
        showType = showType,
        duration = duration
    )
}
