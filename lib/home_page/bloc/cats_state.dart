part of 'cats_bloc.dart';

@immutable
abstract class CatsState {}

class CatsEmptyState extends CatsState {}

class CatsLoadingState extends CatsState {}

class CatsLoadedState extends CatsState {
  final dynamic loadedCats;
  final Image? image;
  CatsLoadedState({required this.loadedCats, this.image}) : assert(loadedCats != null);
}

class CatsErrorState extends CatsState {}
