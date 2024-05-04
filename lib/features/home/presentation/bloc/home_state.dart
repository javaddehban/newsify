part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

class GetNewsState extends HomeState {
  final BaseStatus getNewsState;

  GetNewsState({required this.getNewsState});

  GetNewsState copyWith({BaseStatus? newGetNewsStatus}) {
    return GetNewsState(getNewsState: newGetNewsStatus ?? getNewsState);
  }
}
