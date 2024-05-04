import 'package:news/config/di/injection_container.dart';
import 'package:news/features/home/data/datasource/home_local_datasource.dart';
import 'package:news/features/home/data/datasource/home_server_datasource.dart';
import 'package:news/features/home/data/repositories/home_repository.dart';
import 'package:news/features/home/domain/repositories/home_repository.dart';
import 'package:news/features/home/domain/usecases/home_usecase.dart';
import 'package:news/features/home/presentation/bloc/home_bloc.dart';

Future<void> initHome() async {
  getIt.registerSingleton<HomeServerDataSource>(HomeServerDataSourceIml(getIt()));
  getIt.registerSingleton<HomeLocalDataSource>(HomeLocalDataSourceIml());
  getIt.registerSingleton<HomeRepository>(HomeRepositoryImp(getIt(), getIt()));
  getIt.registerSingleton<GetNewsUserCase>(GetNewsUserCase(repository: getIt()));
  getIt.registerSingleton<AddNewsUserCase>(AddNewsUserCase(repository: getIt()));
  getIt.registerSingleton<HomeBloc>(HomeBloc(getIt(), getIt()));
}
