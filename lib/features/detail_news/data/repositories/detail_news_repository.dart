import 'package:news/features/detail_news/data/datasource/detail_news_datasource.dart';
import 'package:news/features/detail_news/domain/repositories/detail_news_repository.dart';

class DetailNewsRepositoryImp extends DetailNewsRepository {
  final DetailNewsDataSource _detailNewsDataSource;

  DetailNewsRepositoryImp(this._detailNewsDataSource);
}
