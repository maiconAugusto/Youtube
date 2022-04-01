import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_bloc/blocs/videos_bloc.dart';
import 'package:youtube_bloc/screens/home_view.dart';
import 'package:youtube_bloc/services/api.dart';

void main() {
  API().search('eletro');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
      blocs: [
        Bloc((i) => VideosBloc()),
      ],
      dependencies: const [],
    );
  }
}
