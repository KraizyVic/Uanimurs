import 'dart:convert';

import 'package:uanimurs/Logic/models/ani_watch_model.dart';
import 'package:http/http.dart' as http;

class AniWatchService{
  String baseUrl = "https://kraizy-api-aniwatch-instance.vercel.app/aniwatch";

  // Search for anime
  Future<SearchedAnimes> searchAnime(String query) async {
    final response = await http.get(Uri.parse("$baseUrl/search?keyword=${query}page=1"));
    if(response.statusCode == 200){
      return SearchedAnimes.fromJson(json.decode(response.body));
    }else{
      throw Exception("${response.statusCode}: Failed to load anime");
    }
  }

  // Get anime episodes according to fetched ID
  Future<Episodes> getEpisodes(String id) async{
    final response = await http.get(Uri.parse("$baseUrl/episodes/$id"));
    if(response.statusCode == 200){
      return Episodes.fromJson(json.decode(response.body));
    }else{
      throw Exception("Failed to load episode list");
    }
  }

  // Get anime servers according to fetched ID
  Future<Servers> getServers(String episodeId) async{
    final response = await http.get(Uri.parse("$baseUrl/servers?id=$episodeId"));
    if(response.statusCode == 200){
      return Servers.fromJson(json.decode(response.body));
    }else{
      throw Exception("Failed to load servers");
    }
  }

  // Get streaming link according to fetched ID

  Future<StreamingLink> getStreamingLink(String episodeId,String serverName,String category) async{
    final response = await http.get(Uri.parse("$baseUrl/episode-srcs?id=$episodeId&server=$serverName&category=$category"));
    if(response.statusCode == 200){
      return StreamingLink.fromJson(json.decode(response.body));
    }else{
      throw Exception("Failed to load streaming link");
    }
  }

  // Get quality links from M3U8 URL

  Future<List<M3U8Quality>> getQualityLinks(String m3u8Url) async {
    try {
      final response = await http.get(Uri.parse(m3u8Url));

      if (response.statusCode != 200) {
        throw Exception("Failed to load M3U8 file");
      }

      List<M3U8Quality> qualityLinks = [
        M3U8Quality(quality: "Auto", url: m3u8Url),
      ];
      List<String> lines = response.body.split('\n');

      String? lastQuality;
      Uri masterUri = Uri.parse(m3u8Url);

      for (String line in lines) {
        line = line.trim();

        if (line.startsWith("#EXT-X-STREAM-INF")) {
          RegExp matchRes = RegExp(r'RESOLUTION=(\d+x\d+)');
          Match? resMatch = matchRes.firstMatch(line);

          if (resMatch != null) {
            lastQuality = resMatch.group(1);
          }
        } else if (line.endsWith(".m3u8")) {
          if (lastQuality != null) {
            Uri qualityUri = Uri.parse(line);
            String fullUrl = qualityUri.hasScheme ? line : masterUri.resolve(line).toString();

            qualityLinks.add(M3U8Quality(quality: lastQuality, url: fullUrl));
            lastQuality = null;
          }
        }
      }

      return qualityLinks;
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}