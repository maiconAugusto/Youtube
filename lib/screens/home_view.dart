import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_bloc/blocs/videos_bloc.dart';
import 'package:youtube_bloc/delegates/data_search.dart';
import 'package:youtube_bloc/screens/widget.dart';
import 'package:youtube_bloc/urls/url.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: SizedBox(
          height: 40.0,
          child: Image.network(Url.youtube),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.star,
                size: 20.0,
              )),
          IconButton(
              onPressed: () async {
                String? result =
                    await showSearch(context: context, delegate: DataSearch());
                BlocProvider.getBloc<VideosBloc>().inSearch.add(result);
              },
              icon: const Icon(
                Icons.search,
                size: 20.0,
              ))
        ],
      ),
      body: StreamBuilder(
        stream: BlocProvider.getBloc<VideosBloc>().outVideos,
        builder: (context, dynamic snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (ctx, index) {
              return VideTile(video: snapshot.data[index]);
            },
          );
        },
      ),
    );
  }
}
