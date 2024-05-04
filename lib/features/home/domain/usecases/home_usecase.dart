import 'package:either_dart/either.dart';
import 'package:news/config/network/failures.dart';
import 'package:news/core/usecases/usecase.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:news/features/home/domain/repositories/home_repository.dart';


class GetNewsUserCase extends UseCase<List<NewsModel>, NoParams> {
  final HomeRepository repository;

  GetNewsUserCase({required this.repository});

  @override
  Future<Either<Failure?, List<NewsModel>>> call(NoParams params) {
    return repository.getNews();
  }
}

class AddNewsUserCase extends UseCase<bool, List<NewsModel>> {
  final HomeRepository repository;

  AddNewsUserCase({required this.repository});

  @override
  Future<Either<Failure?, bool>> call(List<NewsModel> params) {
    return repository.addNews(params);
  }
}