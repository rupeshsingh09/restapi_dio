import 'dart:math';

import 'package:dio/dio.dart';

import 'api/api.dart';
import 'package:restapi_diopackage/data/models/post_model.dart';

class PostRepository {


  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try {
      // mtlb ki baseurl ke badd / posts rhega to postmodel open ho jayega
      Response response = await api.sendRequest.get('/posts');
// list me data h esliye
    List <dynamic> postMaps = response.data;
    return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    }
    catch(ex){
      throw ex;
    }
  }

}