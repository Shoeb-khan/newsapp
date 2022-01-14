import 'package:get/get.dart';
import 'package:newsapp/provider.dart';
import 'package:newsapp/screens/models/newsModel.dart';

class HomeController extends GetxController {

  var loading = true.obs;
  var filter = false.obs;
  var secondfilter = false.obs;
  var currentIndex = 0.obs;
  var currentDataindex = 0.obs;
  List <Newsmodel> newsfeed= RxList<Newsmodel>();
  List<String> filterlist = ["Sources","Sort"];
  List<String> source_list = ["techcrunch","engadget"];
  List<String> sortlist = ["Recent","Popular"];

  @override
  void dispose() {

  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }

  @override
  void onInit() {
    currentIndex.value = -1;
    currentDataindex.value = -1;
    getFeeds();
  }

  void getFeeds() {
    OnProvider().newsFeed().then((value){
      newsfeed.clear();
      newsfeed.add(value);
    } );
  }

  void getFeedsbysort(String sort_list) {
    OnProvider().newsFeedbysort(sort_list).then((value) {
      newsfeed.clear();
      newsfeed.add(value);
    });
  }

  void getFeedsbysource(String source_list) {
    OnProvider().newsFeedbySource(source_list).then((value) {
      newsfeed.clear();
      newsfeed.add(value);
    });
  }
}
