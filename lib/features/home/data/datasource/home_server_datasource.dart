import 'package:news/config/contans/constants.dart';
import 'package:news/core/repository/base_repository.dart';
import 'package:news/core/repository/base_response.dart';
import 'package:news/features/home/data/model/news_model.dart';

abstract class HomeServerDataSource {
  Future<List<NewsModel>> getNews();
}

class HomeServerDataSourceIml extends BaseRepository implements HomeServerDataSource {
  HomeServerDataSourceIml(super.httpClient);

  @override
  Future<List<NewsModel>> getNews() async {
    var response = await httpClient.getRequest(
        path: '/top-headlines', queryParameters: {"country": "us", "apiKey": Constants.apiKey});
    var result = BaseResponse.fromJsonArray(
      response,
      bodyBuilder: (body) => body.map((item) => NewsModel.fromJson(item)).toList(),
    );
    return result.data ?? [];
  }
}
