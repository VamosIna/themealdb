part of 'favorite_bloc.dart';

abstract class FavoriteEvent {}

class FavoriteGetDataEvent extends FavoriteEvent {
  final MyDatabase myDb;
  FavoriteGetDataEvent({required this.myDb});
}
