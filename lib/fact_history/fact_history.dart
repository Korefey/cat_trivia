import 'package:cat_trivia/fact_history/bloc/fact_history_bloc.dart';
import 'package:cat_trivia/models/cats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactHistory extends StatelessWidget {
  static const routeName = '/fact-history';

  const FactHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FactHistoryBloc>(
      create: (context) => FactHistoryBloc()..add(FactHistoryLoadEvent()),
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
                  ))
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

class DetailCard extends StatelessWidget {
  final Cats cats;

  const DetailCard({Key? key, required this.cats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
          Text(
            cats.name,
            maxLines: 2,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 10),
          Text(cats.yeast, maxLines: 2, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
          ]
        ),
      ),
    );
  }
}
