import 'dart:convert';
import 'package:http/http.dart';
import 'package:instagram/repositry/modelclass/Instagrammodel.dart';
import 'api_claint.dart';

class Instaapi {
  ApiClient apiClient = ApiClient();

  Future<Instagrammodel> getinstagrammodel(String url) async {
    String trendingpath =
        "https://instagram-downloader-download-instagram-videos-stories.p.rapidapi.com/index?url=$url";
    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Instagrammodel.fromJson(jsonDecode(response.body));
  }
}
