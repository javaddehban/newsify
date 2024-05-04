import 'dart:convert';

import 'package:news/config/contans/constants.dart';
import 'package:news/config/di/injection_container.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeLocalDataSource {
  Future<List<NewsModel>> getNews();

  Future<bool> addNews(List<NewsModel> params);
}

class HomeLocalDataSourceIml implements HomeLocalDataSource {
  HomeLocalDataSourceIml();

  @override
  Future<List<NewsModel>> getNews() async {
    var data = getIt<SharedPreferences>().getStringList(Constants.newsKey);
    var response = data!.map((e) => json.decode(e)).toList();
    var result = response.map((e) => NewsModel.fromJson(e)).toList();
    return result;
  }

  @override
  Future<bool> addNews(List<NewsModel> params) async {
    await getIt<SharedPreferences>().remove(Constants.apiKey);
    await getIt<SharedPreferences>()
        .setStringList(Constants.newsKey, params.map((e) => jsonEncode(e)).toList());
    return true;
  }
}
