part of 'detail_bloc.dart';

abstract class DetailEvent {}

class DetailGetDataEvent extends DetailEvent {
  final MyDatabase myDb;
  DetailGetDataEvent({required this.myDb});
}

class DetailToggleFavoriteEvent extends DetailEvent {
  final BuildContext context;
  DetailToggleFavoriteEvent({required this.context});
}
