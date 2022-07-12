part of 'fact_history_bloc.dart';

@immutable
abstract class FactHistoryEvent {}

class FactHistoryLoadEvent extends FactHistoryEvent {}