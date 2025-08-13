
import '../models/github_model.dart';
import 'package:dio/dio.dart';

class GithubService{
  String _repositoryLink = "https://api.github.com/repos/KraizyVic/Uanimurs";
  final Dio _dio = Dio();

  Future<RepositoryModel> getRepository() async {
    final repsonse = _dio.get(_repositoryLink);
    return RepositoryModel.fromJson((await repsonse).data);
  }

  Future<DeveloperModel> getDeveloper() async {
    final repsonse = _dio.get("https://api.github.com/users/KraizyVic");
    return DeveloperModel.fromJson((await repsonse).data);
  }

}