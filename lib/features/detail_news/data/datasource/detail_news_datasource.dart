import 'package:news/core/repository/base_repository.dart';

abstract class DetailNewsDataSource {}

class DetailNewsDataSourceIml extends BaseRepository implements DetailNewsDataSource {
  DetailNewsDataSourceIml(super.httpClient);
}
