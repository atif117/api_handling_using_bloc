import 'package:bloc_api_integ/data/models/psot_model.dart';
import 'package:bloc_api_integ/logic/cubits/post_cubit/post_cubit.dart';
import 'package:bloc_api_integ/logic/cubits/post_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: const Text("API Handling"),
        ),
        body: SafeArea(
          child: BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is LoadedState) {
                return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return _buildPostItem(state.posts[index]);
                  },
                );
              }
              return const Center(child: Text("An Error occured"));
            },
          ),
        ));
  }

  Widget _buildPostItem(PostModel post) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Card(
          elevation: 2,
          child: ListTile(
            title: Text(
              post.title.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle:
                Text(post.completed == true ? "Completed" : "Not Completed"),
          ),
        ),
      ],
    );
  }
}
