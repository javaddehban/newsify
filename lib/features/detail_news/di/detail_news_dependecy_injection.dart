import 'package:news/config/di/injection_container.dart';
import 'package:news/features/detail_news/data/datasource/detail_news_datasource.dart';
import 'package:news/features/detail_news/data/repositories/detail_news_repository.dart';
import 'package:news/features/detail_news/domain/repositories/detail_news_repository.dart';
import 'package:news/features/detail_news/domain/usecases/detail_news_usecase.dart';
import 'package:news/features/detail_news/presentation/bloc/detail_news_bloc.dart';

Future<void> initDetailNews() async {
  getIt.registerSingleton<DetailNewsDataSource>(DetailNewsDataSourceIml(getIt()));
  getIt.registerSingleton<DetailNewsRepository>(DetailNewsRepositoryImp(getIt()));
  getIt.registerSingleton<DetailNewsUserCase>(DetailNewsUserCase(repository: getIt()));
  getIt.registerSingleton<DetailNewsBloc>(DetailNewsBloc(getIt ()));
}
