import 'package:cat_trivia/home_page/bloc/cats_bloc.dart';
import 'package:cat_trivia/fact_history/fact_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CatsBloc catsBloc = BlocProvider.of<CatsBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            catsBloc.add(CatsLoadEvent());
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          child: const Text('Another fact!'),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed(FactHistory.routeName),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          child: const Text('Fact history'),
        ),
      ],
    );
  }
}
