import 'package:bloc_api_integ/data/models/psot_model.dart';
import 'package:bloc_api_integ/data/repository/post_repository.dart';
import 'package:bloc_api_integ/logic/cubits/post_cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(LoadingState()) {
    fetchPost();
  }
  PostRpository postRpository = PostRpository();

  Future<void> fetchPost() async {
    try {
      List<PostModel> posts = await postRpository.fetchPost();
      emit(LoadedState(posts));
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}
