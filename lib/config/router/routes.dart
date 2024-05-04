
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news/config/di/injection_container.dart';
import 'package:news/features/detail_news/presentation/bloc/detail_news_bloc.dart';
import 'package:news/features/detail_news/presentation/view/detail_news_page.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:news/features/home/presentation/bloc/home_bloc.dart';
import 'package:news/features/home/presentation/view/home_page.dart';
import 'package:news/features/splash/splash_page.dart';

class Routes {
  Routes._();

  static const String splash = "/splash";

  static const String home = "/";
  static const String detail = "/detail";

  static GoRouter get router => _router;
}

final _router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
        path: Routes.home,
        name: Routes.home,
        builder: (context, state) {
          return MultiBlocProvider(providers: [
            BlocProvider.value(value: getIt<HomeBloc>()..add(GetNewsEvent())),
          ], child: const HomePage());
        }),
    GoRoute(
        path: Routes.detail,
        name: Routes.detail,
        builder: (context, state) {
          NewsModel model = NewsModel.fromJson(state.extra as Map<String, dynamic>);
          return MultiBlocProvider(providers: [
            BlocProvider.value(value: getIt<DetailNewsBloc>()),
          ], child: DetailNewsPage(item: model));
        }),
    GoRoute(
        path: Routes.splash,
        pageBuilder: (context, state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const SplashPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                FadeTransition(opacity: animation, child: child),
          );
        }),
  ],
);
