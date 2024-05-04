
import 'package:get_it/get_it.dart';
import 'package:news/config/network/dio_request_manager.dart';
import 'package:news/config/network/i_api_request_manager.dart';
import 'package:news/config/network/network_info.dart';
import 'package:news/config/theme/bloc/ThemeBloc.dart';
import 'package:news/features/detail_news/di/detail_news_dependecy_injection.dart';
import 'package:news/features/home/di/dependecy_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';


final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Network Handler
  getIt.registerLazySingleton<NetworkInfoRepository>(
        () => NetworkInfoRepositoryImpl(),
  );
  getIt.registerSingleton<IHttpClient>(DioHttpClient());
  getIt.registerSingleton<ThemeCubit>(ThemeCubit());

  getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

}

Future<void> initFeaturesDependencies() async {
  getIt.pushNewScope();
  await initHome();
  await initDetailNews();
}