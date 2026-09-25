import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi_diopackage/data/repositories/post_repository.dart';
import 'package:restapi_diopackage/logic/cubits/posts_cubit/post_state.dart';
import 'package:restapi_diopackage/data/models/post_model.dart';
import 'package:restapi_diopackage/data/models/post_model.dart';

class PostCubit  extends Cubit<PostState>{
  PostCubit() : super(PostLoadingState()){
    fetchPosts();
  }

  PostRepository postRepository = PostRepository();
  void fetchPosts() async {
    try{
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    }
    catch(ex) {
emit(PostErrorState(ex.toString()));
    }
  }
}