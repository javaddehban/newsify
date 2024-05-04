import 'package:either_dart/either.dart';
import 'package:news/config/network/failures.dart';
import 'package:news/core/usecases/usecase.dart';
import 'package:news/features/detail_news/domain/repositories/detail_news_repository.dart';


class DetailNewsUserCase extends UseCase<bool, NoParams> {
  final DetailNewsRepository repository;

  DetailNewsUserCase({required this.repository});

  @override
  Future<Either<Failure?, bool>> call(NoParams params) {
    return call(params);
  }
}

