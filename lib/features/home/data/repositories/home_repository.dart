import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:news/config/network/failures.dart';
import 'package:news/config/network/network_info.dart';
import 'package:news/features/home/data/datasource/home_local_datasource.dart';
import 'package:news/features/home/data/datasource/home_server_datasource.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:news/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeLocalDataSource _homeLocalDataSource;
  final HomeServerDataSource _homeServerDataSource;

  HomeRepositoryImp(this._homeServerDataSource, this._homeLocalDataSource);

  @override
  Future<Either<Failure?, List<NewsModel>>> getNews() async {
    try {
      bool connection = await NetworkInfoRepositoryImpl().hasConnection;
      List<NewsModel> response;
      if (connection) {
        response = await _homeServerDataSource.getNews();
      } else {
        response = await _homeLocalDataSource.getNews();
      }
      return Right(response);
    } on DioException catch (e) {
      return Left(GeneralFailure(
          "error", e.response != null ? e.response!.data["body"] : "please check your network"));
    }
  }
  
  @override
  Future<Either<Failure?, bool>> addNews(List<NewsModel> params) async {
    try {
      var response = await  _homeLocalDataSource.addNews(params);
      return Right(response);
    } on DioException catch (e) {
      return Left(GeneralFailure(
          "error", e.response != null ? e.response!.data["body"] : "please check your network"));
    }
  }
}
