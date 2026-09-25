import 'package:restapi_diopackage/data/models/post_model.dart';
abstract class PostState {}

// jb page load hoga uske liye
class PostLoadingState extends PostState {}

// data load krne k liye
class PostLoadedState extends PostState {
  final List<PostModel> posts;
  PostLoadedState(this.posts);
}

// error k liye
class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);
}
