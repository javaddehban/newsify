import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:news/config/di/injection_container.dart';
import 'package:news/config/router/routes.dart';
import 'package:news/config/theme/bloc/ThemeBloc.dart';
import 'package:news/config/theme/theme_data.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // initialize hydrated bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
  );

  initDependencies();
  await initFeaturesDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screenType) {
      return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => ThemeCubit()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, ThemeMode mode) {
              return MaterialApp.router(
                routeInformationProvider: Routes.router.routeInformationProvider,
                routeInformationParser: Routes.router.routeInformationParser,
                routerDelegate: Routes.router.routerDelegate,
                title: 'Newsiy',
                debugShowCheckedModeBanner: false,
                themeMode: mode == ThemeMode.system ? ThemeMode.light : mode,
                theme: ThemeConfig.lightTheme,
                darkTheme: ThemeConfig.darkTheme,
              );
            },
          ));
    });
  }
}
