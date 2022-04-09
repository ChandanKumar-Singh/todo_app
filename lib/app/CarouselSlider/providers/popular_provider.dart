import 'package:get/get.dart';

import '../popular_model.dart';

class PopularProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return Popular.fromJson(map);
    //   if (map is List)
    //     return map.map((item) => Popular.fromJson(item)).toList();
    // };
    // httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<dynamic>> getPopular() async {
    try {
      final response =
          await get("https://www.episodate.com/api/most-popular?page=1");
      // print(response.body);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return response.body['tv_shows'];
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Future<Response<Popular>> postPopular(Popular popular) async =>
  //     await post('popular', popular);
  // Future<Response> deletePopular(int id) async => await delete('popular/$id');
}
