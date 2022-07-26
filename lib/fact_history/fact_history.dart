import 'package:cat_trivia/fact_history/bloc/fact_history_bloc.dart';
import 'package:cat_trivia/fact_history/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactHistory extends StatelessWidget {
  static const routeName = '/fact-history';

  const FactHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FactHistoryBloc>(
      create: (context) => FactHistoryBloc()
        ..add(
          FactHistoryLoadEvent(),
        ),
      child: BlocBuilder<FactHistoryBloc, FactHistoryState>(
        builder: (context, state) {
          FactHistoryBloc factsListProvider = BlocProvider.of<FactHistoryBloc>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Favorite facts"),
              centerTitle: true,
            ),
            backgroundColor: Colors.white,
            body: state is FactHistoryInitial
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, i) => DetailCard(
                      cats: factsListProvider.factsBox!.get(factsListProvider.factsBox!.length - 1 - i),
                    ),
                    itemCount: factsListProvider.factsBox!.length,
                  ),
          );
        },
      ),
    );
  }
}
