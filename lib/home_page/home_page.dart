import 'package:cat_trivia/home_page/action_buttons.dart';
import 'package:cat_trivia/home_page/bloc/cats_bloc.dart';
import 'package:cat_trivia/home_page/cat_list.dart';
import 'package:cat_trivia/services/cats_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';

  HomePage({Key? key}) : super(key: key);
  final catsRepository = CatsRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CatsRepository(),
      child: BlocProvider(
        create: (context) => CatsBloc(
          catsRepository: context.read<CatsRepository>(),
        )..add(
            CatsInitEvent(),
          ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Cat trivia'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                ActionButtons(),
                CatList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
