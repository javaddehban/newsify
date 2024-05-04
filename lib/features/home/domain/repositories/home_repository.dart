import 'package:either_dart/either.dart';
import 'package:news/config/network/failures.dart';
import 'package:news/features/home/data/model/news_model.dart';


abstract class HomeRepository {
  Future<Either<Failure?, List<NewsModel>>> getNews();
  Future<Either<Failure?, bool>> addNews(List<NewsModel> params);
}
