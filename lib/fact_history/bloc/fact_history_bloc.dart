import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'fact_history_event.dart';

part 'fact_history_state.dart';

class FactHistoryBloc extends Bloc<FactHistoryEvent, FactHistoryState> {
  Box? factsBox;

  FactHistoryBloc() : super(FactHistoryInitial()) {
    on<FactHistoryLoadEvent>(
      (event, emit) async {
        factsBox = await Hive.openBox('cat_history_box');
        emit(FactHistoryInitialized());
      },
    );
  }
}
