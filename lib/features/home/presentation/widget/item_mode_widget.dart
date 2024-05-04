import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/config/resource/my_colors.dart';
import 'package:news/config/theme/bloc/ThemeBloc.dart';

class ThemeModeWidget extends StatelessWidget {
  const ThemeModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, ThemeMode mode) {
      return Column(
        children: [
          Visibility(
            visible: mode == ThemeMode.light,
            child: IconButton(
              onPressed: () {
                context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
              },
              icon: const Icon(Icons.dark_mode),
              color: MyColors.grey.shade900,
            ),
          ),
          Visibility(
            visible: mode == ThemeMode.dark,
            child: IconButton(
              onPressed: () {
                context.read<ThemeCubit>().updateTheme(ThemeMode.light);
              },
              icon: const Icon(Icons.light_mode),
              color: MyColors.white,
            ),
          ),
        ],
      );
    });
  }
}
