import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:news/config/network/network_info.dart';
import 'package:news/core/status/base_status.dart';
import 'package:flutter/material.dart';
import 'package:news/core/usecases/usecase.dart';
import 'package:news/features/home/data/model/news_model.dart';
import 'package:news/features/home/domain/usecases/home_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetNewsUserCase homeUserCase;
  AddNewsUserCase addNewsUserCase;

  HomeBloc(this.homeUserCase, this.addNewsUserCase)
      : super(GetNewsState(getNewsState: BaseNoAction())) {
    on<GetNewsEvent>(_getNews);
    on<AddNewsEvent>(_addNews);
  }

  FutureOr<void> _getNews(event, emit) async {
    emit(GetNewsState(getNewsState: BaseLoading()));
    await homeUserCase(NoParams()).fold((left) {
      emit(GetNewsState(getNewsState: BaseError(left!.header)));
    }, (right) async {
      right.removeWhere((element) => element.title == "[Removed]");
      emit(GetNewsState(getNewsState: BaseSuccess(right)));
      bool connection = await NetworkInfoRepositoryImpl().hasConnection;
      if(connection) add(AddNewsEvent(right));

    });
  }

  Future<void> _addNews(AddNewsEvent event, emit) async {
    await addNewsUserCase(event.items);
  }
}
