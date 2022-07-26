import 'package:cat_trivia/home_page/bloc/cats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatList extends StatelessWidget {
  const CatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatsBloc, CatsState>(
      builder: (context, state) {
        if (state is CatsEmptyState) {
          return const Center(
            child: Text(
              'No data received. Press button "Load"',
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        if (state is CatsLoadingState) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 24),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is CatsLoadedState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: state.image!),
                const SizedBox(height: 12),
                Text(state.loadedCats.name),
                const SizedBox(height: 12),
                Text(
                  state.loadedCats.yeast,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        if (state is CatsEmptyState) {
          return const Center(
            child: Text(
              'No data received. Press button "Load"',
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        if (state is CatsErrorState) {
          return const Center(
            child: Text(
              'Error fetching cats',
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
