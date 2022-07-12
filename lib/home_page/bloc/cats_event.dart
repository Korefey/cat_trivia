part of 'cats_bloc.dart';

@immutable
abstract class CatsEvent {}

class CatsInitEvent extends CatsEvent {}

class CatsLoadEvent extends CatsEvent {}