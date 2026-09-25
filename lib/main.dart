import 'dart:developer'; // ✅ ADD THIS
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi_diopackage/data/models/post_model.dart'; // ✅ ADD THIS
import 'package:restapi_diopackage/data/repositories/post_repository.dart';
import 'package:restapi_diopackage/logic/cubits/posts_cubit/post_cubit.dart';
import 'package:restapi_diopackage/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PostRepository postRepository = PostRepository();
  List<PostModel> postModels = await postRepository.fetchPosts();
  log(postModels.toString());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed( // ✅ FIX THIS
            seedColor: Colors.deepPurple,
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}