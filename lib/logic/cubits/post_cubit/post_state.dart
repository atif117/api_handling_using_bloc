import 'package:bloc_api_integ/data/models/psot_model.dart';

abstract class PostState {}

class LoadingState extends PostState {}

class LoadedState extends PostState {
  final List<PostModel> posts;
  LoadedState(this.posts);
}

class PostErrorState extends PostState {
  final String message;
  PostErrorState(this.message);
}
