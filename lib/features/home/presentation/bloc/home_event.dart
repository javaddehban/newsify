part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetNewsEvent extends HomeEvent {
  GetNewsEvent();
}

class AddNewsEvent extends HomeEvent {
  final List<NewsModel> items;
  AddNewsEvent(this.items);
}
