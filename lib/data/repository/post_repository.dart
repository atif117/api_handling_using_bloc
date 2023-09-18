import 'package:bloc_api_integ/data/models/psot_model.dart';
import 'package:bloc_api_integ/data/repository/api/api.dart';
import 'package:dio/dio.dart';

class PostRpository {
  final Api _api = Api();
  Future<List<PostModel>> fetchPost() async {
    try {
      Response response = await _api.sendRequest.get("/todos");
      List<dynamic> postData = response.data;
      return postData.map((postMap) => PostModel.fromJson(postMap)).toList();
    } catch (e) {
      throw (e);
    }
  }
}
