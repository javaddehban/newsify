import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:news/config/resource/assets.dart';
import 'package:news/config/resource/my_spaces.dart';
import 'package:news/core/status/base_status.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:news/features/home/presentation/bloc/home_bloc.dart';
import 'package:news/features/home/presentation/widget/app_bar_widget.dart';
import 'package:news/features/home/presentation/widget/item_mode_widget.dart';
import 'package:news/features/home/presentation/widget/item_news_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        context.read<HomeBloc>().add(GetNewsEvent());
        return Future.value(true);
      },
      child: Scaffold(
        appBar:
        AppBar(
          actions: const [
            AppBarActionWidget(),
            Spacer(),
            ThemeModeWidget(),
          ],
        ),
          body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) => current is GetNewsState,
                  builder: (context, state) {
                    if (state is GetNewsState) {
                      if (state.getNewsState is BaseError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text((state.getNewsState as BaseError).error ?? "Error"),
                              IconButton(
                                  onPressed: () => context.read<HomeBloc>().add(GetNewsEvent()),
                                  icon: const Icon(Icons.refresh))
                            ],
                          ),
                        );
                      } else if (state.getNewsState is BaseSuccess) {
                        List<NewsModel> item = (state.getNewsState as BaseSuccess).entity;
                        if(item.isEmpty){
                          return _noData();
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: (state.getNewsState as BaseSuccess).entity.length,
                          padding: EdgeInsets.only(
                              top: MySpaces.s24,
                              bottom: MediaQuery.of(context).viewPadding.bottom + MySpaces.s16),
                          itemBuilder: (context, index) {
                            return ItemNewsWidget(
                                item: (state.getNewsState as BaseSuccess).entity[index]);
                          },
                        );
                      } else {
                        return _loading();
                      }
                    } else {
                      return _loading();
                    }
                  },
                )
              ],
            ),
          ),
        ],
      )),
    );
  }

  _loading() {
    return Center(child: Lottie.asset(Assets.jsonLoading, width: 33.w, height: 33.w));
  }
  _noData(){
    return Center(child: Lottie.asset(Assets.jsonNoData, width: 33.w, height: 33.w));
  }
}
