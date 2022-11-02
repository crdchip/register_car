import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:register_driver_car/app/dashboard/model/news_vietname_model.dart';
import 'package:register_driver_car/app/dashboard/model/newsfeed_model.dart';

class HomeController extends GetxController {
  final RxList<Articles> _acticles = <Articles>[].obs;
  // ignore: invalid_use_of_protected_member
  List<Articles> get acticles => _acticles.value;
  set acticles(List<Articles> value) => _acticles.value = value;

  @override
  void onInit() {
    super.onInit();
    getNewfeed();
  }

  Future<void> getNewfeed() async {
    var _dio = Dio();
    Response response;

    var urlApi =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=19bb59bf893645bfbd7764c620135305";

    response = await _dio.get(urlApi);
    Map<String, dynamic> articles = Map.from(response.data);
    List<dynamic> data = articles["articles"];
    acticles = data.map((e) => Articles.fromJson(e)).toList();
  }
}
