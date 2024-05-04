import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:news/core/status/base_status.dart';
import 'package:news/features/detail_news/domain/usecases/detail_news_usecase.dart';

part 'detail_news_event.dart';

part 'detail_news_state.dart';

class DetailNewsBloc extends Bloc<DetailNewsEvent, DetailNewsState> {
  DetailNewsUserCase detailNewsUserCase;

  DetailNewsBloc(this.detailNewsUserCase)
      : super(GetDetailNewsState(getDetailNewsState: BaseNoAction()));
}
