part of 'detail_news_bloc.dart';

@immutable
sealed class DetailNewsState {}

class GetDetailNewsState extends DetailNewsState {
  final BaseStatus getDetailNewsState;

  GetDetailNewsState({required this.getDetailNewsState});

  GetDetailNewsState copyWith({BaseStatus? newGetDetailNewsStatus}) {
    return GetDetailNewsState(getDetailNewsState: newGetDetailNewsStatus ?? getDetailNewsState);
  }
}
