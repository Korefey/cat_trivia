import 'package:bloc/bloc.dart';
import 'package:cat_trivia/models/cats.dart';
import 'package:cat_trivia/services/cats_repository.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'cats_event.dart';

part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  final CatsRepository catsRepository;
  Box? catHistoryBox;
  Cats? cats;

  CatsBloc({required this.catsRepository}) : super(CatsEmptyState()) {
    on<CatsInitEvent>((event, emit) async {
      catHistoryBox = await Hive.openBox('cat_history_box');
      add(CatsLoadEvent());
    });
    on<CatsLoadEvent>(
      (event, emit) async {
        emit(CatsLoadingState());
        try {
          cats = await catsRepository.getAllCats();
          if (cats != null) {
            await catHistoryBox!.add(cats);
          }
          final Image? image = await catsRepository.getCatImage();
          emit(
            CatsLoadedState(loadedCats: cats, image: image),
          );
        } catch (_) {
          emit(
            CatsErrorState(),
          );
        }
      },
    );
  }
}
