import 'dart:convert';

import 'package:get/get.dart';
import 'package:newsapp/screens/models/newsModel.dart';

class OnProvider extends GetConnect {
  static var baseApi = "https://newsapi.org/v2";
  static var apitoken = "apiKey=64f7b5ea4f8b4f7a99c9f373096ad489";
  @override
  void onInit() {
    httpClient.baseUrl = 'https://newsapi.org/v2/everything?';
  }

  // Sign Up Data
  Future<Newsmodel> newsFeed() async {
    final response = await get('$baseApi/everything?q=tesla&$apitoken',
        contentType: 'application/json');
    if (response.statusCode==500) {
      return Future.error(response.statusText.toString());

    } else {
      Newsmodel values = Newsmodel.fromJson(response.body);
      print(values.articles);

      return values;
    }
  }

  Future<Newsmodel> newsFeedbysort(String sort_list) async {
    if(sort_list== 'Recent')
      sort_list = "publishedAt";
    else
      sort_list = "popularity";
    final response = await get('$baseApi/everything?q=tesla&sortBy=$sort_list&$apitoken',
        contentType: 'application/json');
    if (response.statusCode==500) {
      return Future.error(response.statusText.toString());

    } else {
      Newsmodel values = Newsmodel.fromJson(response.body);
      print(values.articles);

      return values;
    }
  }

  Future<Newsmodel> newsFeedbySource(String source_list) async {
    final response = await get('$baseApi/top-headlines?sources=$source_list&$apitoken',
        contentType: 'application/json');
    if (response.statusCode==500) {
      return Future.error(response.statusText.toString());

    } else {
      Newsmodel values = Newsmodel.fromJson(response.body);
      print(values.articles);

      return values;
    }
  }


  //Log in Data


}