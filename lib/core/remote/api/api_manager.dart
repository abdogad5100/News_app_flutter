import 'package:dio/dio.dart';
import 'package:news_app/core/resources/app_constants.dart';
import 'package:news_app/model/articles_response/Article_response.dart';

import 'package:news_app/model/sources_response/Sources_response.dart';

class ApiManager {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
  }

  // GET https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY

  static Future<SourcesResponse?> getSources(String category) async {
    try {
      var response = await dio.get(
        "/v2/top-headlines/sources",
        queryParameters: {"apiKey": AppConstants.apikey, "category": category},
      );

      SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
      return sourcesResponse;
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<ArticleResponse?> getArticles(String sourceId) async {
    try {
      var response = await dio.get(
        "/v2/everything",
        queryParameters: {"apiKey": AppConstants.apikey, "sources": sourceId},
      );

      ArticleResponse articleResponse = ArticleResponse.fromJson(response.data);
      return articleResponse;
    } catch (e) {
      print(e.toString());
    }
  }
}
